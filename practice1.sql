# 1.创建数据库employee_db

# 2.在数据库employee_db中创建table：`Employee`

# 3.将`employee-data.csv`文件中的数据导入数据表Employee中

# 4.在数据库employee_db中创建table：`Company`

# 5.将`company-data.csv`文件中的数据导入Company数据表中

# 6.找出Employee表中姓名包含`n`字符并且薪资大于6000的雇员所有个人信息

# ps:本练习中只需要将6的结果复制到`result.txt`文件中

create database employee_db;

use employee_db;

CREATE TABLE IF NOT EXISTS `Employee`(
   `id` INT UNSIGNED NOT NULL,
   `name` VARCHAR(50) NOT NULL,
   `age` INT UNSIGNED,
   `gender` VARCHAR(10) NOT NULL,
   `companyId`  INT UNSIGNED NOT NULL,
   `salary` DOUBLE NOT NULL,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

LOAD DATA LOCAL INFILE 'E:\\tmp\\TW\\Week6\\MySQL-Quiz-2019-3-14-7-49-4-960\\employee-data.csv' 
REPLACE INTO TABLE employee_db.Employee
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

#select * from employee;

CREATE TABLE IF NOT EXISTS `Company`(
   `id` INT UNSIGNED NOT NULL,
   `companyName` VARCHAR(50) NOT NULL,
   `employeesNumber`  INT UNSIGNED,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOAD DATA LOCAL INFILE 'E:\\tmp\\TW\\Week6\\MySQL-Quiz-2019-3-14-7-49-4-960\\company-data.csv' 
REPLACE INTO TABLE employee_db.Company
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

#select * from Company;

ALTER TABLE `Employee` ADD  FOREIGN KEY (`companyId`  ) REFERENCES `Company`(`id`);

select  em.id,name,age,gender,companyId,salary, companyName , employeesNumber
from employee as em  inner join company as com on em.companyId = com.id where em.name like '%n%'  ;