select * from emp;
select * from dept;
select * from salgrade;
--과제
--1번
desc emp;
--2번
desc dept;
--3번
desc salgrade;
--4번
select empno,ename,job from emp;
--5번
select deptno,dname from dept;
--6번
select dname,loc from dept;
--7번
select sal,comm from emp;
--8번
select distinct hiredate from emp;
--9번
select distinct mgr from emp;
--10번
select deptno from emp;
--11번
select sal*6 from emp;
--12번
select comm*6 from emp;
--13번
select ename as Name, sal as Salary from emp;
--14번
select empno as 사원번호, ename as 사원이름, hiredate as 입사일, deptno as 부서번호
from emp;
--15번
select deptno as 부서번호, dname as 부서이름, loc as  지역 from dept;
--16번
select job||ename from emp;
--17번
select to_char(hiredate,'yy-mm-dd')||'에 입사한 '||ename||'입니다.' from emp;
--18번
select ename from emp where deptno = 10;
--19번
select empno,ename from emp where sal >= 2000;
--20번
select empno,ename from emp where job ='CLERK';
--21번
select ename from emp where hiredate ='19801217';
--22번
select dname,loc from dept where deptno !=30; 
--23번 
select losal,hisal from salgrade where grade =5;
--24번
select * from emp where ename ='WARD';
--25번
select ename from emp where deptno = 10 and job ='MANAGER';
--26번
select empno,ename from emp where sal >= 2000 and deptno = 30;
--27번
select empno,ename from emp where job ='CLERK' and to_char(hiredate,'yy') >81;
--28번
select ename from emp where deptno <>20 and job = 'MANAGER';
--29번
select dname from dept where loc<>'BOSTON';
--30번
select ename from emp where job ='SALESMAN' and sal >= 1500;
--31번
select empno,ename,sal from emp where sal >=1000 and sal <=2500;
--32번
select empno,ename,deptno from emp where empno like '75%';
--33번
select ename,sal from emp where deptno = 10 or deptno = 30;
--34번
select ename from emp where mgr like '76%';
--35번
select ename,sal,comm from emp where empno like '79%';
--36번
select empno,ename,deptno from emp where hiredate like '81/02%';
--37번
select empno,ename from emp where ename like '%A%';
--38번
select empno,ename from emp where mgr is null;
--39번
select empno,ename,mgr from emp where mgr is not null;
--40번
select ename from emp where empno = 7902 or empno = 7781;
--41번
select empno,ename from emp where empno in(7698,7839); 
--42번 
select empno,ename,deptno from emp where job ='MANAGER' or job = 'SALESMAN';
--43번
select empno,ename from emp order by empno;
--44번
select empno,ename from emp order by deptno;
--45번
select empno from emp order by deptno, sal desc;
--46번
select empno from emp order by job, sal;
commit;

select round(345.678), round(345.678, 0),
round(345.678, 1), round(345.678, 2), round(345.678, 3),
round(655.678, 1), round(655.678, 2), round(655.678, 3),
round(345.678, -1), round(345.678, -2), round(345.678, -3),
round(655.678, -1), round(655.678, -2), round(655.678, -3)
from dual;
 
select trunc(345.678), trunc(345.678, 0),
trunc(345.678, 1), trunc(355.678, 2), trunc(355.678, 3), trunc(355.67890, 3), trunc(355.67890, 4)
from dual;
select mod(100, 3) from dual; 
select floor(123.4567) from dual;--123
select trunc(345.678), trunc(345.678, 0) from dual;-- 345

create table employees(
EMPLOYEE_ID NUMBER(6,0) primary key,
EMPLOYEE_NAME VARCHAR2(20) not null,
EMPLOYEE_EMAIL VARCHAR2(25) not null,
PHONE_NUMBER VARCHAR2(20) not null,
HIRE_DATE DATE not null,
JOB_ID VARCHAR2(10) not null,
SALARY NUMBER(8,2) not null,
COMMISSION NUMBER(6,2) not null,
MANAGER_ID NUMBER(6,0) not null,
DEPARTMENT_ID NUMBER(4,0) not null
);
insert into employees values(100,'StevenKing','StevenKing@StevenKing.com','010.123.4567','03/06/17','ITProg',24000,90,109, 10);
insert into employees values(101,'NeenaKochhar','Neena@NeenaKochhar.com','010.123.4568','05/09/21','Account',17000,100,90,20);
insert into employees values(102,'Lex','LDEHAAN@ldhan.com','010.123.4569','01/01/13','ITDataBase',17000,100,90,30);
insert into employees values(103,'Alexander','Hunold@AHUNOLD.com','010.423.4567','06/01/03','IT_PROG',9000,102,60,40);
insert into employees values(104,'Bruce','Ernst@BERNST.com','010.423.4568','07/05/21','IT_PROG',6000,103,60,50);
insert into employees values(105,'David','Austin@DAUSTIN.com','010.423.4569','05/06/25','IT_PROG',4800,103,60,60);
insert into employees values(106,'Valli','Pataballa@VPATABAL.com','010.423.4560','06/02/05','IT_PROG',4800,103,60,70);
insert into employees values(107,'Diana','Lorentz@DLORENTZ.com','010.423.5567','07/02/07','IT_PROG',4200,103,60,80);
insert into employees values(108,'Nancy','Greenberg@NGREENBE.com','010.124.4569','02/08/17','FI_MGR',12008,101,100,90);
insert into employees values(109,'Daniel','Faviet@DFAVIET.com','010.124.4169','02/08/16','FI_ACCOUNT',9000,108,100,100);
select * from employees;

commit;

select lower(stu_gender) from student;
select lower(EMPLOYEE_NAME) from employees;
select upper(EMPLOYEE_NAME) from employees;
select initcap(EMPLOYEE_NAME) from employees;
select concat(EMPLOYEE_NAME, job_id) from employees;
select EMPLOYEE_NAME, substr(EMPLOYEE_NAME, 3,7) from employees;
select EMPLOYEE_NAME, length(EMPLOYEE_NAME) from employees;
select EMPLOYEE_NAME, instr(EMPLOYEE_NAME, 'ex') from employees;
select lpad(EMPLOYEE_NAME, 15, '%') from employees;
select rpad(EMPLOYEE_NAME, 15, '&') from employees;

