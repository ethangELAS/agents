-- Sales Schema for SaaS Company (Enterprise-Ready)

-- Drop tables if they exist (in dependency order)
DROP TABLE IF EXISTS SalesActivity;
DROP TABLE IF EXISTS Commission;
DROP TABLE IF EXISTS Subscription;
DROP TABLE IF EXISTS Deal;
DROP TABLE IF EXISTS Opportunity;
DROP TABLE IF EXISTS Lead;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Salesperson;
DROP TABLE IF EXISTS Region;

-- Create Region Table
CREATE TABLE Region (
    region_id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    manager_id UUID
);

-- Create Salesperson Table
CREATE TABLE Salesperson (
    salesperson_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    region_id UUID REFERENCES Region(region_id) ON DELETE SET NULL,
    hire_date DATE,
    is_active BOOLEAN DEFAULT TRUE
);

-- Create Customer Table
CREATE TABLE Customer (
    customer_id UUID PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    industry VARCHAR(100),
    signup_date DATE,
    region_id UUID REFERENCES Region(region_id) ON DELETE SET NULL,
    owner_id UUID REFERENCES Salesperson(salesperson_id) ON DELETE SET NULL
);

-- Create Lead Table
CREATE TABLE Lead (
    lead_id UUID PRIMARY KEY,
    source VARCHAR(100),
    contact_name VARCHAR(255),
    email VARCHAR(255),
    status VARCHAR(50),
    salesperson_id UUID REFERENCES Salesperson(salesperson_id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Opportunity Table
CREATE TABLE Opportunity (
    opportunity_id UUID PRIMARY KEY,
    lead_id UUID REFERENCES Lead(lead_id) ON DELETE SET NULL,
    estimated_value DECIMAL(12,2),
    stage VARCHAR(50),
    salesperson_id UUID REFERENCES Salesperson(salesperson_id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Deal Table
CREATE TABLE Deal (
    deal_id UUID PRIMARY KEY,
    opportunity_id UUID REFERENCES Opportunity(opportunity_id) ON DELETE SET NULL,
    customer_id UUID REFERENCES Customer(customer_id) ON DELETE CASCADE,
    salesperson_id UUID REFERENCES Salesperson(salesperson_id) ON DELETE SET NULL,
    closed_date DATE,
    amount DECIMAL(12,2),
    deal_status VARCHAR(50)
);

-- Create Product Table
CREATE TABLE Product (
    product_id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price_monthly DECIMAL(10,2),
    price_annual DECIMAL(10,2)
);

-- Create Subscription Table
CREATE TABLE Subscription (
    subscription_id UUID PRIMARY KEY,
    customer_id UUID REFERENCES Customer(customer_id) ON DELETE CASCADE,
    product_id UUID REFERENCES Product(product_id) ON DELETE SET NULL,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    monthly_value DECIMAL(10,2)
);

-- Create Commission Table
CREATE TABLE Commission (
    commission_id UUID PRIMARY KEY,
    deal_id UUID REFERENCES Deal(deal_id) ON DELETE CASCADE,
    salesperson_id UUID REFERENCES Salesperson(salesperson_id) ON DELETE SET NULL,
    amount DECIMAL(12,2),
    paid_date DATE
);

-- Create SalesActivity Table
CREATE TABLE SalesActivity (
    activity_id UUID PRIMARY KEY,
    salesperson_id UUID REFERENCES Salesperson(salesperson_id) ON DELETE SET NULL,
    lead_id UUID REFERENCES Lead(lead_id) ON DELETE SET NULL,
    activity_type VARCHAR(50),
    notes TEXT,
    activity_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
