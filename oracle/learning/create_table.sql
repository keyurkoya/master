--Tables are the basic unit of data storage in an Oracle Database.
--Data is stored in rows and columns. You define a table with a table name, such as employees, and a set of columns.
--You give each column a column name, such as employee_id, last_name, and job_id; a datatype, such as VARCHAR2, DATE, or NUMBER; and a width.
--The width can be predetermined by the datatype, as in DATE. If columns are of the NUMBER datatype, define precision and scale instead of width.
--A row is a collection of column information corresponding to a single record.
--You can specify rules for each column of a table. These rules are called integrity constraints. One example is a NOT NULL integrity constraint.
--This constraint forces the column to contain a value in every row.
--For example:

create table DEPARTMENTS
(
    deptno number,
    name varchar2(50) not null,
    location varchar2(50),
    constraint pk_departments primary key (deptno)
);

--Tables can declarative specify relationships between tables, typically referred to as referential integrity.
--To see how this works we can create a "child" table of the DEPARTMENTS table by
--including a foreign key in the EMPLOYEES table that references the DEPARTMENTS table. For example:

create table employees
(
    empno number,
    name varchar2(50) not null,
    job varchar2(50),
    manager number,
    hiredate date,
    salary number (7,2),
    commission number(7,2),
    deptno number,
    CONSTRAINT pk_employees primary key (empno),
    CONSTRAINT fk_departments_deptno foreign key (deptno)
    references departments (deptno)
);