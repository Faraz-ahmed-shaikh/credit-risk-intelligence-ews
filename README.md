# Credit Risk Intelligence: Early Warning Signals for Loan Defaults

## Project Overview

This project focuses on analyzing loan default risk in the BFSI (Banking, Financial Services, and Insurance) domain.  
The objective is to identify patterns behind loan defaults and detect early warning signals using loan, customer, and repayment data.

NovaBank, a digital lending company, experienced an increase in loan defaults from **4% to 16%** over 12 months, resulting in significant financial losses.  
This project aims to analyze risk drivers and provide actionable recommendations to reduce default risk and financial exposure.

---

## Business Problem

Over the past year, NovaBank observed a sharp increase in loan defaults, leading to financial losses and increased portfolio risk.

Key Challenges:
- Rising default rate (4% → 16%)
- Increasing financial exposure
- Lack of early warning signals
- Need for data-driven risk monitoring

---

## Project Objectives

- Analyze loan portfolio performance
- Identify key drivers of loan defaults
- Detect behavioral early warning signals
- Measure financial loss caused by defaults
- Provide recommendations to reduce default risk

---

## Key KPI

**Primary KPI:**

- Default Rate (%)  
  Measures the percentage of loans that fail to be repaid.

**Supporting Risk Drivers:**

- Loan Characteristics  
  (Loan Tenure, Loan Purpose, Interest Rate)

- Customer Profile  
  (Income Level, Employment Type, Credit Score)

- Repayment Behavior  
  (Missed Payments, Late Payment Ratio, Debt-to-Income Ratio)

---

## Dataset Overview

The dataset used in this project is synthetically generated for analytical simulation.

It consists of **three relational tables**:

### Customer Table
Contains demographic and financial details of customers.

Key fields:
- customer_id
- age
- gender
- city
- monthly_income
- employment_type
- credit_score
- education_level

---

### Loan Table
Stores loan-level information.

Key fields:
- loan_id
- customer_id
- loan_amount
- loan_tenure_months
- interest_rate
- loan_purpose
- loan_status

---

### Payment Table
Stores repayment behavior data.

Key fields:
- payment_id
- loan_id
- due_date
- payment_date
- payment_status
- payment_delay_days

---

## Data Cleaning & Preparation

Data cleaning was performed using Python to ensure accuracy and consistency.

Key steps included:

- Fixing incorrect data types
- Standardizing categorical text values
- Checking duplicate records
- Handling outliers where necessary
- Performing logical and relational validation
- Ensuring consistency across tables

---

## Feature Engineering

New behavioral features were created to improve risk analysis.

Engineered features include:

- loan_duration_days  
  Duration of loan from approval to closure.

- is_late_payment  
  Indicates whether a payment was delayed.

- total_missed_payments  
  Counts missed installments for each loan.

- is_default  
  Indicates whether a loan defaulted.

These features were critical for identifying repayment risk patterns.

---

## SQL Analysis Summary

SQL was used to analyze portfolio health and risk drivers.

### Portfolio Health

- Default Rate: **15.28%**
- Total Defaulted Loans: **1,833**
- Defaulted Principal Amount: **₹186M**

The portfolio showed consistent financial exposure across the timeline.

---

### Loan Risk Insights

- Loan amount and interest rate showed minimal impact on default patterns.
- Mid-to-long-term loans showed slightly higher default rates.
- Business-purpose loans showed slightly higher risk than other loan types.

---

### Customer Risk Insights

- Income and employment types showed limited predictive power.
- Credit score differences showed minimal variation in default risk.
- Default risk remained consistent across cities.

---

### Behavioral Risk Insights (Most Important)

- Repayment behavior was the strongest predictor of default.
- Repeated missed payments significantly increased default risk.
- Early intervention opportunities exist before default occurs.

---

## Dashboards Overview

Four dashboards were developed using Tableau to visualize portfolio performance and risk patterns.

---

### Dashboard 1 — Executive Overview

Provides high-level portfolio metrics.

Key Metrics:
- Default Rate (%)
- Total Defaulted Loans
- Total Defaulted Amount
- Loan Status Distribution

---

### Dashboard 2 — Risk Segmentation

Analyzes loan and customer characteristics.

Key Visuals:
- Default Rate by Loan Tenure
- Default Rate by Credit Score
- Default Rate by Income Group
- Default Rate by Employment Type

---

### Dashboard 3 — Behavioral Risk Monitoring

Focuses on repayment behavior patterns.

Key Visuals:
- Loan Distribution by Missed Payments
- Default Rate by Late Payment Ratio
- Default Rate by Debt-to-Income Ratio

---

### Dashboard 4 — Financial Impact Analysis

Measures financial exposure due to defaults.

Key Visuals:
- Defaulted Amount Over Time
- Defaulted Amount by Loan Purpose
- Defaulted Amount by Loan Tenure
- Defaulted Amount by Credit Score

---

## Key Insights

- Repayment behavior is the strongest driver of loan defaults.
- Loan characteristics have limited impact on default risk.
- Customer demographics are weak predictors of default.
- Default risk increases significantly after repeated missed payments.
- Business loans show slightly higher risk compared to other categories.

---

## Business Recommendations

- Implement early warning alerts for repeated missed payments.
- Introduce automated payment reminders.
- Monitor repayment behavior continuously.
- Develop behavioral risk scoring models.
- Adopt structured recovery workflows.

---

## Project Structure
# Credit Risk Intelligence: Early Warning Signals for Loan Defaults

## Project Overview

This project focuses on analyzing loan default risk in the BFSI (Banking, Financial Services, and Insurance) domain.  
The objective is to identify patterns behind loan defaults and detect early warning signals using loan, customer, and repayment data.

NovaBank, a digital lending company, experienced an increase in loan defaults from **4% to 16%** over 12 months, resulting in significant financial losses.  
This project aims to analyze risk drivers and provide actionable recommendations to reduce default risk and financial exposure.

---

## Business Problem

Over the past year, NovaBank observed a sharp increase in loan defaults, leading to financial losses and increased portfolio risk.

Key Challenges:
- Rising default rate (4% → 16%)
- Increasing financial exposure
- Lack of early warning signals
- Need for data-driven risk monitoring

---

## Project Objectives

- Analyze loan portfolio performance
- Identify key drivers of loan defaults
- Detect behavioral early warning signals
- Measure financial loss caused by defaults
- Provide recommendations to reduce default risk

---

## Key KPI

**Primary KPI:**

- Default Rate (%)  
  Measures the percentage of loans that fail to be repaid.

**Supporting Risk Drivers:**

- Loan Characteristics  
  (Loan Tenure, Loan Purpose, Interest Rate)

- Customer Profile  
  (Income Level, Employment Type, Credit Score)

- Repayment Behavior  
  (Missed Payments, Late Payment Ratio, Debt-to-Income Ratio)

---

## Dataset Overview

The dataset used in this project is synthetically generated for analytical simulation.

It consists of **three relational tables**:

### Customer Table
Contains demographic and financial details of customers.

Key fields:
- customer_id
- age
- gender
- city
- monthly_income
- employment_type
- credit_score
- education_level

---

### Loan Table
Stores loan-level information.

Key fields:
- loan_id
- customer_id
- loan_amount
- loan_tenure_months
- interest_rate
- loan_purpose
- loan_status

---

### Payment Table
Stores repayment behavior data.

Key fields:
- payment_id
- loan_id
- due_date
- payment_date
- payment_status
- payment_delay_days

---

## Data Cleaning & Preparation

Data cleaning was performed using Python to ensure accuracy and consistency.

Key steps included:

- Fixing incorrect data types
- Standardizing categorical text values
- Checking duplicate records
- Handling outliers where necessary
- Performing logical and relational validation
- Ensuring consistency across tables

---

## Feature Engineering

New behavioral features were created to improve risk analysis.

Engineered features include:

- loan_duration_days  
  Duration of loan from approval to closure.

- is_late_payment  
  Indicates whether a payment was delayed.

- total_missed_payments  
  Counts missed installments for each loan.

- is_default  
  Indicates whether a loan defaulted.

These features were critical for identifying repayment risk patterns.

---

## SQL Analysis Summary

SQL was used to analyze portfolio health and risk drivers.

### Portfolio Health

- Default Rate: **15.28%**
- Total Defaulted Loans: **1,833**
- Defaulted Principal Amount: **₹186M**

The portfolio showed consistent financial exposure across the timeline.

---

### Loan Risk Insights

- Loan amount and interest rate showed minimal impact on default patterns.
- Mid-to-long-term loans showed slightly higher default rates.
- Business-purpose loans showed slightly higher risk than other loan types.

---

### Customer Risk Insights

- Income and employment types showed limited predictive power.
- Credit score differences showed minimal variation in default risk.
- Default risk remained consistent across cities.

---

### Behavioral Risk Insights (Most Important)

- Repayment behavior was the strongest predictor of default.
- Repeated missed payments significantly increased default risk.
- Early intervention opportunities exist before default occurs.

---

## Dashboards Overview

Four dashboards were developed using Tableau to visualize portfolio performance and risk patterns.

---

### Dashboard 1 — Executive Overview

Provides high-level portfolio metrics.

Key Metrics:
- Default Rate (%)
- Total Defaulted Loans
- Total Defaulted Amount
- Loan Status Distribution

---

### Dashboard 2 — Risk Segmentation

Analyzes loan and customer characteristics.

Key Visuals:
- Default Rate by Loan Tenure
- Default Rate by Credit Score
- Default Rate by Income Group
- Default Rate by Employment Type

---

### Dashboard 3 — Behavioral Risk Monitoring

Focuses on repayment behavior patterns.

Key Visuals:
- Loan Distribution by Missed Payments
- Default Rate by Late Payment Ratio
- Default Rate by Debt-to-Income Ratio

---

### Dashboard 4 — Financial Impact Analysis

Measures financial exposure due to defaults.

Key Visuals:
- Defaulted Amount Over Time
- Defaulted Amount by Loan Purpose
- Defaulted Amount by Loan Tenure
- Defaulted Amount by Credit Score

---

## Key Insights

- Repayment behavior is the strongest driver of loan defaults.
- Loan characteristics have limited impact on default risk.
- Customer demographics are weak predictors of default.
- Default risk increases significantly after repeated missed payments.
- Business loans show slightly higher risk compared to other categories.

---

## Business Recommendations

- Implement early warning alerts for repeated missed payments.
- Introduce automated payment reminders.
- Monitor repayment behavior continuously.
- Develop behavioral risk scoring models.
- Adopt structured recovery workflows.

---

## Project Structure
# Credit Risk Intelligence: Early Warning Signals for Loan Defaults

## Project Overview

This project focuses on analyzing loan default risk in the BFSI (Banking, Financial Services, and Insurance) domain.  
The objective is to identify patterns behind loan defaults and detect early warning signals using loan, customer, and repayment data.

NovaBank, a digital lending company, experienced an increase in loan defaults from **4% to 16%** over 12 months, resulting in significant financial losses.  
This project aims to analyze risk drivers and provide actionable recommendations to reduce default risk and financial exposure.

---

## Business Problem

Over the past year, NovaBank observed a sharp increase in loan defaults, leading to financial losses and increased portfolio risk.

Key Challenges:
- Rising default rate (4% → 16%)
- Increasing financial exposure
- Lack of early warning signals
- Need for data-driven risk monitoring

---

## Project Objectives

- Analyze loan portfolio performance
- Identify key drivers of loan defaults
- Detect behavioral early warning signals
- Measure financial loss caused by defaults
- Provide recommendations to reduce default risk

---

## Key KPI

**Primary KPI:**

- Default Rate (%)  
  Measures the percentage of loans that fail to be repaid.

**Supporting Risk Drivers:**

- Loan Characteristics  
  (Loan Tenure, Loan Purpose, Interest Rate)

- Customer Profile  
  (Income Level, Employment Type, Credit Score)

- Repayment Behavior  
  (Missed Payments, Late Payment Ratio, Debt-to-Income Ratio)

---

## Dataset Overview

The dataset used in this project is synthetically generated for analytical simulation.

It consists of **three relational tables**:

### Customer Table
Contains demographic and financial details of customers.

Key fields:
- customer_id
- age
- gender
- city
- monthly_income
- employment_type
- credit_score
- education_level

---

### Loan Table
Stores loan-level information.

Key fields:
- loan_id
- customer_id
- loan_amount
- loan_tenure_months
- interest_rate
- loan_purpose
- loan_status

---

### Payment Table
Stores repayment behavior data.

Key fields:
- payment_id
- loan_id
- due_date
- payment_date
- payment_status
- payment_delay_days

---

## Data Cleaning & Preparation

Data cleaning was performed using Python to ensure accuracy and consistency.

Key steps included:

- Fixing incorrect data types
- Standardizing categorical text values
- Checking duplicate records
- Handling outliers where necessary
- Performing logical and relational validation
- Ensuring consistency across tables

---

## Feature Engineering

New behavioral features were created to improve risk analysis.

Engineered features include:

- loan_duration_days  
  Duration of loan from approval to closure.

- is_late_payment  
  Indicates whether a payment was delayed.

- total_missed_payments  
  Counts missed installments for each loan.

- is_default  
  Indicates whether a loan defaulted.

These features were critical for identifying repayment risk patterns.

---

## SQL Analysis Summary

SQL was used to analyze portfolio health and risk drivers.

### Portfolio Health

- Default Rate: **15.28%**
- Total Defaulted Loans: **1,833**
- Defaulted Principal Amount: **₹186M**

The portfolio showed consistent financial exposure across the timeline.

---

### Loan Risk Insights

- Loan amount and interest rate showed minimal impact on default patterns.
- Mid-to-long-term loans showed slightly higher default rates.
- Business-purpose loans showed slightly higher risk than other loan types.

---

### Customer Risk Insights

- Income and employment types showed limited predictive power.
- Credit score differences showed minimal variation in default risk.
- Default risk remained consistent across cities.

---

### Behavioral Risk Insights (Most Important)

- Repayment behavior was the strongest predictor of default.
- Repeated missed payments significantly increased default risk.
- Early intervention opportunities exist before default occurs.

---

## Dashboards Overview

Four dashboards were developed using Tableau to visualize portfolio performance and risk patterns.

---

### Dashboard 1 — Executive Overview

Provides high-level portfolio metrics.

Key Metrics:
- Default Rate (%)
- Total Defaulted Loans
- Total Defaulted Amount
- Loan Status Distribution

---

### Dashboard 2 — Risk Segmentation

Analyzes loan and customer characteristics.

Key Visuals:
- Default Rate by Loan Tenure
- Default Rate by Credit Score
- Default Rate by Income Group
- Default Rate by Employment Type

---

### Dashboard 3 — Behavioral Risk Monitoring

Focuses on repayment behavior patterns.

Key Visuals:
- Loan Distribution by Missed Payments
- Default Rate by Late Payment Ratio
- Default Rate by Debt-to-Income Ratio

---

### Dashboard 4 — Financial Impact Analysis

Measures financial exposure due to defaults.

Key Visuals:
- Defaulted Amount Over Time
- Defaulted Amount by Loan Purpose
- Defaulted Amount by Loan Tenure
- Defaulted Amount by Credit Score

---

## Key Insights

- Repayment behavior is the strongest driver of loan defaults.
- Loan characteristics have limited impact on default risk.
- Customer demographics are weak predictors of default.
- Default risk increases significantly after repeated missed payments.
- Business loans show slightly higher risk compared to other categories.

---

## Business Recommendations

- Implement early warning alerts for repeated missed payments.
- Introduce automated payment reminders.
- Monitor repayment behavior continuously.
- Develop behavioral risk scoring models.
- Adopt structured recovery workflows.

---

## Project Structure
Credit-Risk-Intelligence/
│
├── analysis/
│ └── analysis.sql
│
├── dashboards/
│ ├── dashboard_images/
│ └── tableau_workbook
│
├── data/
│ ├── cleaned_data.zip
│ └── dirty_data.zip
│
├── notebook/
│ └── CRI_data_cleaning.ipynb
│
├── reports/
│ ├── Executive_Summary.pdf
│ ├── Full_Project_Report.pdf
│ └── Presentation.pdf
│
└── README.md


---

## Tools & Technologies Used

- SQL — Data Analysis  
- Python — Data Cleaning & Feature Engineering  
- Tableau — Data Visualization  
- Pandas — Data Manipulation  
- NumPy — Numerical Operations  

---

## Limitations

The dataset used in this project is synthetically generated.  
Real-world financial datasets may contain more noise and variability, which could produce more gradual risk patterns.

---

## Conclusion

This project demonstrates how behavioral analysis can be used to identify early warning signals for loan defaults.  

By focusing on repayment behavior and financial exposure, organizations can reduce default risk, improve recovery strategies, and strengthen portfolio stability.

---

## Author
**Faraz Shaikh**  
BSc IT Student | Data Analytics & Data Science Enthusiast  
Passionate about solving business problems using data and building meaningful analytical solutions.
