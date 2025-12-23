
-- Policy & Business Insight

-- 19) Which customer profiles should be flagged as high risk based on multiple conditions?
select * from credit.credit_risk
where Percent_income > 0.4
	and Cred_length <3
    and Rate > 15;

-- 20) What combination of factors leads to the highest default rate?
select
Home,Intent,
ROUND(100.0 * SUM(case when `Default` = 'Y' then 1 else 0 end) / COUNT(*),2
    ) as default_rate
from credit.credit_risk
group by  Home, Intent
order by default_rate desc
limit 5;
-- 21) Which risk segments should the bank tighten credit policies for?
select
    case
        when Percent_income > 0.4 then 'High Burden'
        when Cred_length < 3 then 'Short Credit History'
        else 'Other'
    end as risk_reason,
    count(*) as loan_count,
    round(100.0 * sum(case when `Default` = 'Y'then 1 else 0 end) / count(*),2
    ) as default_rate
from credit.credit_risk
group by  risk_reason
order by default_rate desc;