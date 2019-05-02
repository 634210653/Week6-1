#取得平均薪水最高的公司
#输出公司名称和平均薪水：companyName avgSalary

select companyName,avg(salary) as avgSalary from employee as em  inner join company as com on em.companyId = com.id
group by companyId
order by avgSalary desc limit 1;
