select * from emp;
select * from dept;
select * from salgrade;
--����
--1��
desc emp;
--2��
desc dept;
--3��
desc salgrade;
--4��
select empno,ename,job from emp;
--5��
select deptno,dname from dept;
--6��
select dname,loc from dept;
--7��
select sal,comm from emp;
--8��
select distinct hiredate from emp;
--9��
select distinct mgr from emp;
--10��
select deptno from emp;
--11��
select sal*6 from emp;
--12��
select comm*6 from emp;
--13��
select ename as Name, sal as Salary from emp;
--14��
select empno as �����ȣ, ename as ����̸�, hiredate as �Ի���, deptno as �μ���ȣ
from emp;
--15��
select deptno as �μ���ȣ, dname as �μ��̸�, loc as  ���� from dept;
--16��
select job||ename from emp;
--17��
select to_char(hiredate,'yy-mm-dd')||'�� �Ի��� '||ename||'�Դϴ�.' from emp;
--18��
select ename from emp where deptno = 10;
--19��
select empno,ename from emp where sal >= 2000;
--20��
select empno,ename from emp where job ='CLERK';
--21��
select ename from emp where hiredate ='19801217';
--22��
select dname,loc from dept where deptno !=30; 
--23�� 
select losal,hisal from salgrade where grade =5;
--24��
select * from emp where ename ='WARD';
--25��
select ename from emp where deptno = 10 and job ='MANAGER';
--26��
select empno,ename from emp where sal >= 2000 and deptno = 30;
--27��
select empno,ename from emp where job ='CLERK' and to_char(hiredate,'yy') >81;
--28��
select ename from emp where deptno <>20 and job = 'MANAGER';
--29��
select dname from dept where loc<>'BOSTON';
--30��
select ename from emp where job ='SALESMAN' and sal >= 1500;
--31��
select empno,ename,sal from emp where sal >=1000 and sal <=2500;
--32��
select empno,ename,deptno from emp where empno like '75%';
--33��
select ename,sal from emp where deptno = 10 or deptno = 30;
--34��
select ename from emp where mgr like '76%';
--35��
select ename,sal,comm from emp where empno like '79%';
--36��
select empno,ename,deptno from emp where hiredate like '81/02%';
--37��
select empno,ename from emp where ename like '%A%';
--38��
select empno,ename from emp where mgr is null;
--39��
select empno,ename,mgr from emp where mgr is not null;
--40��
select ename from emp where empno = 7902 or empno = 7781;
--41��
select empno,ename from emp where empno in(7698,7839); 
--42�� 
select empno,ename,deptno from emp where job ='MANAGER' or job = 'SALESMAN';
--43��
select empno,ename from emp order by empno;
--44��
select empno,ename from emp order by deptno;
--45��
select empno from emp order by deptno, sal desc;
--46��
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

