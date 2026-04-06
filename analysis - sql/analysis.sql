-- Createing customers table
create table customers (
    customer_id VARCHAR(20) primary key,
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    monthly_income INT,
    employment_type VARCHAR(50),
    credit_score INT,
    education_level VARCHAR(50),
    marital_status VARCHAR(20),
    account_age_months INT,    
    duration_in_business INT,
    no_of_loans_taken INT
);

-- Creating loans table
create table loans (
    loan_id VARCHAR(20) primary key,
    customer_id VARCHAR(20) references customers(customer_id),
    sanctioned_date DATE,
    loan_amount INT,
    loan_tenure_months INT,
    interest_rate DECIMAL(5,2),
    loan_purpose VARCHAR(100),
    monthly_installment DECIMAL(10,2),
    loan_status VARCHAR(50),
    loan_end_date DATE,
    risk_category VARCHAR(20),
    total_installments INT,
    loan_duration_days INT,
    is_default INT,
    late_payment_ratio DECIMAL(6,4),
    monthly_income INT,
    debt_to_income_ratio DECIMAL(6,4),
    total_missed_payments INT
);

-- Creating payments column
create table payments (
    payment_id VARCHAR(20) primary key,
    loan_id VARCHAR(20) references loans(loan_id),
    installment_number INT,
    due_date DATE,
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(50),
    payment_delay_days INT,
    penalty_amount INT,
    remaining_balance DECIMAL(12,2),
    is_late_payment INT,
    is_missed_payment INT
);

-- Section 1 — Core KPI Layer (This is KPIs section.)
-- 1. Overall Default Rate (%) Core PRIMARY KPI
select 
	round(count(loan_id) * 100.0 / (select count(loan_id) from loans),2) as default_rate
from loans
where is_default = 1;

-- 2. Total Defaulted Loans
select sum(is_default) from loans;

-- 3. Total Defaulted Amount
select 
	sum(loan_amount) as defaulted_amount 
from loans
where is_default = 1;

-- 4. Default Rate Over Time
select 
extract('month' from sanctioned_date) as loan_month,
extract('year' from sanctioned_date) as loan_year,
count(loan_id) as loans_issued,
sum(is_default) as defaulted_loan,
round(sum(is_default)*100.0/count(loan_id),2) as default_ratio
from loans
group by loan_month,loan_year
order by loan_year, loan_month

-- Default Exposure Ratio
SELECT 
    ROUND(
        SUM(CASE WHEN is_default = 1 THEN loan_amount ELSE 0 END) 
        * 100.0 / SUM(loan_amount),
        2
    ) AS default_exposure_percent
FROM loans;

-- Section 2 — Loan Risk Analysis (Driver Metrics)
-- 1. Default Rate by Loan Amount
with base as (
    select loan_id,loan_amount,is_default,
        case 
            when loan_amount >= 150000 then 4 
            when loan_amount >= 100000 then 3 
            when loan_amount >= 50000  then 2 
            else 1 
        end as bucket
    from loans
) 
select 
    bucket, 
    min(loan_amount) as starting_range, 
    max(loan_amount) as ending_range, 
    count(loan_id) as no_of_loans,
    round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate_by_bucket
from base
group by bucket
order by bucket;

-- 2. Default Rate by Loan Tenure
with base as (
select loan_tenure_months, loan_id, is_default,
case
	when loan_tenure_months >= 18 then '18-24'
	when loan_tenure_months >= 12 then '12-17'
	when loan_tenure_months >= 6 then '6-11'
	else '<6'
end as month_bucket
from loans
) 
select month_bucket, count(loan_id) as loan_issued, sum(is_default) as loans_defaulted,
round((sum(is_default)*100.0/count(loan_id)),2) as default_rate_by_tenure
from base
group by month_bucket;

-- 3. Default Rate by Interest Rate
with base as (
select loan_id, interest_rate, is_default,
case
	when interest_rate >= 20 then '3. High Interest'
	when interest_rate >= 16 then '2. Normal Interest'
	else '1. Low Interest'
end as tenure_bucket
from loans
) 
select tenure_bucket, count(loan_id) as loan_issued, sum(is_default) as loans_defaulted,
round((sum(is_default)*100.0/count(loan_id)),2) as default_rate_by_rate
from base
group by tenure_bucket
order by tenure_bucket;

-- 4. Default Rate by Loan Purpose
select loan_purpose, count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default)*100.0/count(loan_id),2) as default_rate_by_purpose
from loans
group by loan_purpose;

-- monthly_installment
-- Default Rate by Monthly Installment Size
with base as (
    select 
        loan_id, 
        is_default,
        monthly_installment,
        case 
            when monthly_installment >= 20000 then '5. Ultra High (>20k)'
            when monthly_installment >= 10000 then '4. High (10k-20k)'
            when monthly_installment >= 5000  then '3. Mid (5k-10k)'
            when monthly_installment >= 2500  then '2. Low (2.5k-5k)'
            else '1. Micro (<2.5k)'
        end as installment_bucket
    from loans
)
select 
    installment_bucket, 
    min(monthly_installment) as min_amt,
    max(monthly_installment) as max_amt,
    count(loan_id) as loans_issued,
    sum(is_default) as loans_defaulted,
    round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate
from base
group by 1
order by 1;

-- Default Rate by Monthly Installment Size
with base as (
    select 
        loan_id, 
        is_default,
        monthly_installment,
        case 
            when monthly_installment >= 20000 then '5. Ultra High (>20k)'
            when monthly_installment >= 10000 then '4. High (10k-20k)'
            when monthly_installment >= 5000  then '3. Mid (5k-10k)'
            when monthly_installment >= 2500  then '2. Low (2.5k-5k)'
            else '1. Micro (<2.5k)'
        end as installment_bucket
    from loans
)
select 
    installment_bucket, 
    min(monthly_installment) as min_amt,
    max(monthly_installment) as max_amt,
    count(loan_id) as loans_issued,
    sum(is_default) as loans_defaulted,
    round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate
from base
group by 1
order by 1;

-- risk_category
select risk_category, sum(is_default)
from loans 
group by risk_category;

-- Section 3 — Customer Risk Analysis (Driver Metrics)
-- 1. Default Rate by Income Group
with base as (
select l.loan_id, c.monthly_income, is_default,
case 
	when c.monthly_income >= 100000 then '3. High Earners'
	when c.monthly_income >= 50000 then '2. Mid Earners'
	else '1. Low Earners'
end as income_bucket 
from customers as c
inner join loans as l on c.customer_id = l.customer_id
)
select income_bucket, count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default)*100.0/count(loan_id),2) as default_rate_by_income
from base
group by income_bucket
order by income_bucket;

-- 2. Default Rate by Employment Type
select c.employment_type, count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default)*100.0/count(loan_id),2) as default_rate_by_emp_type
from customers as c inner join loans as l on c.customer_id = l.customer_id
group by c.employment_type;

-- 3. Default Rate by Credit Score (CIBIL/FICO)
with base as (
    select l.loan_id, c.credit_score, l.is_default,
        case 
            when c.credit_score >= 800 then '5. Excellent (800+)'
            when c.credit_score >= 740 then '4. Very Good (740-799)'
            when c.credit_score >= 670 then '3. Good (670-739)'
            when c.credit_score >= 580 then '2. Fair (580-669)'
            else '1. Poor (<580)'
        end as credit_bucket 
    from customers as c inner join loans as l on c.customer_id = l.customer_id
)
select credit_bucket, count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate
from base
group by credit_bucket
order by credit_bucket;

-- 4. Default Rate by City
select c.city, count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate
from customers as c inner join loans as l on c.customer_id = l.customer_id
group by c.city;

-- 5. account_age_months 
with base as (
select loan_id, account_age_months, is_default,
case 
	when account_age_months >= 60 then '4. Long-Term (5+ Years)'
    when account_age_months >= 36 then '3. Established (3-5 Years)'
    when account_age_months >= 12 then '2. Regular (1-3 Years)'
    else '1. New (<1 Year)'
end as age_bucket
from customers as c inner join loans as l on c.customer_id = l.customer_id
)
select age_bucket, count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate
from base
group by age_bucket
order by age_bucket;

-- no_of_loans_taken
select no_of_loans_taken, count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate
from customers as c inner join loans as l on c.customer_id = l.customer_id
group by no_of_loans_taken;

-- Section 4 — Behavioral Risk Analysis
-- 1. Default Rate by Missed Payments
with base as (
select total_missed_payments, loan_id, is_default,
CASE
        WHEN total_missed_payments = 0 THEN '0'
        WHEN total_missed_payments BETWEEN 1 AND 2 THEN '1-2'
        WHEN total_missed_payments BETWEEN 3 AND 5 THEN '3-5'
        ELSE '6+'
    END AS missed_bucket
from loans
)
select missed_bucket,count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate
from base
group by missed_bucket
order by missed_bucket;

-- 2. Default Rate by Late Payment Ratio
with base as (
select late_payment_ratio, loan_id, is_default,
CASE
        WHEN late_payment_ratio <= 0.10 THEN '0-10%'
        WHEN late_payment_ratio <= 0.20 THEN '10-20%'
        WHEN late_payment_ratio <= 0.30 THEN '20-30%'
        WHEN late_payment_ratio <= 0.50 THEN '30-50%'
        ELSE '50%+'
    END AS late_ratio_bucket
from loans
)
select late_ratio_bucket,count(loan_id) as loans_issued, sum(is_default) as loans_defaulted,
round(sum(is_default) * 100.0 / count(loan_id), 2) as default_rate
from base
group by late_ratio_bucket
order by late_ratio_bucket;

-- 3. Default Rate by Debt-to-Income Ratio
SELECT 
    CASE
        WHEN debt_to_income_ratio <= 0.20 THEN '0-20%'
        WHEN debt_to_income_ratio <= 0.30 THEN '20-30%'
        WHEN debt_to_income_ratio <= 0.40 THEN '30-40%'
        WHEN debt_to_income_ratio <= 0.50 THEN '40-50%'
        ELSE '50%+'
    END AS dti_bucket,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaulted_loans,
    ROUND(
        SUM(is_default) * 100.0 / COUNT(*),
        2
    ) AS default_rate_percent
FROM loans
GROUP BY dti_bucket
ORDER BY dti_bucket;

SELECT 
    CASE
        WHEN total_missed_payments = 0 THEN '0'
        WHEN total_missed_payments BETWEEN 1 AND 2 THEN '1-2'
        WHEN total_missed_payments BETWEEN 3 AND 5 THEN '3-5'
        ELSE '6+'
    END AS missed_bucket,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaulted_loans,
    ROUND(
        SUM(is_default) * 100.0 / COUNT(*),
        2
    ) AS default_rate_percent
FROM loans
GROUP BY missed_bucket
ORDER BY missed_bucket;

-- Interactive Analysis

-- Missed Payments × Credit Score
WITH credit_base AS (
    SELECT 
        *,
        CASE 
            WHEN credit_score >= 800 THEN '5. Excellent (800+)'
            WHEN credit_score >= 740 THEN '4. Very Good (740-799)'
            WHEN credit_score >= 670 THEN '3. Good (670-739)'
            WHEN credit_score >= 580 THEN '2. Fair (580-669)'
            ELSE '1. Poor (<580)'
        END AS credit_score_bucket
    FROM loans l inner join customers c on l.customer_id = c.customer_id
)
SELECT 
    credit_score_bucket,
    CASE
        WHEN total_missed_payments = 0 THEN '0'
        WHEN total_missed_payments BETWEEN 3 AND 5 THEN '3-5'
        ELSE '6+'
    END AS missed_bucket,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaulted_loans,
    ROUND(SUM(is_default) * 100.0 / COUNT(*), 2) AS default_rate
FROM credit_base
GROUP BY 
    credit_score_bucket,
    missed_bucket
ORDER BY 
    credit_score_bucket,
    missed_bucket;

-- Missed Payments × loan tenure 
WITH tenure_base AS (
    SELECT 
        *,
        CASE 
            WHEN loan_tenure_months >= 18 THEN '3. Long Term (18-24m)'
            WHEN loan_tenure_months >= 12 THEN '2. Mid Term (12-17m)'
            ELSE '1. Short Term (<12m)'
        END AS tenure_bucket
    FROM loans
)
SELECT 
    tenure_bucket,
    CASE
        WHEN total_missed_payments = 0 THEN '0'
        WHEN total_missed_payments BETWEEN 3 AND 5 THEN '3-5'
        ELSE '6+'
    END AS missed_bucket,
    COUNT(*) AS total_loans,
    SUM(is_default) AS defaulted_loans,
    ROUND(SUM(is_default) * 100.0 / COUNT(*), 2) AS default_rate
FROM tenure_base
GROUP BY 
    tenure_bucket,
    missed_bucket
ORDER BY 
    tenure_bucket,
    missed_bucket;
