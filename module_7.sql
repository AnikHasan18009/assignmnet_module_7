
/*Creating datbase for XYZ Corp*/
create database xyz_corp;
use xyz_corp;

/* Creating departments table where ID is the primary key*/
create table departments(
id int auto_increment,
name varchar(60) not null,
manager varchar(60) not null,
primary key(id)
);

/* Creating employees table where ID is the primary key and department_id is a foreign key*/
create table employees(
id int primary key auto_increment ,
name varchar(60) not null,
age int not null,
salary int not null,
department_id int not null,
constraint fk_dept_id foreign key(department_id) references departments(id)
);
/*Following command starts employee ID from 1000 */
Alter table employees  auto_increment=1000;


/*Inserting data into both tables*/
insert into departments(name,manager) values ("HR","Anik Hasan"),
											("IT","Rashed Hossen"),
                                            ("Finance","Porosh Shikder"),
                                            ("Marketing","Siam Sheikh"),
                                            ("Administration","Toukik Rahman");
                                            
insert into employees(name,age,salary,department_id) values
("Anik Hasan",33,55000,1),
("Rashed Hossen",35,52000,2),
("Porosh Shikder",34,50000,3),
("Siam Sheikh",38,62000,4),
("Toukik Rahman",40,70000,5),
("Rakib Rahman",24,20000,1),
("Milon Hossen",25,22000,2),
("Rashid Shikder",24,24000,3),
("Mridul Sheikh",28,32000,4),
("Rakib Rahman",26,35000,5),
("Faisal Azam",35,45000,2);


/*Queries on Employees Table*/
/*Query to select all columns and rows from the employees table.*/
select * from employees;

/*Query to select only the name and salary columns of all employees
 with a salary greater than 50000.*/
select name,salary from employees where salary>50000;

/*Query to calculate the average salary of all employees with aggregate function.*/
select avg(salary) as 'AverageSalary' from employees;

/*Query to count the number of employees
 who work in the "Marketing" department using inner join, aggregate function,where clause. */
select count(*) as 'NumberOfEmployees' from employees as emp join departments as dep
 on emp.department_id=dep.id where dep.name="Marketing"; 
 
 /*Query to update the salary column of the 
employee with an id of 1001 to 60000 using update statement and where clause.*/
update employees set salary=60000 where id=1001;
select * from employees;

/*Query to delete all employees whose salary is less than 30000 using delete statement and where clause.*/
delete from employees where salary<30000;
select * from employees;

/*Queries on Departments Table*/
/*Query to select all columns and rows
 from the departments table.*/
select * from departments;
 
 /*Query to select only the name and manager columns of the "Finance" department using where clause*/
select name,manager from departments where name="Finance";
 
 /*Query to calculate the total number of employees in each department using inner join ,aggregate function and group by clause*/
select count(*) as total,dep.name from employees as emp join departments as dep
 on emp.department_id=dep.id  group by department_id; 

/*Query to insert a new department called "Research" with a manager named "John Doe".*/
insert into departments(name,manager) values("Research","John Doe");
select * from departments;

