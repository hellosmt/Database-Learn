#进阶一：基础查询
/*
语法：
select 查询列表 from 表名;

特点：
1、查询的结果集 是一个虚拟表
2、select 查询列表  类似于System.out.println(打印内容);

select后面跟的查询列表，可以有多个部分组成，中间用逗号隔开
例如：select 字段1,字段2,表达式 from 表;

System.out.println()的打印内容，只能有一个。


3、执行顺序

① from子句（先查看该表是否存在）
② select子句

4、查询列表可以是：字段、表达式、常量、函数等
*/
 USE myemployees;

#一、查询常量
SELECT 100 ;

#二、查询表达式
SELECT 100%3;

#三、查询单个字段
SELECT `last_name` FROM `employees`;

#四、查询多个字段
SELECT `last_name`,`email`,`employee_id` FROM employees;

#五、查询所有字段
SELECT * FROM `employees`;


#F12:对齐格式
SELECT 
    `last_name`,
    `first_name`,
    `last_name`,
    `commission_pct`,
    `hiredate`,
    `salary` 
FROM
    employees ;
    
#六、查询函数（调用函数，获取返回值）
SELECT DATABASE();
SELECT VERSION();
SELECT USER();

#七、起别名
#方式一：使用as关键字

SELECT USER() AS 用户名;
SELECT USER() AS "用户名";
SELECT USER() AS '用户名';

SELECT last_name AS "姓 名" FROM employees;


#方式二：使用空格


SELECT USER()   用户名;
SELECT USER()   "用户名";
SELECT USER()   '用户名';

SELECT last_name   "姓 名" FROM employees;


#八、+的作用
-- 需求：查询 first_name 和last_name 拼接成的全名，最终起别名为：姓 名

#方案1：使用+    pass×   (错误的，结果时 0+0=0)
SELECT first_name+last_name AS "姓 名"
FROM employees;



#方案2：使用concat拼接函数(如果其中有一个字段是null，则出来那条结果也是null，所以要使用IFNULL())

SELECT CONCAT(first_name,last_name) AS "姓 名"
FROM employees;


/*
IFNULL(表达式1,表达式2)
表达式1：可能为null的字段或者表达式
表达式2：如果表达式为null，则该字段显示的值

*/
#例：显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成 OUT_PUT
SELECT CONCAT(`first_name`,',',`email`,',',`phone_number`, `commission_pct`) AS OUT_PUT FROM `employees`;

SELECT CONCAT(`first_name`,',',`email`,',',`phone_number`, IFNULL(`commission_pct`, '')) AS OUT_PUT FROM `employees`;

/*

Java中+的作用：
1、加法运算
	100+1.5      'a'+2    1.3+'2'
	
2、拼接符
	至少有一个操作数为字符串
	"hello"+'a'
	
	
mysql中+的作用：
1、加法运算

①两个操作数都是数值型
100+1.5

②其中一个操作数为字符型
将字符型数据强制转换成数值型,如果无法转换，则直接当做0处理

'张无忌'+100===>100


③其中一个操作数为null

null+null====》null

null+100====》 null



*/

    
    
#九、distinct的使用

#需求：查询员工涉及到的部门编号有哪些


SELECT DISTINCT department_id FROM employees;


#十、查看表的结构

DESC employees;
SHOW COLUMNS FROM employees;
    

    
    
    
    
    
    
    
    
    
    
    
    

