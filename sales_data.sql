-- Insert into Region
INSERT INTO Region (region_id, name, manager_id) VALUES
('r1', 'North America', NULL),
('r2', 'Europe', NULL);

-- Insert into Salesperson
INSERT INTO Salesperson (salesperson_id, first_name, last_name, email, region_id, hire_date, is_active) VALUES
('s1', 'Alice', 'Smith', 'alice@saas.com', 'r1', '2022-01-15', TRUE),
('s2', 'Bob', 'Johnson', 'bob@saas.com', 'r2', '2021-08-20', TRUE),
('s3', 'Carol', 'Lee', 'carol@saas.com', 'r1', '2023-01-10', TRUE),
('s4', 'David', 'Nguyen', 'david@saas.com', 'r1', '2022-05-25', TRUE),
('s5', 'Eve', 'Martinez', 'eve@saas.com', 'r2', '2020-11-18', TRUE),
('s6', 'Frank', 'Brown', 'frank@saas.com', 'r2', '2021-03-08', TRUE),
('s7', 'Grace', 'Taylor', 'grace@saas.com', 'r1', '2022-07-14', TRUE),
('s8', 'Hank', 'Wilson', 'hank@saas.com', 'r2', '2023-04-01', TRUE),
('s9', 'Ivy', 'Anderson', 'ivy@saas.com', 'r1', '2022-09-30', TRUE),
('s10', 'Jack', 'Thomas', 'jack@saas.com', 'r2', '2023-06-05', TRUE);

-- Insert into Customer
INSERT INTO Customer (customer_id, company_name, industry, signup_date, region_id, owner_id) VALUES
('c1', 'Acme Corp', 'E-commerce', '2023-03-10', 'r1', 's1'),
('c2', 'Globex Inc.', 'Fintech', '2023-06-01', 'r2', 's2'),
('c3', 'Initech', 'IT', '2023-02-15', 'r1', 's3'),
('c4', 'Umbrella Corp', 'Pharma', '2023-01-22', 'r2', 's4'),
('c5', 'Hooli', 'Tech', '2023-04-18', 'r1', 's5'),
('c6', 'Soylent', 'Food', '2023-03-01', 'r2', 's6'),
('c7', 'Vehement Capital', 'Finance', '2023-05-09', 'r1', 's7'),
('c8', 'Cyberdyne Systems', 'AI', '2023-06-10', 'r2', 's8'),
('c9', 'Wonka Industries', 'Food', '2023-02-25', 'r1', 's9'),
('c10', 'Stark Industries', 'Defense', '2023-06-30', 'r2', 's10');

-- Insert into Lead
INSERT INTO Lead (lead_id, source, contact_name, email, status, salesperson_id, created_at) VALUES
('l1', 'Web', 'John Doe', 'john@acme.com', 'Contacted', 's1', '2023-02-15'),
('l2', 'Referral', 'Jane Roe', 'jane@globex.com', 'New', 's2', '2023-05-10'),
('l3', 'Event', 'Sam Ray', 'sam@initech.com', 'Contacted', 's3', '2023-01-05'),
('l4', 'Email', 'Nina Park', 'nina@umbrella.com', 'New', 's4', '2023-01-30'),
('l5', 'Web', 'Tom Lane', 'tom@hooli.com', 'Qualified', 's5', '2023-03-15'),
('l6', 'AdWords', 'Lara Croft', 'lara@soylent.com', 'Contacted', 's6', '2023-04-10'),
('l7', 'Referral', 'Rick Sanchez', 'rick@vc.com', 'New', 's7', '2023-04-15'),
('l8', 'LinkedIn', 'Morty Smith', 'morty@cyberdyne.com', 'Contacted', 's8', '2023-05-20'),
('l9', 'Web', 'Willy Wonka', 'willy@wonka.com', 'New', 's9', '2023-02-10'),
('l10', 'Web', 'Tony Stark', 'tony@stark.com', 'Qualified', 's10', '2023-06-15');

-- Insert into Opportunity
INSERT INTO Opportunity (opportunity_id, lead_id, estimated_value, stage, salesperson_id, created_at) VALUES
('o1', 'l1', 15000, 'Proposal', 's1', '2023-02-20'),
('o2', 'l2', 25000, 'Qualification', 's2', '2023-05-15'),
('o3', 'l3', 18000, 'Proposal', 's3', '2023-01-10'),
('o4', 'l4', 22000, 'Proposal', 's4', '2023-02-05'),
('o5', 'l5', 12000, 'Qualification', 's5', '2023-03-20'),
('o6', 'l6', 30000, 'Demo', 's6', '2023-04-15'),
('o7', 'l7', 27000, 'Proposal', 's7', '2023-04-20'),
('o8', 'l8', 32000, 'Negotiation', 's8', '2023-05-25'),
('o9', 'l9', 14000, 'Proposal', 's9', '2023-02-15'),
('o10', 'l10', 50000, 'Proposal', 's10', '2023-06-20');

-- Insert into Deal
INSERT INTO Deal (deal_id, opportunity_id, customer_id, salesperson_id, closed_date, amount, deal_status) VALUES
('d1', 'o1', 'c1', 's1', '2023-03-01', 15000, 'Won'),
('d2', 'o2', 'c2', 's2', '2023-06-01', 25000, 'Won'),
('d3', 'o3', 'c3', 's3', '2023-02-01', 18000, 'Lost'),
('d4', 'o4', 'c4', 's4', '2023-03-10', 22000, 'Won'),
('d5', 'o5', 'c5', 's5', '2023-04-01', 12000, 'Won'),
('d6', 'o6', 'c6', 's6', '2023-05-01', 30000, 'Lost'),
('d7', 'o7', 'c7', 's7', '2023-05-10', 27000, 'Won'),
('d8', 'o8', 'c8', 's8', '2023-06-10', 32000, 'Won'),
('d9', 'o9', 'c9', 's9', '2023-03-01', 14000, 'Lost'),
('d10', 'o10', 'c10', 's10', '2023-07-01', 50000, 'Won');

-- Insert into Product
INSERT INTO Product (product_id, name, description, price_monthly, price_annual) VALUES
('p1', 'Pro Suite', 'Full-feature SaaS package', 499.99, 4999.00),
('p2', 'Basic Plan', 'Entry-level package', 99.99, 999.00),
('p3', 'Startup Plan', 'Affordable SaaS for startups', 149.99, 1499.00),
('p4', 'Enterprise Plan', 'Advanced tools for enterprises', 999.99, 9999.00),
('p5', 'Analytics Add-on', 'Advanced analytics', 199.99, 1999.00),
('p6', 'Security Pack', 'Enhanced security features', 299.99, 2999.00),
('p7', 'API Access', 'Developer tools and API', 49.99, 499.00),
('p8', 'Custom Branding', 'White-label features', 89.99, 899.00),
('p9', 'CRM Integration', 'Built-in CRM connectors', 129.99, 1299.00),
('p10', 'Mobile Access', 'Mobile dashboard', 59.99, 599.00);

-- Insert into Subscription
INSERT INTO Subscription (subscription_id, customer_id, product_id, start_date, end_date, status, monthly_value) VALUES
('sub1', 'c1', 'p1', '2023-03-05', '2024-03-05', 'Active', 499.99),
('sub2', 'c2', 'p2', '2023-06-01', '2024-06-01', 'Active', 99.99),
('sub3', 'c3', 'p3', '2023-02-15', '2024-02-15', 'Active', 149.99),
('sub4', 'c4', 'p4', '2023-01-22', '2024-01-22', 'Active', 999.99),
('sub5', 'c5', 'p5', '2023-04-18', '2024-04-18', 'Cancelled', 199.99),
('sub6', 'c6', 'p6', '2023-03-01', '2024-03-01', 'Active', 299.99),
('sub7', 'c7', 'p7', '2023-05-09', '2024-05-09', 'Active', 49.99),
('sub8', 'c8', 'p8', '2023-06-10', '2024-06-10', 'Trial', 89.99),
('sub9', 'c9', 'p9', '2023-02-25', '2024-02-25', 'Active', 129.99),
('sub10', 'c10', 'p10', '2023-06-30', '2024-06-30', 'Active', 59.99);

-- Insert into Commission
INSERT INTO Commission (commission_id, deal_id, salesperson_id, amount, paid_date) VALUES
('com1', 'd1', 's1', 1500, '2023-03-10'),
('com2', 'd2', 's2', 2500, '2023-06-10'),
('com3', 'd4', 's4', 2200, '2023-03-15'),
('com4', 'd5', 's5', 1200, '2023-04-10'),
('com5', 'd7', 's7', 2700, '2023-05-15'),
('com6', 'd8', 's8', 3200, '2023-06-15'),
('com7', 'd10', 's10', 5000, '2023-07-10'),
('com8', 'd3', 's3', 0, NULL),
('com9', 'd6', 's6', 0, NULL),
('com10', 'd9', 's9', 0, NULL);

-- Insert into SalesActivity
INSERT INTO SalesActivity (activity_id, salesperson_id, lead_id, activity_type, notes, activity_date) VALUES
('a1', 's1', 'l1', 'Call', 'Spoke with John about features', '2023-02-16'),
('a2', 's2', 'l2', 'Email', 'Sent pricing sheet to Jane', '2023-05-11'),
('a3', 's3', 'l3', 'Meeting', 'Demoed product to Sam', '2023-01-12'),
('a4', 's4', 'l4', 'Email', 'Follow-up with Nina', '2023-02-07'),
('a5', 's5', 'l5', 'Call', 'Intro call with Tom', '2023-03-16'),
('a6', 's6', 'l6', 'Email', 'Sent demo video to Lara', '2023-04-12'),
('a7', 's7', 'l7', 'Call', 'Initial call with Rick', '2023-04-16'),
('a8', 's8', 'l8', 'Meeting', 'Demo with Morty', '2023-05-22'),
('a9', 's9', 'l9', 'Call', 'Talked with Willy about needs', '2023-02-12'),
('a10', 's10', 'l10', 'Email', 'Follow-up with Tony on proposal', '2023-06-17');
