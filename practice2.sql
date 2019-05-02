# 取得每个company中最高薪水的人员名字
# 输出结果包含公司名称和人员名称：companyName name
select  companyName ,name from employee as em  inner join company as com on em.companyId = com.id  order by salary desc limit 1 ;
