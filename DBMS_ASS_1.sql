CREATE DATABASE sem2_assignment;
USE dbms_ass;

create table customer(
customer_id INT Auto_increment primary key,
full_name varchar(50) not null,
email varchar (50) not null unique,
phone varchar(15),
created_at datetime default current_timestamp
);

create table branch(
branch_id int auto_increment primary key,
branch_name varchar(60) not null,
city varchar(60) not null
);

create table employee(
employee_id int auto_increment primary key,
branch_id int not null,
employee_name varchar(60) not null,
role varchar(60),
foreign key (branch_id) references branch(branch_id)
);


create table acc_type(
acc_type_id int auto_increment primary key,
type_name varchar(60) not null unique
);


create table account1(
acc_id int auto_increment primary key,
acc_type_id int not null,
branch_id int not null,
balance decimal(15,2) not null check (balance >= 0),
opened_date date ,
foreign key (acc_type_id) references acc_type(acc_type_id),
foreign key ( branch_id ) references branch(branch_id)
);




create table customer_account(
customer_id int,
acc_id int,
primary key ( customer_id , acc_id ),
foreign key (customer_id) references customer(customer_id),
foreign key (acc_id) references account1(acc_id)
);



create table transaction(
transanction_id int auto_increment primary key,
acc_id int not null,
transaction_type varchar(20) not null,
amount decimal(15,2) not null check (amount > 0),
transaction_date datetime default current_timestamp,
foreign key ( acc_id ) references account1(acc_id)
);



create table investment(
investment_id int auto_increment primary key ,
customer_id int not null,
investment_type varchar(50),
start_date date,
foreign key ( customer_id ) references customer(customer_id)
);

create table asset (
asset_id int auto_increment primary key,
asset_name varchar(60) not null,
asset_type varchar(60),
market_price decimal(10,2) not null
);

create table investment_asset (
investment_id int,
asset_id int,
quantity int not null check ( quantity > 0),
primary key ( investment_id , asset_id ) ,
foreign key ( investment_id ) references investment(investment_id),
foreign key (asset_id) references asset(asset_id)
);

create table loan(
loan_id int auto_increment primary key,
customer_id int not null,
loan_amount decimal(15,2) not null check (loan_amount > 0),
interest_rate decimal(5,2) check (interest_rate > 0 ),
start_date date,
foreign key (customer_id) references customer(customer_id)
);


create table payment(
payment_id int auto_increment primary key,
loan_id int not null,
payment_amount decimal(15,2) not null,
payment_date date,
foreign key (loan_id ) references loan(loan_id)
);

insert into Customer values
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Berlin', '2023-01-10'),
(2, 'Anita Mehta', 'anita@gmail.com', 'Munich', '2023-02-15'),
(3, 'Vikram Singh', 'vikram@gmail.com', 'Hamburg', '2023-03-12'),
(4, 'Neha Patel', 'neha@gmail.com', 'Frankfurt', '2023-04-05'),
(5, 'Amit Verma', 'amit@gmail.com', 'Cologne', '2023-05-20'),
(6, 'Pooja Iyer', 'pooja@gmail.com', 'Berlin', '2023-06-10'),
(7, 'Suresh Kumar', 'suresh@gmail.com', 'Stuttgart', '2023-07-08'),
(8, 'Riya Kapoor', 'riya@gmail.com', 'Leipzig', '2023-08-14'),
(9, 'Arjun Malhotra', 'arjun@gmail.com', 'Dresden', '2023-09-02'),
(10, 'Kavita Joshi', 'kavita@gmail.com', 'Bonn', '2023-10-18');

insert into branch values
(1, 'Berlin Central', 'Berlin'),
(2, 'Munich Main', 'Munich'),
(3, 'Hamburg North', 'Hamburg'),
(4, 'Frankfurt City', 'Frankfurt'),
(5, 'Cologne West', 'Cologne'),
(6, 'Stuttgart Hub', 'Stuttgart'),
(7, 'Leipzig Point', 'Leipzig'),
(8, 'Dresden Square', 'Dresden'),
(9, 'Bonn Park', 'Bonn'),
(10, 'Essen Plaza', 'Essen');

insert into branch values
(1, 'Savings', 3.5),
(2, 'Current', 0.0),
(3, 'Fixed Deposit', 6.5),
(4, 'Recurring Deposit', 5.8),
(5, 'Salary Account', 2.5),
(6, 'Student Account', 1.5),
(7, 'Business Account', 0.0),
(8, 'Joint Savings', 3.2),
(9, 'Premium Savings', 4.2),
(10, 'NRI Account', 4.8);

insert into employee(branch_id, employee_name, role)values
(1, 'Amit Khanna', 'Branch Manager'),
(2, 'Neha Arora', 'Relationship Manager'),
(3, 'Sandeep Roy', 'Loan Officer'),
(4, 'Pooja Mehul', 'Investment Advisor'),
(5, 'Rahul Nair', 'Customer Support'),
(6, 'Sneha Kapoor', 'Operations Executive'),
(7, 'Vikram Desai', 'Risk Analyst'),
(8, 'Anjali Verma', 'Cashier'),
(9, 'Karan Malhotra', 'Compliance Officer'),
(10, 'Ritu Sharma', 'HR Executive');

insert into acc_type (type_name)values
('Savings'),
('Current'),
('Fixed Deposit'),
('Recurring Deposit'),
('Salary Account'),
('Student Account'),
('Business Account'),
('Joint Account'),
('Premium Savings'),
('NRI Account');

insert into account1(acc_type_id,branch_id,balance,opened_date)values
(1, 1, 15000.00, '2023-01-10'),
(2, 2, 25000.00, '2023-02-15'),
(1, 3, 18000.00, '2023-03-12'),
(3, 4, 50000.00, '2023-04-05'),
(2, 5, 30000.00, '2023-05-20'),
(4, 6, 22000.00, '2023-06-10'),
(5, 7, 17000.00, '2023-07-08'),
(6, 8, 9000.00,  '2023-08-14'),
(8, 9, 27000.00, '2023-09-02'),
(9, 10, 45000.00, '2023-10-18');

UPDATE account1
SET balance = 45000.00
WHERE acc_id = 5;


insert into customer_account values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 9),
(9, 9),
(10, 10);

insert into transaction(acc_id, transaction_type, amount)values
(1, 'Deposit', 5000),
(2, 'Withdrawal', 3000),
(3, 'Deposit', 4000),
(4, 'Deposit', 7000),
(5, 'Withdrawal', 2500),
(6, 'Deposit', 3500),
(7, 'Withdrawal', 2000),
(8, 'Deposit', 1500),
(9, 'Deposit', 6000),
(10, 'Deposit', 8000);

insert into investment(customer_id,investment_type,start_date)values
(1, 'Mutual Fund', '2023-02-01'),
(2, 'Stocks', '2023-03-10'),
(3, 'Bonds', '2023-04-15'),
(4, 'ETF', '2023-05-20'),
(5, 'Gold', '2023-06-18'),
(6, 'Mutual Fund', '2023-07-12'),
(7, 'Stocks', '2023-08-05'),
(8, 'ETF', '2023-09-10'),
(9, 'Real Estate Fund', '2023-10-01'),
(10, 'Bonds', '2023-11-05');

insert into asset (asset_name, asset_type, market_price) values
('Reliance Equity', 'Stock', 2500),
('Government Bond 10Y', 'Bond', 1050),
('Gold ETF', 'Commodity', 5800),
('S&P 500 ETF', 'ETF', 4500),
('Tech Mutual Fund', 'Mutual Fund', 3200),
('Real Estate Trust', 'Real Estate', 6200),
('Energy Fund', 'Mutual Fund', 2800),
('Auto Stock', 'Stock', 2100),
('Silver ETF', 'Commodity', 3100),
('Corporate Bond AAA', 'Bond', 1200);

insert into investment_asset values
(1, 5, 10),
(2, 1, 15),
(3, 2, 20),
(4, 4, 12),
(5, 3, 8),
(6, 7, 10),
(7, 8, 25),
(8, 4, 14),
(9, 6, 5),
(10, 10, 30);

insert into loan(customer_id,loan_amount,interest_rate,start_date)values
(1, 50000, 7.5, '2023-01-15'),
(2, 75000, 8.2, '2023-02-10'),
(3, 60000, 7.8, '2023-03-20'),
(4, 90000, 8.5, '2023-04-18'),
(5, 45000, 7.2, '2023-05-22'),
(6, 80000, 8.0, '2023-06-15'),
(7, 55000, 7.6, '2023-07-10'),
(8, 65000, 8.1, '2023-08-05'),
(9, 100000, 9.0, '2023-09-12'),
(10, 120000, 9.5, '2023-10-01');

insert into payment(loan_id,payment_amount,payment_date)values
(1, 5000, '2023-02-15'),
(2, 6000, '2023-03-15'),
(3, 5500, '2023-04-25'),
(4, 7000, '2023-05-30'),
(5, 4500, '2023-06-28'),
(6, 6500, '2023-07-20'),
(7, 5200, '2023-08-18'),
(8, 5800, '2023-09-20'),
(9, 8000, '2023-10-20'),
(10, 9000, '2023-11-15');

UPDATE payment
SET payment_amount = 55000.00
WHERE loan_id = 3;

UPDATE payment
SET payment_amount = 44500.00
WHERE loan_id = 5;

/* TAsk :- 2 */ 


CREATE VIEW Customer_Loan_Summary AS
SELECT c.customer_id,c.full_name,SUM(l.loan_amount) AS total_loan_amount,
    COALESCE(SUM(p.payment_amount), 0) AS total_paid_amount
FROM Customer c
JOIN Loan l ON c.customer_id = l.customer_id
LEFT JOIN Payment p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.full_name;

SELECT customer_id,full_name,total_loan_amount - total_paid_amount AS outstanding_amount
FROM Customer_Loan_Summary
ORDER BY outstanding_amount DESC;



CREATE VIEW Monthly_Transaction_Trend AS
SELECT acc_id,DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month,COUNT(transanction_id) AS total_transactions,SUM(amount) AS total_transaction_amount
FROM Transaction
GROUP BY acc_id, DATE_FORMAT(transaction_date, '%Y-%m');


SELECT 
    at.type_name,mtt.transaction_month,SUM(mtt.total_transaction_amount) AS total_amount
FROM Monthly_Transaction_Trend mtt
JOIN account1 a ON mtt.acc_id = a.acc_id
JOIN acc_type at ON a.acc_type_id = at.acc_type_id
GROUP BY at.type_name, mtt.transaction_month
ORDER BY at.type_name, mtt.transaction_month;




/* Task :- 3 second */ 

/* How financially healthy is each customer considering total balance vs total loan exposure? */

SELECT 
    c.customer_id,c.full_name,
    SUM(DISTINCT a.balance) AS total_balance,
    SUM(DISTINCT l.loan_amount) AS total_loan,
    CASE
        WHEN SUM(a.balance) > SUM(l.loan_amount) THEN 'Financially Strong'
        WHEN SUM(a.balance) = SUM(l.loan_amount) THEN 'Balanced'
        ELSE 'Financially Risky'
    END AS financial_status
FROM customer c
LEFT JOIN customer_account ca ON c.customer_id = ca.customer_id
LEFT JOIN account1 a ON ca.acc_id = a.acc_id
LEFT JOIN loan l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.full_name;



/* Which accounts show unusually high transaction activity compared to the average? /
 Which customers have taken loans higher than the bank’s average loan amount? */ 

SELECT 
    c.customer_id,
    c.full_name,
    l.loan_amount
FROM loan l
JOIN customer c ON l.customer_id = c.customer_id
WHERE l.loan_amount > (
    SELECT AVG(loan_amount) FROM loan
);

/* Are customers over-invested in a single asset? */ 

SELECT 
    c.customer_id,
    c.full_name,
    a.asset_name,
    SUM(ia.quantity * a.market_price) AS asset_value,
    ROUND(
        SUM(ia.quantity * a.market_price) /
        SUM(SUM(ia.quantity * a.market_price)) OVER (PARTITION BY c.customer_id) * 100, 2
    ) AS portfolio_percentage
FROM customer c
JOIN investment i ON c.customer_id = i.customer_id
JOIN investment_asset ia ON i.investment_id = ia.investment_id
JOIN asset a ON ia.asset_id = a.asset_id
GROUP BY c.customer_id, c.full_name, a.asset_name;


/*JOin , aggregation CASE , Which customers are disciplined payers and which are risky defaulters? */ 

SELECT 
    c.customer_id,
    c.full_name,
    l.loan_amount,
    SUM(p.payment_amount) AS total_paid,
    CASE
        WHEN SUM(p.payment_amount) >= l.loan_amount * 0.6 THEN 'Good Repayment'
        WHEN SUM(p.payment_amount) >= l.loan_amount * 0.3 THEN 'Average Repayment'
        ELSE 'Poor Repayment'
    END AS repayment_status
FROM customer c
JOIN loan l ON c.customer_id = l.customer_id
LEFT JOIN payment p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.full_name, l.loan_amount;

/* Rank window , join , aggregation  Which branches generate the highest total deposits? */ 

SELECT 
    b.branch_name,
    b.city,
    SUM(a.balance) AS total_branch_balance,
    RANK() OVER (ORDER BY SUM(a.balance) DESC) AS branch_rank
FROM branch b
JOIN account1 a ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name, b.city;


/* Customer 360° Financial Snapshot */ 

DELIMITER $$

CREATE PROCEDURE CustomerFinancialSnapshot(IN cust_id INT)
BEGIN
    SELECT 
        c.full_name,
        IFNULL(SUM(DISTINCT a.balance),0) AS total_balance,
        IFNULL(SUM(DISTINCT l.loan_amount),0) AS total_loans,
        IFNULL(SUM(p.payment_amount),0) AS total_payments
    FROM customer c
    LEFT JOIN customer_account ca ON c.customer_id = ca.customer_id
    LEFT JOIN account1 a ON ca.acc_id = a.acc_id
    LEFT JOIN loan l ON c.customer_id = l.customer_id
    LEFT JOIN payment p ON l.loan_id = p.loan_id
    WHERE c.customer_id = cust_id
    GROUP BY c.full_name;
END $$

DELIMITER ;

CALL CustomerFinancialSnapshot(1);



/* Classify loan risk based on interest rate */ 

DELIMITER $$

CREATE FUNCTION LoanRiskLevel(rate DECIMAL(5,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    RETURN
        CASE
            WHEN rate >= 9 THEN 'High Risk'
            WHEN rate BETWEEN 7.5 AND 8.9 THEN 'Medium Risk'
            ELSE 'Low Risk'
        END;
END $$

DELIMITER ;

SELECT 
    loan_id,
    loan_amount,
    LoanRiskLevel(interest_rate) AS risk_category
FROM loan;

/* Task 5 */ 

CREATE INDEX idx_customer_account_customer 
ON customer_account(customer_id);

CREATE INDEX idx_customer_account_acc 
ON customer_account(acc_id);

CREATE INDEX idx_account_branch 
ON account1(branch_id);

CREATE INDEX idx_loan_customer 
ON loan(customer_id);

CREATE INDEX idx_payment_loan 
ON payment(loan_id);

SELECT 
    c.full_name,
    IFNULL(a.total_balance,0) AS total_balance,
    IFNULL(l.total_loans,0) AS total_loans,
    IFNULL(p.total_payments,0) AS total_payments
FROM customer c
LEFT JOIN (
    SELECT ca.customer_id, SUM(a.balance) AS total_balance
    FROM customer_account ca
    JOIN account1 a ON ca.acc_id = a.acc_id
    GROUP BY ca.customer_id
) a ON c.customer_id = a.customer_id
LEFT JOIN (
    SELECT customer_id, SUM(loan_amount) AS total_loans
    FROM loan
    GROUP BY customer_id
) l ON c.customer_id = l.customer_id
LEFT JOIN (
    SELECT l.customer_id, SUM(p.payment_amount) AS total_payments
    FROM loan l
    JOIN payment p ON l.loan_id = p.loan_id
    GROUP BY l.customer_id
) p ON c.customer_id = p.customer_id
WHERE c.customer_id = 1 ;



