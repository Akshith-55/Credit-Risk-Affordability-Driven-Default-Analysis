-- Portfolio Overview
select * from credit.credit_risk;
-- 1)What is the total number of loans and total loan amount in the portfolio?
select count(id) as total_loans, sum(amount) as total_amount
from credit.credit_risk;

-- 2) What is the overall default rate?
select round(100.0*sum(case when `Default` = 'Y' then 1 else 0 end) / count(*),2) as default_rate
from credit.credit_risk;
-- 3) What is the average loan amount and interest rate?
select avg(amount) as avg_loan_amount, avg(rate) as avg_intrest_rate
from credit.credit_risk;
-- 4) How many loans are active vs closed based on loan status?
select Status, count(id) as count
from credit.credit_risk
group by Status;
