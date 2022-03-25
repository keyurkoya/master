--Triggers are procedures that are stored in the database and are implicitly run, or fired, when something happens.
--Traditionally, triggers supported the execution of a procedural code, in Oracle procedural SQL is called a PL/SQL block.
--PL stands for procedural language. When an INSERT, UPDATE, or DELETE occurred on a table or view.
--Triggers support system and other data events on DATABASE and SCHEMA.

--Triggers are frequently used to automatically populate table primary keys, the trigger
--examples below show an example trigger to do just this.
--We will use a built in function to obtain a globallally unique identifier or GUID.


create or replace trigger  DEPARTMENTS_BIU
    before
insert or
update on DEPARTMENTS
    for each row
begin
    if inserting and :new.deptno is null then
        :new.deptno := to_number
    (sys_guid
    (), 
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
end
if;
end;
/

create or replace trigger EMPLOYEES_BIU
    before
insert or
update on EMPLOYEES
    for each row
begin
    if inserting and :new.empno is null then
        :new.empno := to_number
    (sys_guid
    (), 
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
end
if;
end;
/