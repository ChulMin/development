select * from emp;
select * from dept;
select * from enrol;
--1. 10�� �μ� ������ ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
select avg(sal),max(sal),min(sal),count(sal) 
from emp
where deptno =10;
--2. �� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
select avg(sal),max(sal),min(sal),count(sal) 
from emp
group by deptno ;
--3. �Ի����� ��2022�� 5�� 14��" �� �������� �̸�, �Ի����� ����϶�.
select ename,to_char(hiredate,'yyyy"��" mm"��" dd"��"')
from emp;
--4. �Ի��� ���� ���ݱ����� ��¥���� ����϶�. --��¾���� �μ���ȣ, �̸�, �Ի���, ������, �ٹ��ϼ�(�Ҽ��� ���� ����), �ٹ� ���, �ٹ� ����, �ٹ� �ּ��� ����϶�.
select deptno,ename,sysdate, FLOOR((sysdate-hiredate)+1),FLOOR(((sysdate-hiredate)+1)/365),floor(months_between(sysdate,hiredate)),FLOOR(((sysdate-hiredate)+1)/7)
from emp;
--5. Ŀ�̼��� NULL�� �ƴ� ����� ������ ����϶�.
select ename
from emp
where comm is not null;
--6. ��� ����� �Ǽ��ɾ��� ����Ͽ� ����϶�.  -- �� �޿��� ���� ������ �̸�, �޿�, �Ǽ��ɾ��� ����϶�. -- (�Ǽ��ɾ��� �޿��� ���� 10%�� ������ �� �ݾ�)
select sal-(sal*0.1)
from emp
order by sal desc;
--7. �Ի��Ϸ� ���� 6������ ���� ���� �Ի���, 6���� ���� ��¥, �޿��� ����϶�.
select ADD_MONTHS(hiredate, 6),ADD_MONTHS(sysdate, 6),sal
from  emp;
--8. �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ��� ���Ͽ� �ҹ��ڷ� �̸����� ����϶�.
select LOWER(LPAD(ename,3))||ename
from emp
where LENGTH(ename)>=6;
--9. ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.
select distinct job,count(job)
from emp
group by job
having  count(job)>=4;
--10. �� �μ��� ��� ����, ��ü ����, �ְ� ����, ���� ���� �� ���Ͽ� ��� ������ ���� ������ �����
select avg(sal),sum(sal),max(sal),min(sal)
from emp
group by deptno
order by avg(sal) desc;
--11. �̸��� ALLEN�� ����� �μ���� �μ���ġ�� ����϶�. --natural join
select dname,loc
from dept natural join emp
where ename='ALLEN';
--12. ȸ�系�� �ּұ޿��� �ִ�޿��� ���̸� ���϶�
select max(sal)-min(sal)
from emp;
--13. JOB�� �� JOB�� ���� ������� ����϶�.
select job,count(job)
from emp
group by job;
--14. �̸��� "M"�ڰ� �� ������� �̸�,�μ���,�޿��� ���϶�
select ename,dname,sal
from emp natural join dept
where ename like '%M%';
--15. SCOTT�� �޿����� 1000 �� �� �޿����� ���� �޴� ����� �̸�, �޿��� ����϶�.
select ename,sal
from emp
where sal < (select sal-1000 from emp where ename='SCOTT');
--16. JOB�� MANAGER�� ����� �� �ּұ޿��� �޴� ������� �޿��� ���� ����� �̸�, �޿��� ����϶�.
select ename,sal
from emp
where sal<(select min(sal) from emp where job ='MANAGER');
--17. WARD�� �Ҽӵ� �μ� ������� ��� �޿����� �޿��� ���� ����� �̸� ,�޿��� ����϶�.
select ename,sal
from emp
where sal > (select avg(sal) from emp where DEPTNO =(SELECT DEPTNO
FROM  EMP
WHERE ENAME = 'WARD'));
--50. �л����� ������ �ҹ��ڷ� �˻��϶�.
select lower(stu_gender) from student;
--51. �л����� �̸��� �̸��� ù 2���ڸ� �˻��϶�.
select stu_name,lpad(stu_name,2)
from student;
--52. �л����� �̸��� �̸��� ���̸� �˻��϶�.
select stu_name,length(stu_name)
from student;
--53. �л����� �̸��� ���衯�� �� ��° �ִ��� �˻��϶�.
select instr(stu_name,'��')
from student;
--54. �л����� �а��� ���⡯�� �� ��° �ִ��� �˻��϶�.
select instr(stu_dept,'��')
from student;
--55. �л��� �а��� 20�ڸ��� �ϰ�, �տ� ��%���� ä���� �˻��϶�.
select LPAD(stu_dept,20,'%')
from student;
--56. ���忭�� ���� NULL�� �л��� ��� ���̱�ϡ����� �˻��϶�.
select nvl(to_char(stu_height),'�̱��')
from student;
--57. �л� �߿��� ���� Ű�� ū �л��� ������ �й�, �̸��� �Բ� �˻��϶�.
select stu_no,stu_name
from student
where stu_height = (select max(stu_height)from student);
--58. �л� �߿��� ���� ���� ü���� ������ �л��̸��� ü���� �˻��϶�.
select stu_name,stu_weight
from student
where stu_weight = (select min(stu_weight)from student);
--59.�а��� ���� �˻��϶�.
select count(distinct sub_dept)
from subject;
--60.�л����� ������ ���� �˻��϶�.
select count(distinct lpad(stu_name,2))
from student;
--61.�г⺰ �л����� �˻��϶�.
select COUNT(distinct stu_grade)
from student;
--62.�г⺰ �л����� �ο����� ���� ������ �˻��϶�.
select stu_grade,COUNT(stu_name)
from student
group by stu_grade;
--63.�а��� �л����� ��� ������ �˻��϶�.
select stu_dept,avg(stu_height)
from student
group by stu_dept;
--64.�а��� �л����� ü���� ǥ�������� �˻��϶�.
select stu_dept,STDDEV(stu_weight)
from student
group by stu_dept;
--65.�а��� �г⺰ �л����� ��� ü���� �˻��϶�.
select stu_dept,avg(stu_weight)
from student
group by stu_dept;
--66.�а��� �л����� �ο����� ���� ������ �˻��϶�.
select stu_dept,count(*)
from student
group by stu_dept
order by count(*) desc;
--67.�а��� �г⺰ �л����� ��� ü���� ���� ������ �˻��϶�.
select stu_dept,avg(stu_weight)
from student
group by stu_dept
order by avg(stu_weight) desc;
--68.�а��� �л����� ��� ������ ���� ������ �˻��϶�.
select stu_dept,avg(stu_height)
from student
group by stu_dept
order by avg(stu_height) desc;

--47.������� ����̸��� �ҹ��ڷ� �˻��϶�.
select lower(ename)
from emp;
--48.������� ����̸�, ��������� �ҹ��ڷ� �˻��϶�.
select lower(ename),lower(job)
from emp;
--49.������� ����̸��� �빮�ڷ� �˻��϶�.
select upper(ename)
from emp;
--50.������� ����̸�, ��������� �빮�ڷ� �˻��϶�.
select upper(ename),upper(job)
from emp;
--51.������� ����̸��� ù �ڸ� �빮�ڷ� �˻��϶�.
select INITCAP(ename)
from emp;
--52.������� ����̸��� ��������� ù �ڸ� �빮�ڷ� �˻��϶�.
select INITCAP(ename),INITCAP(job)
from emp;
--53.������� ����̸��� ��������� �����Ͽ� �˻��϶�.
select CONCAT(ename,job)
from emp;
--54.������� ����̸��� ����̸��� ù �� ���ڸ� �˻��϶�.
select ename,lpad(ename,2)
from emp;
--55.�����ȣ���� ����̸�, ������� �׸��� ��������� �� ��°���� �� ���ڸ� �˻��϶�.
select ename,job,SUBSTR(job,2,3)
from emp;
--56.������� ����̸��� ����̸��� ���̸� �˻��϶�.
select ename,length(ename)
from emp;
--57.������� ����̸��� ��������� �ڸ����� �˻��϶�.
select ename,length(job)
from emp;
--58.������� ����̸��� ��A���� �� �� ° ��ġ�� ��� �ִ��� �˻��϶�.
select INSTR(ename,'A')
from emp;
--59.��������� ��A���� �� �� ° ��ġ�� ��� �ִ��� �˻��϶�.
select INSTR(job,'A')
from emp;
--60.����̸��� 15�ڸ��� �ϰ�, �ڿ� ��&���� ä���� �˻��϶�.
select rpad(ename,15,'&')
from emp;
--61.��������� 20�ڸ��� �ϰ�, �տ� ��%���� ä���� �˻��϶�.
select lpad(job,20,'%')
from emp;
--62.����� �����ȣ, ����̸��� �޿��� �˻��϶�. (�޿��� �� ��° �ڸ����� �ݿø���)
select empno,ename,round(sal,-2)
from emp;
--63.����� �����ȣ, ����̸�, �޿��� �˻��϶�. (�޿��� �� ��° �ڸ����� ������)
select empno,ename,trunc(sal,-2)
from emp;
--64.�����ȣ�� �޿��� 100���� ���� �������� �˻��϶�.
select empno,MOD(sal,100)
from emp;
--65.�����ȣ, ����̸�, �Ի���, �Ի� �� 100���� ��¥�� �˻��϶�.
select empno,ename,hiredate,hiredate+100
from emp;
--66.�����ȣ, ����̸�, �Ի���, �ٹ� ���ڸ� ����Ͽ� �˻��϶�.
select empno,ename,hiredate,sysdate-hiredate
from emp;
--67.������� �Ի��Ͽ��� 3��° �Ǵ� ��¥�� �˻��϶�.
select ADD_MONTHS(hiredate,3)
from emp;
--68.������� �Ի��� ���� ������� ��¥�� �˻��϶�.
select next_day(hiredate,6)
from emp;
--69.������� �Ի� ���� ������ ��¥�� �˻��϶�.
select last_day(hiredate)
from emp;
--70.������� �Ի����� ���� �������� �ݿø��Ͽ� �˻��϶�.
select round(hiredate,'year')
from emp;
--71.������� �Ի����� ���� �������� �����Ͽ� �˻��϶�.
select trunc(hiredate,'year')
from emp;
--72.����ڻ����ȣ�� ���� ��� ������� �������� ��Ÿ������ ���ǹ��� �ۼ��϶�. 
select nvl(to_char(mgr),'����� ����')
from emp;
--73.�󿩱��� ������ �޿��� �����ȣ, ����̸��� �Բ� �˻��϶�. 
select sal+nvl(comm,0)empno,ename
from emp;
--74.�󿩱��� ������ ������ �����ȣ, ����̸��� �Բ� �˻��϶�. 
select (sal*12)+nvl(comm,0)empno,ename
from emp;
--75.����ڻ����ȣ�� NULL�� ��� ��CEO���� �����Ͽ� �����ȣ, ����̸�, ����ڻ����ȣ�� �˻��϶�.
select empno,ename,nvl(to_char(mgr),'CEO')
from emp;
--76.��ü ����� �� �ְ� �󿩱��� �޴� ����� �����ȣ, ����̸�, �󿩱��� �˻��϶�.(subquery)
select empno,ename,comm
from emp
where comm = (select max(comm)from emp);
--77.��ü ����� �� ���� �󿩱��� �޴� ����� �����ȣ, ����̸�, �󿩱��� �˻��϶�.(subquery)
select empno,ename,comm
from emp
where comm = (select min(comm)from emp);
--78.��ü ����� ����̸� �� MAX�� MIN���� �˻��϶�.
select max(ename),min(ename)
from emp;
--79.��ü ����� �Ի��� �� MAX�� MIN���� �˻��϶�.
select max(hiredate),min(hiredate)
from emp;
--80.��ü ����� �����ȣ �� MAX�� MIN���� �˻��϶�.
select max(empno),min(empno)
from emp;
--81.����ڻ����ȣ ���� ������ �˻��϶�.
select length(mgr)
from emp;
--82.����̸��� ������ �˻��϶�. 
select length(ename)
from emp;
--83.��� ���̺��� Ʃ�� ���� �˻��϶�. 
select count(*)
from emp;
--84.�μ� ���̺��� Ʃ�� ���� �˻��϶�. 
select count(*)
from dept;
--85.�󿩱��� ������ �˻��϶�.
select count(comm)
from emp;
--86.�μ��� ������� �ο����� �˻��϶�.
select deptno,count(distinct ename)
from emp
group by deptno;
--87.����� ��� ��ȣ�� ������� �ο����� �˻��϶�.
select mgr,count(distinct ename)
from emp
group by mgr;
--88.�μ��� ������� ��� �޿��� �˻��϶�.
select deptno,avg(sal)
from emp
group by deptno;
--89. �μ��� ������� �޿��� ǥ�������� �˻��϶�.
select deptno,STDDEV(sal)
from emp
group by deptno;
--90.�μ��� ��� ������ ����� �޿� ���� �˻��϶�.
select deptno,job,sum(sal)
from emp
group by deptno,job;
--91.�μ��� ��� ������ ������� ��� �޿��� �˻��϶�.
select deptno,job,avg(sal)
from emp
group by deptno,job;
--92. �μ��� ��� ������ ������� �Ի����� MAX�� MIN ���� �˻��϶�. 
select deptno,job,max(hiredate),min(hiredate)
from emp
group by deptno,job;
--93. �μ��� ������� �ο����� �ο����� ���� ������ �˻��϶�. 
select deptno,count(*)
from emp
group by deptno;
--94.�μ��� ������� ��� �޿��� ��� �޿� ������ �˻��϶�. 
select deptno,avg(sal)
from emp
group by deptno
order by avg(sal);

--95.�μ���, ��� ������ ����� �޿� ���� ���� ������ �˻��϶�.
select deptno,job,sum(sal)
from emp

group by deptno,job
order by sum(sal) desc;
--96. �μ���, ��� ������ ������� ��� �޿��� ���� ������ �˻��϶�.
select deptno,job,avg(sal)
from emp
group by deptno,job
order by avg(sal) desc;
--97.��� ����鿡�� �޿��� 20%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ� �ݾ��� ����϶�.
select ename,sal,sal*0.2
from emp;
--98.�޿��� 2,000 �̻��� ��� ����� �޿��� 15%�� ������� ����� �Ͽ���. �̸�, �޿�, ������ �� ����϶�.
select ename,sal,sal*0.15
from emp
where sal >=2000;
--99. �μ���ȣ�� 20�� �μ��� �ð��� �ӱ��� ����Ͽ� ����϶�.
select deptno,(sal/4)/7
from emp
where deptno =20;
--100. �Ի����� 81/04/02���� �ʰ� 82/12/09���� ���� ��� ������ ����϶�.
select *
from emp
where hiredate >='81/04/02' and hiredate <='82/12/09';
--101.�޿��� 1,600���� ũ�� 3,000���� ���� ����� �̸�, ����(����), �޿��� ����϶�.
select ename,job,sal
from emp
where sal > 1600 and sal < 3000 ;
--102. ������ MANAGER�� SALESMAN�� ����� ��� ������ ����϶�. --��, �μ���ȣ�� ASCENDING SORT �� �� �޿��� ���� ��� ������ ����϶�.
select *
from emp
where job = 'MANAGER' or job = 'SALESMAN' 
ORDER BY deptno desc;
select *
from emp;
