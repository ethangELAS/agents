import os
from fastapi import FastAPI, HTTPException
from databases import Database
from pydantic import BaseModel
import openai
from contextlib import asynccontextmanager

DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql+asyncpg://nl2sql_user:nl2sql_pass@localhost:5432/nl2sql_db"
)

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
if not OPENAI_API_KEY:
    raise RuntimeError("OPENAI_API_KEY environment variable not set.")
openai.api_key = OPENAI_API_KEY

database = Database(DATABASE_URL)

@asynccontextmanager
async def lifespan(app):
    await database.connect()
    yield
    await database.disconnect()

app = FastAPI(lifespan=lifespan)

class NL2SQLRequest(BaseModel):
    question: str

def build_analysis(question, sql, error=None):
    analysis = f"User asked: '{question}'. "
    analysis += "The LLM interpreted this as a request to: "
    # Generalize: summarize the question and SQL intent
    analysis += f"'{question.strip()}' was translated to the SQL: {sql}. "
    if error:
        analysis += f"However, an error occurred: {error}. "
        analysis += "This could be an issue with the SQL syntax or the schema. User may need to adjust their question for clarity."
    else:
        analysis += "The SQL was executed without error. "
    analysis += "Always check that the SQL matches the user's intent and the schema."
    return analysis

@app.post("/nl2sql")
async def nl2sql_endpoint(request: NL2SQLRequest):
    schema = """
Tables:
- departments(id, name)
- employees(id, name, department_id, position, salary)
- projects(id, name, department_id, budget)
- attendance(id, employee_id, date, status)
- reviews(id, employee_id, review_date, score, comments)
- customers(id, name, email, phone)
- products(id, name, category, price)
- orders(id, customer_id, order_date, total)
- order_items(id, order_id, product_id, quantity)
- payments(id, order_id, payment_date, amount, method)
"""
    prompt = f"""
Given the following PostgreSQL database schema:
{schema}

Write a single, complete SQL query that answers the user's question.
- Only use the tables and columns listed in the schema.
- Use fully qualified column names (e.g., employees.name).
- NEVER guess columns or tables that do not exist.
- Every SQL query must include at least a SELECT clause and a FROM clause.
- Never omit the FROM clause.
- Only return the SQL query, nothing else.


User question: {request.question}
SQL:
"""
    try:
        response = openai.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": prompt}],
            max_tokens=256,
            temperature=0
        )
        full_llm_response = response.choices[0].message.content.strip()
        sql = " ".join(line.strip() for line in full_llm_response.splitlines() if line.strip())
        rows = await database.fetch_all(sql)
        result = [dict(row) for row in rows]
        tokens_used = response.usage.total_tokens if hasattr(response, 'usage') and response.usage else None
        input_tokens = response.usage.prompt_tokens if hasattr(response, 'usage') and response.usage else None
        output_tokens = response.usage.completion_tokens if hasattr(response, 'usage') and response.usage else None
        system_thoughts = {
            "llm_response": full_llm_response,
            "analysis": build_analysis(request.question, full_llm_response, sql)
        }
        return {
            "question": request.question,
            "sql": sql,
            "result": result,
            "source": "openai",
            "system_thoughts": system_thoughts,
            "input_tokens": input_tokens,
            "output_tokens": output_tokens
        }
    except Exception as e:
        sql = locals().get('sql', None)
        full_llm_response = locals().get('full_llm_response', None)
        tokens_used = locals().get('response', None)
        input_tokens = tokens_used.usage.prompt_tokens if tokens_used and hasattr(tokens_used, 'usage') and tokens_used.usage else None
        output_tokens = tokens_used.usage.completion_tokens if tokens_used and hasattr(tokens_used, 'usage') and tokens_used.usage else None
        system_thoughts = {
            "llm_response": full_llm_response,
            "analysis": build_analysis(request.question, full_llm_response, sql, error=e)
        }
        return {
            "question": request.question,
            "sql": sql,
            "error": str(e),
            "source": "openai",
            "system_thoughts": system_thoughts,
            "input_tokens": input_tokens,
            "output_tokens": output_tokens
        }
