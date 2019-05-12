# 取得每个company中最高薪水的人员名字
# 输出结果包含公司名称和人员名称：companyName name
-- select  companyName ,name from employee as em  inner join company as com on em.companyId = com.id  order by salary desc limit 1 ;

select companyName, name from(
select companyName,companyId,max(salary) as maxSalary
from employee as em inner join company as com on em.companyId = com.id group by em.companyId
) as tmp inner  join  employee as em0 on tmp.companyId = em0.companyId and tmp.maxSalary = em0.salary;