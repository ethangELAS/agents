-- Component 1: Company
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department_id INTEGER REFERENCES departments(id),
    position VARCHAR(50),
    salary INTEGER
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department_id INTEGER REFERENCES departments(id),
    budget INTEGER
);

CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(id),
    date DATE,
    status VARCHAR(20)
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(id),
    review_date DATE,
    score INTEGER,
    comments TEXT
);

-- Component 2: Sales
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price INTEGER
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    order_date DATE,
    total INTEGER
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    payment_date DATE,
    amount INTEGER,
    method VARCHAR(20)
);

-- Insert data for departments
INSERT INTO departments (name) VALUES
('Engineering'), ('Marketing'), ('HR'), ('Sales'), ('Finance'),
('Support'), ('IT'), ('Legal'), ('R&D'), ('Operations');

-- Insert data for employees
INSERT INTO employees (name, department_id, position, salary) VALUES
('Alice Smith', 1, 'Engineer', 90000),
('Bob Johnson', 2, 'Marketer', 75000),
('Carol Lee', 3, 'HR Manager', 65000),
('David Kim', 4, 'Sales Rep', 70000),
('Eva Brown', 5, 'Accountant', 80000),
('Frank White', 6, 'Support Agent', 60000),
('Grace Green', 7, 'IT Specialist', 85000),
('Henry Black', 8, 'Lawyer', 95000),
('Ivy Blue', 9, 'Researcher', 92000),
('Jack Red', 10, 'Ops Manager', 88000);

-- Insert data for projects
INSERT INTO projects (name, department_id, budget) VALUES
('Project Apollo', 1, 100000),
('Project Mercury', 2, 80000),
('Project Gemini', 3, 60000),
('Project Orion', 4, 90000),
('Project Artemis', 5, 120000),
('Project Vega', 6, 70000),
('Project Nova', 7, 110000),
('Project Luna', 8, 95000),
('Project Mars', 9, 130000),
('Project Jupiter', 10, 105000);

-- Insert data for attendance
INSERT INTO attendance (employee_id, date, status) VALUES
(1, '2024-06-01', 'Present'),
(2, '2024-06-01', 'Present'),
(3, '2024-06-01', 'Absent'),
(4, '2024-06-01', 'Present'),
(5, '2024-06-01', 'Present'),
(6, '2024-06-01', 'Present'),
(7, '2024-06-01', 'Present'),
(8, '2024-06-01', 'Absent'),
(9, '2024-06-01', 'Present'),
(10, '2024-06-01', 'Present');

INSERT INTO attendance (employee_id, date, status) VALUES
(1, '2024-06-02', 'Present'),
(2, '2024-06-02', 'Absent'),
(3, '2024-06-02', 'Present'),
(4, '2024-06-02', 'Present'),
(5, '2024-06-02', 'Present'),
(6, '2024-06-02', 'Present'),
(7, '2024-06-02', 'Present'),
(8, '2024-06-02', 'Present'),
(9, '2024-06-02', 'Absent'),
(10, '2024-06-02', 'Present');

-- Insert data for reviews
INSERT INTO reviews (employee_id, review_date, score, comments) VALUES
(1, '2024-05-01', 8, 'Good performance'),
(2, '2024-05-01', 7, 'Solid work'),
(3, '2024-05-01', 6, 'Needs improvement'),
(4, '2024-05-01', 9, 'Excellent sales'),
(5, '2024-05-01', 8, 'Reliable'),
(6, '2024-05-01', 7, 'Consistent'),
(7, '2024-05-01', 8, 'Great IT support'),
(8, '2024-05-01', 9, 'Outstanding legal advice'),
(9, '2024-05-01', 7, 'Innovative'),
(10, '2024-05-01', 8, 'Efficient manager');

-- Insert data for customers
INSERT INTO customers (name, email, phone) VALUES
('Acme Corp', 'contact@acme.com', '123-456-7890'),
('Beta LLC', 'info@beta.com', '234-567-8901'),
('Gamma Inc', 'hello@gamma.com', '345-678-9012'),
('Delta Ltd', 'sales@delta.com', '456-789-0123'),
('Epsilon Co', 'support@epsilon.com', '567-890-1234'),
('Zeta Group', 'admin@zeta.com', '678-901-2345'),
('Eta Partners', 'partners@eta.com', '789-012-3456'),
('Theta Solutions', 'solutions@theta.com', '890-123-4567'),
('Iota Services', 'services@iota.com', '901-234-5678'),
('Kappa Enterprises', 'contact@kappa.com', '012-345-6789');

-- Insert data for products
INSERT INTO products (name, category, price) VALUES
('Widget A', 'Gadgets', 100),
('Widget B', 'Gadgets', 150),
('Gizmo X', 'Gizmos', 200),
('Gizmo Y', 'Gizmos', 250),
('Tool Alpha', 'Tools', 300),
('Tool Beta', 'Tools', 350),
('Device 1', 'Devices', 400),
('Device 2', 'Devices', 450),
('Accessory Q', 'Accessories', 50),
('Accessory R', 'Accessories', 75);

-- Insert data for orders
INSERT INTO orders (customer_id, order_date, total) VALUES
(1, '2024-06-01', 500),
(2, '2024-06-02', 300),
(3, '2024-06-03', 700),
(4, '2024-06-04', 200),
(5, '2024-06-05', 400),
(6, '2024-06-06', 600),
(7, '2024-06-07', 800),
(8, '2024-06-08', 350),
(9, '2024-06-09', 450),
(10, '2024-06-10', 550);

-- Insert data for order_items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 4, 2),
(3, 5, 1),
(3, 6, 2),
(4, 7, 1),
(4, 8, 1),
(5, 9, 3),
(5, 10, 2);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(6, 1, 1),
(7, 2, 2),
(8, 3, 1),
(9, 4, 1),
(10, 5, 2);

-- Insert data for payments
INSERT INTO payments (order_id, payment_date, amount, method) VALUES
(1, '2024-06-01', 500, 'Credit Card'),
(2, '2024-06-02', 300, 'PayPal'),
(3, '2024-06-03', 700, 'Credit Card'),
(4, '2024-06-04', 200, 'Wire Transfer'),
(5, '2024-06-05', 400, 'Credit Card'),
(6, '2024-06-06', 600, 'PayPal'),
(7, '2024-06-07', 800, 'Credit Card'),
(8, '2024-06-08', 350, 'Wire Transfer'),
(9, '2024-06-09', 450, 'Credit Card'),
(10, '2024-06-10', 550, 'PayPal'); 