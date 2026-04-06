# 🏦 Credit Risk Intelligence: Early Warning Signals for Loan Defaults

## 📋 Project Overview
This project focuses on analyzing loan default risk in the BFSI (Banking, Financial Services, and Insurance) domain.  
The objective is to identify patterns behind loan defaults and detect early warning signals using loan, customer, and repayment data.

NovaBank, a digital lending company, experienced an increase in loan defaults from **4% to 16%** over 12 months, resulting in significant financial losses.  
This project aims to analyze risk drivers and provide actionable recommendations to reduce default risk and financial exposure.

---

## ⚠️ Business Problem
Over the past year, NovaBank observed a sharp increase in loan defaults, leading to financial losses and increased portfolio risk.

**Key Challenges:**
- Rising default rate (4% → 16%)
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

## 📈 Key KPI
**Primary KPI:**
- **Default Rate (%)**  
  Measures the percentage of loans that fail to be repaid.

**Supporting Risk Drivers:**
- **Loan Characteristics:** (Loan Tenure, Loan Purpose, Interest Rate)
- **Customer Profile:** (Income Level, Employment Type, Credit Score)
- **Repayment Behavior:** (Missed Payments, Late Payment Ratio, Debt-to-Income Ratio)

---

## 📂 Dataset Overview
The dataset used in this project is synthetically generated for analytical simulation. It consists of **three relational tables**:

### 👤 Customer Table
Contains demographic and financial details of customers (Income, Credit Score, Employment Type).

### 💰 Loan Table
Stores loan-level information (Amount, Tenure, Interest Rate, Purpose).

### 💳 Payment Table
Stores repayment behavior data (Due Date, Payment Date, Delay Days).

---

## 🧹 Data Cleaning & Preparation
Data cleaning was performed using **Python** to ensure accuracy and consistency. Key steps included:
- Fixing incorrect data types & handling outliers.
- Standardizing categorical text values.
- Performing logical and relational validation across tables.

---

## ⚙️ Feature Engineering
New behavioral features were created to improve risk analysis:
- `total_missed_payments`: Counts missed installments for each loan.
- `is_default`: Binary indicator for loan status.
- `is_late_payment`: Flag for delayed payments.

---

## 🔍 SQL Analysis Summary
SQL was used to analyze portfolio health and risk drivers.

### 🏥 Portfolio Health
- **Default Rate:** 15.28%
- **Total Defaulted Loans:** 1,833
- **Defaulted Principal Amount:** ₹186M

### 💡 Core Insights
- **Behavioral Risk:** Repayment behavior was the **strongest predictor** of default.
- **Structural Risk:** Loan amount and interest rates showed minimal impact on default patterns.
- **Demographic Risk:** Income and Credit Scores showed surprisingly limited predictive power.

---

## 📊 Dashboards Overview
Four dashboards were developed using **Tableau** to visualize patterns:
1. **Executive Overview:** High-level portfolio health.
2. **Risk Segmentation:** Analysis by loan and customer type.
3. **Behavioral Risk Monitoring:** Deep dive into missed payment patterns.
4. **Financial Impact Analysis:** Measuring total Rupee exposure.

---

## 💡 Key Insights
- Repayment behavior is the **strongest driver** of loan defaults.
- Default risk increases significantly after **3-4 repeated missed payments**.
- Business loans show slightly higher risk compared to other categories.

---

## 🚀 Business Recommendations
- **Early Warning System:** Implement alerts for customers reaching 3+ missed payments.
- **Automated Reminders:** Deploy SMS/Email triggers for upcoming dues.
- **Behavioral Scoring:** Transition from static credit scores to dynamic behavioral risk models.

---

## 🛠️ Tools & Technologies Used

- SQL — Data Analysis  
- Python — Data Cleaning & Feature Engineering  
- Tableau — Data Visualization  
- Pandas — Data Manipulation  
- NumPy — Numerical Operations  

---

## ⚠ Limitations

The dataset used in this project is synthetically generated.  
Real-world financial datasets may contain more noise and variability, which could produce more gradual risk patterns.

---

## 🎓 Conclusion

This project demonstrates how behavioral analysis can be used to identify early warning signals for loan defaults.  

By focusing on repayment behavior and financial exposure, organizations can reduce default risk, improve recovery strategies, and strengthen portfolio stability.

---

## ✍️ Author

**Faraz Shaikh**  
BSc IT Student | Data Analytics & Data Science Enthusiast  

Passionate about solving business problems using data and building meaningful analytical solutions.
