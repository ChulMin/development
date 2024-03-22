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
--103.�μ���ȣ�� 20, 30���� ������ ��� ����� ��� ������ ����϶�.
select *
from emp
where deptno <>20 and deptno <>30;
--104. �Ի����� 81�⵵�� ����� ��� ������ ����϶�.
select *
from emp
where hiredate like '81%';
--105. Ŀ�̼��� ���� 2000 �̻��� �μ��� �ѱ޿��� �� Ŀ�̼��� ���϶�.
select sum(sal),sum(comm)
from emp
group by deptno 
having sum(comm)>=2000;
--106. �Ի��Ϻ� ��� �޿��� ���϶�.
select avg(sal)
from emp
group by hiredate;
--107. ������ ANALYST�� ����� �̸�, �μ����� ���϶�.
select ename,deptno
from emp
where job ='ANALYST';
--108. �̸��� "M"�ڰ� �� ������� �̸�,�μ���,�޿��� ���϶�.
select ename,deptno,sal
from emp
where ename like '%M%';
--109. DALLAS�� ��ġ�� �μ��� ���� ����� �ѻ����, ��ձ޿�, ��ü�޿�, �ְ�޿�, �����޿��� ���϶� .
select count(*),avg(sal),sum(sal),max(sal),min(sal)
FROM EMP NATURAL JOIN deptf
where loc ='DALLAS';
--110. MANAGER�� ������� ������ ��պ��� ������ ���� ������� �̸��� ������ ����϶�.(subquery)
select ename,sal
from emp
where sal < (select avg(sal) from emp where job = 'MANAGER');
--111. SCOTT�� �޿����� 1000 �� �� �޿����� ���� �޴� ����� �̸�,�޿��� ����϶�.(subquery)
select ename,sal
from emp
where sal < (select sal-1000 from emp where ename = 'SCOTT');
--112. EMP ���̺��� �̸��� 5������ ����� �޿��� ���� ���� ����� �̸�,�޿�,�μ����� ����϶�.
select e.ename,e.sal,d.dname
from emp e,dept d
where e.deptno = d.deptno 
and sal= (select max(sal) from emp where length(ename)>=5) and length(ename)>=5;

select ename,max(sal)
    from emp
    where length(ename) >= 5
    group by ename;

select e.ename, e.sal, d.dname
    from emp e, dept d
    where e.deptno = d.deptno
    and sal = (select max(sal)
                 from emp
                 where length(ename) >= 5)
        and length(ename) >= 5;
        

CREATE TABLE tCity (
name CHAR(10) PRIMARY KEY,
area INT NULL ,
popu INT NULL ,
metro CHAR(1) NOT NULL,
region CHAR(6) NOT NULL
);. 
INSERT INTO tCity VALUES ('����',605,974,'y','���');
INSERT INTO tCity VALUES ('�λ�',765,342,'y','���');
INSERT INTO tCity VALUES ('����',42,21,'n','���');
INSERT INTO tCity VALUES ('û��',940,83,'n','��û');
INSERT INTO tCity VALUES ('����',205,65,'n','����');
INSERT INTO tCity VALUES ('��õ',910,27,'n','����');
INSERT INTO tCity VALUES ('��õ',1116,27,'n','����');
INSERT INTO tCity VALUES ('ȫõ',1819,7,'n','����');

commit;

 select student.*, enrol.*
 from student cross join enrol;
 
select student.stu_no, stu_name, stu_dept, enr_grade
from student, enrol
where student.stu_no = enrol.stu_no;

--? NATURAL JOIN
select stu_no, stu_name, stu_dept, enr_grade
from student natural join enrol;
--?�� ���̺� ���� ���� �̸��� �����ϸ� ���.
--?�ذ���1] JOIN ~ USING
select stu_no, stu_name, stu_dept, enr_grade
from student join enrol using(stu_no) ;
--?�ذ���2] JOIN ~ ON
select student.stu_no, stu_name, stu_dept, enr_grade
from student join enrol on student.stu_no = enrol.stu_no ;

create table CCC (
stu_no number(9),
stu_name varchar2(12),
stu_gender char(1),
stu_hakjum char(1),
stu_kg number(3)); 
drop table CCC;
insert into CCC values(20153075, '���Ѻ�', 'M','A',78);
insert into CCC values(20153088, '���¿�', 'F','B',68);
insert into CCC values(20143054, '������', 'F','C',58);
insert into CCC values(20152088, '���ο�', 'M','A',88);
insert into CCC values(20142021, '�ɼ���', 'F','B',68);
insert into CCC values(20132003, '����ö', 'M','B',68);
insert into CCC values(20151062, '������', 'M','C',58);
insert into CCC values(20141007, '������', 'M','A',88);
insert into CCC values(20131001, '������', 'M','B',68);
insert into CCC values(20131025, '������', 'F','B',68);
insert into CCC values(20131026, '������2', 'F','A',64);

commit;

select stu_no, stu_name, stu_gender, stu_dept, stu_kg
from student natural join CCC; 
select stu_no, student.stu_name, student.stu_gender, stu_dept, stu_kg
from student join CCC using(stu_no);
select stu_no, stu_name, stu_gender, stu_dept, stu_kg
from student join CCC using(stu_no, stu_name, stu_gender);
select student.stu_no, student.stu_name, student.stu_gender, stu_dept, CCC.stu_kg
from student join CCC on student.stu_no = CCC.stu_no;--��� ��µ�

select student.stu_no, stu_name
from student, enrol
where student.stu_no = enrol.stu_no
and sub_no = 101;

select distinct s.stu_no, s.stu_name, e.sub_no, s2.sub_name
from student s, enrol e, subject s2
where s.stu_no = e.stu_no
and e.sub_no = s2.sub_no
and (e.sub_no = 101
or e.sub_no = 104)
order by 1;

select student.stu_no, stu_name
from student, enrol
where student.stu_no = enrol.stu_no
and sub_no = 101 or sub_no = 102;

select student.stu_no, stu_name
from student, enrol
where student.stu_no = enrol.stu_no
and (sub_no = 101 or sub_no = 102);

select stu_no, stu_name, sub_no
from student natural join enrol
where sub_no = 101 or sub_no = 102; 
select stu_no, stu_name, sub_no
from student join enrol using(stu_no)
where sub_no = 101 or sub_no = 102;
select student.stu_no, stu_name, sub_no
from student join enrol on student.stu_no = enrol.stu_no
where sub_no = 101 or sub_no = 102;

select student.stu_no, stu_name, sub_name, subject.sub_no
from student, enrol, subject
where student.stu_no = enrol.stu_no
and enrol.sub_no = subject.sub_no
and (enrol.sub_no = 101 or enrol.sub_no = 102);

select empno, ename, sal, grade
from emp, salgrade
where sal between losal and hisal;

select a.empno as �����ȣ, a.ename as ����̸�, 
b.empno as ����ڻ����ȣ, b.ename as ������̸�
from emp a, emp b
where a.mgr = b.empno;

select a.empno as �����ȣ, a.ename as ����̸�, 
b.empno as ����ڻ����ȣ, b.ename as ������̸�
from emp a JOIN emp b
ON a.mgr = b.empno;

--Outer join
select e.*, sub_name
from enrol e, subject s
where e.sub_no = s.sub_no
order by s.sub_no;

select e.sub_no, e.stu_no, e.enr_grade, sub_name
from enrol e, subject s
where e.sub_no = s.sub_no
order by 1; -- sub_no [o]
select e.*, sub_name
from enrol e, subject s
where e.sub_no = s.sub_no
order by 1; -- [O], s.sub_no [O]

--right outer join����
select a.*, sub_name
from enrol a right outer join subject b
on a.sub_no = b.sub_no
order by 1;

--left outer join����
select a.empno as �����ȣ, a.ename as ����̸�, 
b.empno as ����ڻ����ȣ, b.ename as ������̸�
 from emp a left outer join emp b on a.mgr = b.empno;

--full outer join����
 select a.empno as �����ȣ, a.ename as ����̸�, 
b.empno as ����ڻ����ȣ, b.ename as ������̸�
 from emp a full outer join emp b on a.mgr = b.empno;
