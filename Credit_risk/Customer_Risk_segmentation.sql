-- Customer Risk Segmentation

-- 5) What is the default rate by income group?
select 
case
	when income < 300000 then 'low income'
    when income between 30000 and 70000 then 'medium income'
    else 'high income'
    end as inc_group,
    100.0 * round(sum( case when `Default` ='Y' then 1 else 0 end),2)
    / count(*)
    as default_rate
    from credit.credit_risk
    group by inc_group;
    
-- 6) How does default rate vary by employment length?
SELECT 
    Emp_length,
    ROUND(100 * SUM(CASE
                         WHEN `Default` = 'Y' THEN 1
                        ELSE 0
                    END) / COUNT(*),
            2) AS default_rate
FROM
    credit.credit_risk
GROUP BY Emp_length
ORDER BY default_rate;
-- 7) What is the default rate by home ownership status?
select home, 
	round(100 * sum(case when `Default` = 'Y' then 1 else 0 end) / count(*),2 ) as default_rate
    from credit.credit_risk
    group by home
    order by default_rate;
-- 8) How does credit history length impact default risk?
select
    case
        when Cred_length < 3 then 'Short Credit History'
        when Cred_length between 3 and 5 then ' Medium Credit History'
        else 'Long Credit History'
    end as Cred_History_Group,
    round(100 * sum(case
                when `Default` = 'Y' then 1
                else 0
            end) / count(*),
            2) as Default_Rate
from
    credit.credit_risk
group by Cred_History_Group;
