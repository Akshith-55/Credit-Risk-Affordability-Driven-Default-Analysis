-- 4 Affordability & Exposure Risk 

-- How does loan percent of income affect default probability?
select 
case 
	when Percent_income < 0.2 then 'low burden'
    when percent_income between 0.3 and 0.4 then 'Medium Burden'
    else 'High Burden'
    end as income_group,
round(100 * sum(case when`Default` = 'Y' then 1 else 0 end) / count(*),2) as default_rate
from credit.credit_risk
group by income_group;
-- Identify customers where loan amount exceeds a risky income threshold.
select * from credit.credit_risk
where Amount > (0.5*Income);
-- What is the total loan exposure by risk group?
select sum(Amount) as total_loan, 
case
	 when Cred_length < 3 then 'high risk'
     when Cred_length between 4 and 5 then 'medium risk'
     else 'low risk'
end as risk_group
from credit.credit_risk
group by risk_group;
-- Which income segments contribute the most to high-risk exposure?
select 
	case 
		when Income < 300000 then 'low income'
		when Income between 400000 and 700000 then 'medium income'
        else 'high income'
	end as Income_segment,
    sum(Amount) as High_Risk_exposure
from credit.credit_risk
where Percent_income > 0.4 or Cred_length < 3
group by Income_segment
order by High_Risk_exposure desc;

	