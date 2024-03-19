select * from student where stu_height >= 170;

insert into student VALUES(20241025,'김철민','인공지능',4,'A','M',192.25,88.24);

select * from enrol;

create table emp(
empno number(4) -- 사원번호
 constraint pk_emp primary key, --PK 선언
 ename varchar2(10), --사원이름
 job varchar2(9), -- 직무
 mgr number(4), -- 매니저(상급자)
hiredate date, -- 입사일자
 sal number(7,2), -- 연봉
 comm number(7,2), -- 보너스(상여금)
deptno number(2) -- 부서번호
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
(DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY, --부서번호
 DNAME VARCHAR2(14), --부서이름
 LOC VARCHAR2(13)); --부서위치
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE salgrade
(GRADE NUMBER(7,2), --급여
 LOSAL NUMBER(7,2), --하위급여
 HISAL NUMBER(7,2)); --상위급여
INSERT INTO salgrade VALUES(1,700,1200);
INSERT INTO salgrade VALUES(2,1201,1400);
INSERT INTO salgrade VALUES(3,1401,2000);
INSERT INTO salgrade VALUES(4,2001,3000);
INSERT INTO salgrade VALUES(5,3001,9999);

select * from emp;
select * from dept;
select * from salgrade;

--테이블 구조 살펴보기
describe student;
desc student;
desc subject;
desc enrol;

-- 테이블에 존재하는 모든 데이터 검색하여 출력하시오.
select *from student where stu_name = '홍길동';

select * from enrol;
select * from subject;

insert into subject values('112','인공지능 개론','김휘수',4,'인공지능');
insert into student values(20132003,'홍길동','인공지능',4,'B','M',185.44,75.23);
insert into enrol values('106',20132003,72);

INSERT INTO STUDENT VALUES(20241026,'장현정','빅데이터',3,'A','F',172,63);
insert into subject values('113','빅데이터 개론','김형기',4,'빅데이터');
insert into enrol values('113',20241026,100);

--수식을 포함한 검색
select stu_no,sub_no,enr_grade,enr_grade+10 from enrol;
select stu_name as NAME from STUDENT;
select stu_name as "이 름" from STUDENT;
select stu_dept||', '||stu_name||' 입니다.'  as "학과 성명" from STUDENT order by stu_name asc;

select stu_name,stu_dept,stu_grade,stu_class
from student
where stu_dept = '인공지능';

select*from student;
select*from subject;
select*from enrol;

--과제
--1번
DESCRIBE student;
desc student;
--2번
desc subject;
--3번
select * from student;
--4번
select * from enrol;
--5번
select stu_no,stu_name from student;
--6번
select sub_no,sub_name from subject;
--7번
select stu_no,stu_name,stu_gender from student;
--8번
select * from student;
--9번
select sub_no,sub_prof from subject;
--10번
select stu_no,stu_name,stu_grade,stu_class from student;
--11번
select sub_no,stu_no,enr_grade from enrol;
--12번
select stu_weight,stu_height,stu_no,stu_name from student;
--13번
select DISTINCT stu_dept from student;
--14번
select DISTINCT stu_gender from student;
--15번
select DISTINCT stu_grade from student;
--16번
select DISTINCT stu_dept,stu_grade from student;
--17번
select DISTINCT stu_dept,stu_class from student;
--18번
select stu_weight+5 from student;
--19번
select stu_weight-5 from student;
--20번
select stu_no as 학번,stu_name as 이름 from student;
--21번
select sub_no as 과목번호,stu_no as 학번,enr_grade as 점수 from enrol;
--22번
select sub_name || sub_prof as 과목명과교수명 from subject;
--23번
select stu_dept||stu_name from student;
--24번
select stu_dept||'과'||stu_name||'입니다.'from student;
--25번
select stu_name from student where stu_dept='컴퓨터정보';
--26번
select * from student where stu_height >=170;
--27번
select * from student where stu_weight >=65;
--28번
select stu_no,stu_name from student where stu_dept='전기전자';
--29번
select DISTINCT stu_name from student where stu_gender = 'F';
--30번
select * from student where stu_dept<>'전기전자';
--31번
select stu_no from enrol where enr_grade >=80;
--32번
select * from student where stu_name ='김인중';
--33번
select * from student where stu_dept='기계'and stu_grade=2 ;
--34번
select * from student where stu_gender = 'F' and stu_weight <=60;
--35번
select sub_dept  from subject where sub_dept<>'기계';
--36번
select stu_name from student where  stu_dept='컴퓨터정보'and stu_grade=2 and stu_class = 'A';
--37번
select * from student where stu_grade=1 or stu_grade=3 ;
--38번
select stu_no, stu_name from student where stu_name like '김%' ;
--39번
select stu_name from student where stu_name like '%옥%' ;
--40번
select * from student where stu_no like '2015%' ;
--41번
select stu_no, stu_name  from student where stu_height is null ;
--42번
select stu_no, stu_name  from student where stu_height is not null;
--43번
select  stu_no, stu_name   from student where stu_dept='컴퓨터정보' or stu_dept='기계';
--44번
select stu_no, stu_name,stu_dept  from student where stu_gender = 'M' and stu_grade =1;
--45번
select stu_no, stu_name from student order by stu_no;
--46번
select stu_no, stu_name,stu_dept  from student order by stu_dept;
--47번
select * from student order by stu_grade desc;
--48번
select * from student order by stu_dept ,stu_class ;
--49번
select stu_dept||'과'||stu_grade||'학년'|| stu_name||'입니다.' from student;

commit;