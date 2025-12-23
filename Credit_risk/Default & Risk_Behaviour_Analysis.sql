-- 9) Default & Risk Behavior Analysis

-- 10) Which loan intents have the highest default rates?
select 
    Intent,
    round(100 * sum(case
                when `Default` = 'Y' then 1
                else 0
            end) / count(*),
            2) as Default_rate
from
    credit.credit_risk
group by Intent;
-- 11) What is the average loan amount for defaulters vs non-defaulters?
select `Default`, round(avg(Amount),2) as avg_loan_amount 
from credit.credit_risk
group by `Default`;
-- 12) How does interest rate differ between defaulted and non-defaulted loans?
select `Default`, round(avg(Rate),2) as Avg_Intrest_Rate
from credit.credit_risk
group by `Default`; 
-- 13) What percentage of customers with past default default again?
select 
	 round(100 *sum(case when `Default` = 'Y' then 1 else 0 end) / count(*), 2) as Prev_default
    from credit.credit_risk
    where `Default` = 'Y';
-- 14) Which age groups show higher default behavior?
select
	 case
     when Age <25 then 'Below 25' 
     when Age between 25 and 40 then '25-40' 
     when Age between 40 and 60 then '40-60'
     else 'more than 60'
     end as age_group,
	round(100 * sum(case when `Default` = 'Y' then 1 else 0 end)/count(*),2) as default_rate
from credit.credit_risk
group by age_group;
