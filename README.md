
# 📊 Credot Risk & Affordability Driven Default Analysis – SQL & Power BI

## 📌 Project Overview
This project focuses on **credit risk analysis** using **SQL and Power BI** to evaluate portfolio health, customer risk segmentation, and affordability-driven default behavior.  
The objective is to support **risk-aware lending decisions** by identifying high-risk segments, exposure concentration, and key default drivers.

---

## 🏦 Business Problem
Financial institutions must balance **loan growth** with **credit risk control**.  
Uncontrolled exposure to high-risk customers can lead to increased defaults, capital erosion, and regulatory concerns.

This analysis answers:
- Which **customer segments** contribute most to default risk?
- How **affordability and income burden** impact defaults?
- Which **loan intents and customer profiles** require tighter credit policies?
- Where is **risk exposure concentrated** across the portfolio?

---

## 📂 Dataset Overview
The dataset represents consumer loan applications with the following attributes:
- **Demographics**: Age, Income, Employment Length
- **Loan Details**: Loan Amount, Interest Rate, Loan Intent, Loan Status
- **Credit Indicators**: Credit History Length, Prior Default Flag
- **Affordability Metric**: Loan-to-Income Ratio (`Percent_income`)

---

## 🛠️ Tools & Technologies
- **SQL (MySQL)** – Data extraction, aggregation, and risk metrics
- **Power BI** – Interactive dashboards and KPI reporting
- **Excel / CSV** – Source data
- **GitHub** – Version control and documentation

---

## 🔍 What I Did
- Computed **portfolio-level KPIs** such as Default Rate %, Loan Volume, and Risk Exposure.
- Built **customer risk segmentation** using income, employment tenure, and credit history.
- Analyzed **default behavior patterns** across age groups, loan intents, and affordability bands.
- Designed a **4-page Power BI dashboard**:
  - Portfolio Overview
  - Customer Risk Segmentation
  - Default & Behavioral Analysis
  - Affordability & Risk Exposure
- Developed reusable **SQL queries** to support analytics and visualizations.

---

## 🧠 Sample SQL Queries

### Default Rate by Home Ownership
```SQL  
SELECT 
    home,
    ROUND(
        100 * SUM(CASE WHEN `Default` = 'Y' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS default_rate
FROM credit.credit_risk
GROUP BY home
ORDER BY default_rate DESC;
```

### Defalut Rate byAge Group
```SQL
SELECT
    CASE
        WHEN Age < 25 THEN 'Below 25'
        WHEN Age BETWEEN 25 AND 40 THEN '25–40'
        WHEN Age BETWEEN 40 AND 60 THEN '40–60'
        ELSE 'Above 60'
    END AS age_group,
    ROUND(
        100 * SUM(CASE WHEN `Default` = 'Y' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS default_rate
FROM credit.credit_risk
GROUP BY age_group;
```
### Total Laon Exposure by Risk Group
```SQL
SELECT
    CASE
        WHEN Cred_length < 3 THEN 'High Risk'
        WHEN Cred_length BETWEEN 4 AND 5 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_group,
    SUM(Amount) AS total_loan_exposure
FROM credit.credit_risk
GROUP BY risk_group;
```
High-Risk Segments for Policy Tightening
```SQL
SELECT
    CASE
        WHEN Percent_income > 0.4 THEN 'High Income Burden'
        WHEN Cred_length < 3 THEN 'Short Credit History'
        ELSE 'Other'
    END AS risk_reason,
    COUNT(*) AS loan_count,
    ROUND(
        100 * SUM(CASE WHEN `Default` = 'Y' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS default_rate
FROM credit.credit_risk
GROUP BY risk_reason
ORDER BY default_rate DESC;
```
📊 Key Credit Risk Insights
💠Portfolio Risk Overview

Education loans represent the highest loan origination volume with a low default rate (~0.17%), indicating a relatively low-risk growth segment.

Home improvement loans show higher default rates (~0.19%) alongside elevated interest rates, signaling increased repayment stress.

Default rates remain largely stable across credit history lengths, rising marginally from 0.28% to 0.32% beyond 10 years, indicating credit length alone is not a strong default driver.

💠 Customer Risk Segmentation

Low-income customers account for approximately 2.2% high-risk rate, while high-income segments show minimal default exposure.

Customers aged 18–24 exhibit the highest risk concentration (~4.3%), whereas customers above 36 demonstrate significantly lower risk.

Employment tenure above 10 years correlates with lower risk (~0.5%), while shorter tenures show higher default probability.

💠 Affordability & Exposure Risk

High-risk exposure is concentrated within low-income segments, contributing ₹11M+ in high-risk loan exposure.

Customers with loan-to-income ratios exceeding 40% exhibit significantly higher default rates, highlighting affordability-driven risk.

Overleveraged customers disproportionately contribute to default risk, supporting tighter affordability thresholds.

🏦 Business Recommendations

Introduce stricter affordability thresholds and loan-to-income caps for high-risk customer segments.

Limit high-ticket loan exposure for customers with short credit history or high income burden.

Prioritize low-risk segments (education loans, long employment tenure) for controlled portfolio growth.

Apply risk-based pricing and credit policy tightening for home improvement and high-burden borrowers.

📈 Dashboard Output

The Power BI dashboard includes:

Portfolio KPIs (Total Loans, Default Rate %, Risk Exposure)

Customer risk segmentation visuals

Default behavior analysis

Affordability and exposure monitoring tables

📄 A PDF export of the Power BI dashboard is included in the repository.


📌 Key Takeaway

This project demonstrates how data-driven credit risk insights can guide policy decisions, exposure control, and sustainable lending growth using SQL and Power BI.


