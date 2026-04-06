# 🏦 Credit Risk Intelligence: Early Warning Signals for Loan Defaults

## 📋 Project Overview

This project focuses on analyzing loan default risk in the BFSI (Banking, Financial Services, and Insurance) domain.  
The objective is to identify patterns behind loan defaults and detect early warning signals using loan, customer, and repayment data.

NovaBank, a digital lending company, experienced an increase in loan defaults from **4% to 16%** over 12 months, resulting in significant financial losses.  
This project analyzes risk drivers and provides actionable recommendations to reduce default risk and financial exposure.

---

## 🌍 Why This Project Matters

Loan defaults are a major challenge for financial institutions, directly impacting profitability and financial stability.

Traditional risk evaluation methods often rely heavily on static customer information such as income and credit scores. However, this project highlights the importance of **repayment behavior** as a more reliable indicator of default risk.

By identifying early warning signals such as repeated missed payments, organizations can take preventive actions, reduce financial losses, and improve portfolio performance.

---

## ⚠️ Business Problem

Over the past year, NovaBank observed a sharp increase in loan defaults, leading to financial losses and increased portfolio risk.

**Key Challenges:**

- Rising default rate (**4% → 16%**)  
- Increasing financial exposure  
- Lack of early warning signals  
- Need for data-driven risk monitoring  

---

## 🎯 Project Objectives

- Analyze loan portfolio performance  
- Identify key drivers of loan defaults  
- Detect behavioral early warning signals  
- Measure financial loss caused by defaults  
- Provide recommendations to reduce default risk  

---

## 📊 Key Metrics Snapshot

- **Default Rate:** 15.28%  
- **Total Defaulted Loans:** 1,833  
- **Defaulted Principal Amount:** ₹186M  
- **High-Risk Threshold:** 3–4 Missed Payments  

---

## 📈 Key KPI

**Primary KPI**

- **Default Rate (%)**  
Measures the percentage of loans that fail to be repaid.

**Supporting Risk Drivers**

**Loan Characteristics**
- Loan Tenure  
- Loan Purpose  
- Interest Rate  

**Customer Profile**
- Income Level  
- Employment Type  
- Credit Score  

**Repayment Behavior**
- Missed Payments  
- Late Payment Ratio  
- Debt-to-Income Ratio  

---

## 📂 Dataset Overview

The dataset used in this project is synthetically generated for analytical simulation.

**Dataset Size:**

- **10,000 Customers**  
- **12,000 Loans**  
- **160,000+ Payment Records**

The dataset consists of three relational tables:

### 👤 Customer Table  
Contains demographic and financial details of customers.

### 💰 Loan Table  
Stores loan-level information such as loan amount, tenure, interest rate, and loan purpose.

### 💳 Payment Table  
Stores repayment activity including payment dates, delays, and missed installments.

**Relationships:**

- One Customer → Multiple Loans  
- One Loan → Multiple Payments  

---

## 🧹 Data Cleaning & Preparation

Data cleaning was performed using **Python** to ensure accuracy and consistency.

**Key Steps:**

- Fixed incorrect data types  
- Standardized categorical values  
- Checked duplicate records  
- Validated logical relationships  
- Verified data consistency across tables  

These steps ensured reliable and structured data for analysis.

---

## ⚙️ Feature Engineering

New behavioral features were created to improve risk detection.

**Engineered Features:**

- `total_missed_payments` — Counts missed installments per loan  
- `is_default` — Identifies defaulted loans  
- `is_late_payment` — Flags delayed payments  
- `late_payment_ratio` — Measures delay frequency  
- `debt_to_income_ratio` — Measures repayment burden  

These features played a critical role in identifying high-risk loan behavior.

---

## 🔍 SQL Analysis Summary

SQL was used to evaluate portfolio health and identify risk drivers.

### 🏥 Portfolio Health

- Default Rate: **15.28%**  
- Total Defaulted Loans: **1,833**  
- Defaulted Principal Amount: **₹186M**

---

### 💡 Core Insights

- **Behavioral Risk:**  
Repayment behavior was the **strongest predictor** of default.

- **Structural Risk:**  
Loan amount and interest rate showed minimal influence.

- **Demographic Risk:**  
Income and credit score showed limited predictive power.

---

## 📊 Dashboards Overview

Four dashboards were developed using **Tableau** to visualize portfolio performance and risk patterns.

### 📊 Dashboard 1 — Executive Overview  
Provides high-level portfolio metrics including default rate and financial exposure.

### 📊 Dashboard 2 — Risk Segmentation  
Analyzes default patterns across loan and customer categories.

### 📊 Dashboard 3 — Behavioral Risk Monitoring  
Identifies repayment patterns and early warning signals.

### 📊 Dashboard 4 — Financial Impact Analysis  
Measures financial losses caused by loan defaults.

---

## 💡 Key Insights

- Repayment behavior is the **strongest driver** of loan defaults.  
- Default risk increases significantly after **3–4 missed payments**.  
- Loan characteristics have limited impact on default risk.  
- Customer demographics alone are weak predictors.  
- Business loans show slightly higher default risk.

---

## 🚀 Business Recommendations

- **Early Warning System**  
Flag customers reaching 3+ missed payments.

- **Automated Reminders**  
Deploy notification systems for upcoming dues.

- **Behavioral Risk Scoring**  
Adopt dynamic repayment-based risk scoring.

- **Structured Recovery Workflow**  
Implement staged recovery actions based on payment delays.

---

## 🛠️ Tools & Technologies Used

- **SQL** — Data Analysis  
- **Python** — Data Cleaning & Feature Engineering  
- **Tableau** — Data Visualization  
- **Pandas** — Data Manipulation  
- **NumPy** — Numerical Processing  

---

## ⚠️ Limitations

The dataset used in this project is synthetically generated.  
Real-world financial datasets may contain greater variability and noise, which may produce more gradual risk patterns.

---

## 🎓 Conclusion

This project demonstrates how repayment behavior plays a critical role in predicting loan defaults.

By combining SQL analysis, Python-based data preparation, and Tableau dashboards, the project highlights how data-driven insights can support better risk monitoring and early intervention strategies.

---

## 📁 Project Structure
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

## ✍️ Author

**Faraz Shaikh**  
BSc IT Student | Data Analytics & Data Science Enthusiast  

Interested in solving business problems using data and building practical analytical solutions.
