select * from student where stu_height >= 170;

insert into student VALUES(20241025,'��ö��','�ΰ�����',4,'A','M',192.25,88.24);

select * from enrol;

create table emp(
empno number(4) -- �����ȣ
 constraint pk_emp primary key, --PK ����
 ename varchar2(10), --����̸�
 job varchar2(9), -- ����
 mgr number(4), -- �Ŵ���(�����)
hiredate date, -- �Ի�����
 sal number(7,2), -- ����
 comm number(7,2), -- ���ʽ�(�󿩱�)
deptno number(2) -- �μ���ȣ
);


INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,to_date('13-07-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'), 950,NULL,30);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'), 800,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,to_date('13-07-1987','dd-mm-yyyy'),1100,NULL,20);

CREATE TABLE DEPT
(DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY, --�μ���ȣ
 DNAME VARCHAR2(14), --�μ��̸�
 LOC VARCHAR2(13)); --�μ���ġ
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE salgrade
(GRADE NUMBER(7,2), --�޿�
 LOSAL NUMBER(7,2), --�����޿�
 HISAL NUMBER(7,2)); --�����޿�
INSERT INTO salgrade VALUES(1,700,1200);
INSERT INTO salgrade VALUES(2,1201,1400);
INSERT INTO salgrade VALUES(3,1401,2000);
INSERT INTO salgrade VALUES(4,2001,3000);
INSERT INTO salgrade VALUES(5,3001,9999);

select * from emp;
select * from dept;
select * from salgrade;

--���̺� ���� ���캸��
describe student;
desc student;
desc subject;
desc enrol;

-- ���̺� �����ϴ� ��� ������ �˻��Ͽ� ����Ͻÿ�.
select *from student where stu_name = 'ȫ�浿';

select * from enrol;
select * from subject;

insert into subject values('112','�ΰ����� ����','���ּ�',4,'�ΰ�����');
insert into student values(20132003,'ȫ�浿','�ΰ�����',4,'B','M',185.44,75.23);
insert into enrol values('106',20132003,72);

INSERT INTO STUDENT VALUES(20241026,'������','������',3,'A','F',172,63);
insert into subject values('113','������ ����','������',4,'������');
insert into enrol values('113',20241026,100);

--������ ������ �˻�
select stu_no,sub_no,enr_grade,enr_grade+10 from enrol;
select stu_name as NAME from STUDENT;
select stu_name as "�� ��" from STUDENT;
select stu_dept||', '||stu_name||' �Դϴ�.'  as "�а� ����" from STUDENT order by stu_name asc;

select stu_name,stu_dept,stu_grade,stu_class
from student
where stu_dept = '�ΰ�����';

select*from student;
select*from subject;
select*from enrol;

--����
--1��
DESCRIBE student;
desc student;
--2��
desc subject;
--3��
select * from student;
--4��
select * from enrol;
--5��
select stu_no,stu_name from student;
--6��
select sub_no,sub_name from subject;
--7��
select stu_no,stu_name,stu_gender from student;
--8��
select * from student;
--9��
select sub_no,sub_prof from subject;
--10��
select stu_no,stu_name,stu_grade,stu_class from student;
--11��
select sub_no,stu_no,enr_grade from enrol;
--12��
select stu_weight,stu_height,stu_no,stu_name from student;
--13��
select DISTINCT stu_dept from student;
--14��
select DISTINCT stu_gender from student;
--15��
select DISTINCT stu_grade from student;
--16��
select DISTINCT stu_dept,stu_grade from student;
--17��
select DISTINCT stu_dept,stu_class from student;
--18��
select stu_weight+5 from student;
--19��
select stu_weight-5 from student;
--20��
select stu_no as �й�,stu_name as �̸� from student;
--21��
select sub_no as �����ȣ,stu_no as �й�,enr_grade as ���� from enrol;
--22��
select sub_name || sub_prof as ������������ from subject;
--23��
select stu_dept||stu_name from student;
--24��
select stu_dept||'��'||stu_name||'�Դϴ�.'from student;
--25��
select stu_name from student where stu_dept='��ǻ������';
--26��
select * from student where stu_height >=170;
--27��
select * from student where stu_weight >=65;
--28��
select stu_no,stu_name from student where stu_dept='��������';
--29��
select DISTINCT stu_name from student where stu_gender = 'F';
--30��
select * from student where stu_dept<>'��������';
--31��
select stu_no from enrol where enr_grade >=80;
--32��
select * from student where stu_name ='������';
--33��
select * from student where stu_dept='���'and stu_grade=2 ;
--34��
select * from student where stu_gender = 'F' and stu_weight <=60;
--35��
select sub_dept  from subject where sub_dept<>'���';
--36��
select stu_name from student where  stu_dept='��ǻ������'and stu_grade=2 and stu_class = 'A';
--37��
select * from student where stu_grade=1 or stu_grade=3 ;
--38��
select stu_no, stu_name from student where stu_name like '��%' ;
--39��
select stu_name from student where stu_name like '%��%' ;
--40��
select * from student where stu_no like '2015%' ;
--41��
select stu_no, stu_name  from student where stu_height is null ;
--42��
select stu_no, stu_name  from student where stu_height is not null;
--43��
select  stu_no, stu_name   from student where stu_dept='��ǻ������' or stu_dept='���';
--44��
select stu_no, stu_name,stu_dept  from student where stu_gender = 'M' and stu_grade =1;
--45��
select stu_no, stu_name from student order by stu_no;
--46��
select stu_no, stu_name,stu_dept  from student order by stu_dept;
--47��
select * from student order by stu_grade desc;
--48��
select * from student order by stu_dept ,stu_class ;
--49��
select stu_dept||'��'||stu_grade||'�г�'|| stu_name||'�Դϴ�.' from student;

commit;