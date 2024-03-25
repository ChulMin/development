
select *
from student
where stu_no in
(select stu_no
from enrol
where sub_no = 101);

select *
from student a, enrol b
where a.stu_no = b.stu_no and b.sub_no = 101;

--101번 과목을 수강한 학생들의 학번, 이름, 점수를 검색
select a.stu_no, a.stu_name, b.enr_grade (equi join)
from student a, enrol b
where a.stu_no = b.stu_no and b.sub_no = 101;

create table test(empno, ename, sal, comm, deptno)
as
select empno, ename, sal, comm, deptno
from emp
where deptno = 1;
insert into test values(11, 'apple', 1000, null, 30);
insert into test values(12, 'banana', 2000, 100, 30);
insert into test values(13, 'cheese', 1000, 0, 10);
insert into test values(14, 'dog', 2000, null, 20);
insert into test values(15, 'egg', 1000, 100, 20);
select * from test;

select *
from test
where (sal, nvl(comm, -1)) =
(select sal, nvl(comm, -1)
from test
where empno = 11);

--학생들의 학과별 평균 신장보다 큰 신장의 학생들 정보 검색
select stu_dept, round(avg(stu_height),2) as avg_height
from student
group by stu_dept; //각 학과의 평균신장 출력

select stu_no, stu_name, a.stu_dept, stu_height, avg_height
from student a, (select stu_dept, round(avg(stu_height),2) as avg_height
from student
group by stu_dept) b
where a.stu_dept = b.stu_dept and stu_height > avg_height;

Create table jobs (
JOB_ID VARCHAR2(10 BYTE) primary key,
JOB_TITLE VARCHAR2(35 BYTE) not null,
MIN_SALARY NUMBER(6,0),
MAX_SALARY NUMBER(6,0)
);

insert into jobs values('AD_PRES', 'President', 20080, 40000);
insert into jobs values('AD_VP', 'Administration Vice President', 15000, 30000);
insert into jobs values('AD_ASST', 'Administration Assistant', 3000, 6000);
insert into jobs values('FI_MGR', 'Finance Manager', 8200, 16000);
insert into jobs values('FI_ACCOUNT', 'Accountant', 4200, 9000);
insert into jobs values('AC_MGR', 'Accounting Manager', 8200, 16000);
insert into jobs values('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
insert into jobs values('SA_MAN', 'Sales Manager', 10000, 20080);
insert into jobs values('SA_REP', 'Sales Representative', 6000, 12008);
insert into jobs values('PU_MAN', 'Purchasing Manager', 8000, 15000);
insert into jobs values('PU_CLERK', 'Purchasing Clerk', 2500, 5500);
insert into jobs values('ST_MAN', 'Stock Manager', 5500, 8500);
insert into jobs values('ST_CLERK', 'Stock Clerk', 2008, 5000);
insert into jobs values('SH_CLERK', 'Shipping Clerk', 2500, 5500);
insert into jobs values('IT_PROG', 'Programmer', 4000,10000);
insert into jobs values('MK_MAN', 'Marketing Manager', 9000, 15000);
insert into jobs values('MK_REP', 'Marketing Representative', 4000, 9000);
insert into jobs values('HR_REP', 'Human Resources Representative', 4000,9000);
insert into jobs values('PR_REP', 'Public Relations Representative', 4500, 10500);

--1. 직책(Job Title)이 Programmer인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 
-- 출력 시 년도를 기준으로 오름차순 정렬하시오. 
select to_char(hire_date, 'YYYY') 입사년도, avg(salary) 평균급여
from employees
where job_id = (select job_id
from jobs
where job_title = 'Programmer')
group by to_char(hire_date, 'YYYY')
order by 1;

--2. 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
-- 평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력 하시오. 
-- 단, 도시에 근무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.
create table locations(
LOCATION_ID NUMBER(4,0) primary key,
STREET_ADDRESS VARCHAR2(40),
POSTAL_CODE VARCHAR2(12),
CITY VARCHAR2(30) not null,
STATE_PROVINCE VARCHAR2(25) not null,
COUNTRY_ID CHAR(2)
);

insert into locations values(1000, '1297 Via Cola di Rie', '00989', 'Roma', null, 'IT');
insert into locations values(1100, '93091 Calle della Testa', '10934', 'Venice', null, 'IT');
insert into locations values(1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP');
insert into locations values(1300, '9450 Kamiya-cho', '6823', 'Hiroshima', 'null', 'JP');
insert into locations values(1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
insert into locations values(1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
insert into locations values(1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US');
insert into locations values(1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
insert into locations values(1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');
insert into locations values(1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA');
insert into locations values(2000, '40-5-12 Laogianggen', '190518', 'Beijing', 'null', 'CN');
insert into locations values(2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN');
insert into locations values(2200, '12-98 Victoria Street', '2901','Sydney', 'New South Wales', 'AU');
insert into locations values(2300, '198 Clementi North', '540198', 'Singapore', 'null', 'SG');
insert into locations values(2400, '8204 Arthur St', 'null', 'London', 'null', 'UK');
insert into locations values(2500, 'Magdalen Centre, The Oxford Science Park','OX9 9ZB', 'Oxford', 'Oxford', 'UK');
insert into locations values(2600, '9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK');
insert into locations values(2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');
insert into locations values(2800, 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR');
insert into locations values(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH');
insert into locations values(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH');
insert into locations values(3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL');
insert into locations values(3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX');
select * from locations order by LOCATION_ID;--21, null포함하면 23개.

create table DEPARTMENTS(
DEPARTMENT_ID NUMBER(4,0) primary key, -- unique + not null
DEPARTMENT_NAME VARCHAR2(30 BYTE) not null,
MANAGER_ID NUMBER(6,0),
LOCATION_ID NUMBER(4,0) 
);
select * from departments;

insert into departments values(10, 'Administration', 200, 1700);
insert into departments values(20, 'Marketing', 201, 1800);
insert into departments values(30, 'Purchasing', 114, 1700);
insert into departments values(40, 'Human Resources', 203, 2400);
insert into departments values(50, 'Shipping', 121, 1500);
insert into departments values(60, 'IT', 103, 1400);
insert into departments values(70, 'Public Relations',204, 2700);
insert into departments values(80, 'Sales', 145, 2500);
insert into departments values(90, 'Executive', 100, 1700);
insert into departments values(100, 'Finance', 108, 1700);
insert into departments values(110, 'Accounting', 205,1700);
insert into departments values(120, 'Treasury', null, 1700);
insert into departments values(130, 'Corporate Tax', null, 1700);
insert into departments values(140, 'Control And Credit', null, 1700);
insert into departments values(150, 'Shareholder Services', null, 1700);
insert into departments values(160, 'Benefits', null, 1700);
insert into departments values(170, 'Manufacturing', null, 1700);
insert into departments values(180, 'Construction', null, 1700);
insert into departments values(190, 'Contracting', null, 1700);
insert into departments values(200, 'Operations', null, 1700);
insert into departments values(210, 'IT Support', null, 1700);
insert into departments values(220, 'NOC', null, 1700);
insert into departments values(230, 'IT Helpdesk', null, 1700);
insert into departments values(240, 'Government Sales', null, 1700);
insert into departments values(250, 'Retail Sales', null, 1700);
insert into departments values(260, 'Recruiting', null, 1700);
insert into departments values(270, 'Payroll', null, 1700);
commit;

select l.city, avg(salary), count(*)
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
group by l.city
having count(*) < 10
order by avg(salary);

--3. ‘Programmer’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사
원의 사번과 이름을 출력하시오. 
-- (현재 ‘Programmer’의 직책(job_title)으로 근무하는 사원은 고려 하지
않는다.) 
create table JOB_HISTORY (
EMPLOYEE_ID NUMBER(6,0),
START_DATE DATE not null,
END_DATE DATE not null,
JOB_ID VARCHAR2(10) not null,
DEPARTMENT_ID NUMBER(4,0)
);

insert into JOB_HISTORY values(102, '01/01/13', '06/07/24', 'IT_PROG', 60);
insert into JOB_HISTORY values(101, '97/09/21', '01/10/27', 'AC_ACCOUNT', 110);
insert into JOB_HISTORY values(101, '01/10/28', '05/03/15', 'AC_MGR', 110);
insert into JOB_HISTORY values(201, '04/02/17', '07/12/19', 'MK_REP', 20);
insert into JOB_HISTORY values(114, '06/03/24', '07/12/31', 'ST_CLERK', 50);
insert into JOB_HISTORY values(122, '07/01/01', '07/12/31', 'ST_CLERK', 50);
insert into JOB_HISTORY values(200, '95/09/17', '01/06/17', 'AD_ASST', 90);
insert into JOB_HISTORY values(176, '06/03/24', '06/12/31', 'SA_REP',80);
insert into JOB_HISTORY values(176, '07/01/01', '07/12/31', 'SA_MAN', 80);
insert into JOB_HISTORY values(200, '02/07/01', '06/12/31', 'AC_ACCOUNT', 90);
select e.EMPLOYEE_ID || ' ' || e.EMPLOYEE_NAME as 사번이름
from employees e, job_history h
where e.employee_id = h.employee_id
and h.job_id = (select job_id
from jobs
where job_title = 'Programmer');-- 102 Lex

--4. 자신의 매니저보다 연봉(salary)를 많이 받는 직원들의 성(last_name)과연봉(salary)를 출력하시오. 
select a.EMPLOYEE_NAME "직원 이름", a.salary "직원 연봉", b.salary "매니저 연봉"
from employees a, employees b
where a.manager_id = b.employee_id
and a.salary > b.salary;

--5. 2007년에 입사(hire_date)한 직원들의 사번(employee_id), 이름(EMPLOYEE_NAME), 부서명(department_name)을 조회합니다. 
-- 이때, 부서에 배치되지 않은 직원의 경우, ‘<Not Assigned>’로 출력하시
오. 
select e.employee_id, EMPLOYEE_NAME, nvl(d.department_name, 'Not Assigned')
from employees e, departments d
where e.department_id = d.department_id
and to_char(e.hire_date, 'yyyy') = '2007';

--6. 업무명(job_title)이 ‘Programmer’인 직원 중에서 연봉(salary)이 6,000이상, 12,000 이하인 직원들의 이름(EMPLOYEE_NAME)과 연봉(salary)를 출력하시오.
select EMPLOYEE_NAME, e.salary
from employees e, jobs j
where e.job_id = j.job_id
and j.job_title = 'Programmer'
and salary between 6000 and 12000;

--7. 부서별로 가장 적은 급여를 받고 있는 직원의 이름, 부서이름, 급여를 출력하시오. 
select e.employee_name, d.department_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
and e.salary in (select min(salary)
from employees e, departments d
where e.department_id = d.department_id
group by d.department_id);

--8. EMPLOYEES 테이블에서 급여를 많이 받는 순서대로 조회했을 때 결과처럼 6번째부터 10 번째까지 5명의 이름과 salary를 조회 하시오.
select EMPLOYEE_NAME, salary
from (select rownum no, EMPLOYEE_NAME, salary
from employees
order by salary desc)
where no between 6 and 10;

--9. 각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다. 연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회 하시오. 
--단, 연봉 총합이 10,000보 다 큰 업무만 출력 하시오.
select job_title, sum(e.salary)
from jobs j, employees e
where e.job_id = j.job_id
group by j.job_title
having sum(e.salary) >= 10000
order by sum(e.salary) desc;

--실습을 위해 a_student, b_student 테이블 생성
create table a_student
as select *
from student
where stu_dept in ('기계', '전기전자');
desc a_student;
create table b_student
as select *
from student
where stu_dept in ('전기전자', '컴퓨터정보');
desc b_student;

select * from a_student;
select * from b_student;

--UNION
 select * from a_student
union --(중복데이터 제거 출력)
select * from b_student;

select * from a_student
union all --(중복데이터 허용 출력)
select * from b_student;

--intersect 두 테이블의 중복값(합집합)
select * from a_student
intersect --(중복데이터만 출력)
select * from b_student;

--minus(뒤에 테이블)를 제외한 차집합
select * from a_student
minus -- b(뒤에 테이블)를 제외한 차집합
select * from b_student;

select * from b_student
minus -- a를 제외한 차집합
select * from a_student;

create table a_enrol
as select *
from enrol where stu_no <20150000;

select *
from a_enrol;

insert into a_enrol(sub_no,stu_no) values(110,20152088);

insert into a_enrol values(110,20153075,null);

--복수 행 삽입
--부질의의 결과를 테이블에 입력
--부질의 결과의 열의 위치 및 수가 테이블과 테이블과 일치하여야 함

update a_enrol set enr_grade = enr_grade + 10
where sub_no = 104;

update a_enrol set enr_grade = enr_grade + 10
where sub_no = 
(select sub_no 
from subject 
where sub_name = '시스템분석설계');--104

select * from  a_enrol;

delete from a_enrol
where stu_no = 20131001;

delete from a_enrol;

drop table a_enrol;

rollback;

--학생(student) 테이블의 내용을 a_student로 수정 또는 삽입하는 MERGE 연산
merge into a_student a
using student s
on (s.stu_no = a.stu_no)
when matched then
update set a.stu_weight = s.stu_weight
when not matched then
insert values(s.stu_no, s.stu_name, s.stu_dept, null, 
null, null, null, s.stu_weight);


--트랜잭션 
--트랜잭션이란 사용자에 의해 실행 된 SQL문의 집합
--변경된 데이터는 TCL에 의해 데이터베이스에 반영됨
--트랜잭션 처리는 데이터 무결성(Integrity) 유지
--DML문의 한 번 이상 실행이 하나의 트랜잭션이 되며,
--DDL문은 하나의 명령이 하나의 트랜잭션이 된다.
delete from a_student;
rollback;
drop table a_student;
create table a_student
as
select * from student
where stu_dept in ('기계', '전기전자') ;
select * from a_student;

commit;

create table c_student
as 
select * from student
where stu_dept in ('전기전자', '컴퓨터정보');

select * from c_student;
delete from c_student;
rollback;
commit;
--데이터를 삭제후에 commit;을 실행하면 rollback을 실행하여도
--데이터는 존재하지 않습니다. 그러나, commit을 하지 않고 rollback을 하면
--데이터를 살릴 수 있습니다.(15분 이내에)
insert into a_student values(20240325,'홍길동','인공지능',3,'B','M',195.23,98.12);

--데이터 로킹(Lock)
--병행처리의 문제점을 해결하기 위한 방법
--a_student 테이블에 기본키 설정
alter table a_student
add constraints pk_a_student primary key(stu_no);
delete from a_student
where stu_name='홍길동';
 
 update a_student set stu_name = '홍길동B',stu_grade = 4 where stu_height = 180.99; -- 다중 컬럼 동시 업데이트
 
 --DDL
 create table test1(
 u_id varchar2(10),
 u_date date
 );
 
 CREATE TABLE table?name 
( column?name1 data?type default?value,
column?name2 data?type default?value, 
column?name data?type default?value );

--CREATE TABLE table?name 
--AS sub?query; (복사) = 새로운 테이블


--STUDENT 테이블 생성
create table student2(
stu_no char(9), -- 해당년도(4) + 학과코드(3) + 시리얼번호(2)
stu_name varchar2(12),
stu_dept varchar2(20),
stu_grade number(1),
stu_class char(1),
stu_gender char(1),
stu_height number(5, 2), -- 174.45, 174
stu_weight number(5, 2));

create table t_student
as select * 
from student 
where stu_dept = '기계';

 desc t_student;
 
 --add 테이블의 필드(열)를 추가한다.
 select * from t_student;
alter table t_student
add ( army char(1));

--modify 테이블의 필드(열)의 구조를 변경한다.
alter table t_student
modify( army number); 

--drop 테이블의 필드(열)를 삭제한다.
alter table t_student drop(army);

-- rename 테이블의 이름을 변경한다.
 rename t_student to test_student;
 rename test_student to t_student;

--DROP, TRUNCATE, DELETE는 모두 삭제하는 명령어이지만 차이가 있습니다.한눈에 알아보기 쉽게 표로 정리해 보았습니다. ?

--              DROP                   TRUNCATE                    DELETE
--종류           DDL                    DDL (일부 DML 성격)           DML
--COMMIT        AUTO COMMIT            AUTO COMMIT                 사용자 COMMIT
--ROLLBACK      불가능                  불가능                       COMMIT 이전에 가능
--Storage         Storage 삭제          최초 테이블 생성 시 할당된     데이터 모두 DELETE 해도
--                (테이블 스키마 삭제)    Storage만 남기고 삭제         Storage 삭제X
--                                     (테이블 스키마 유지)
--수행 시          테이블 정의 자체 삭제   테이블을 최소 생성된            데이터만 삭제
--                                      초기 상태로 만듬
--사용 예제      DROP TABLE STUDENT;     TRUNCATE TABLE STUDENT;     DELETE FROM STUDENT;
--로그           안남김                   안남김                      남김
--속도           빠름                    빠름                        느림

truncate table test_student;
select * from test_student;

--NOT NULL 열에 NULL값을 허용하지 않음
--UNIQUE KEY 열 또는 열의 조합이 유일성(유일한 값)을 가져야 함
--PRIMARY KEY 열 또는 열의 조합이 NULL값이 아니며, 유일성을 가져야 함
--FOREIGN KEY 다른 테이블의 열을 참조되는 테이블에 값이 존재하여야 함
--CHECK 열에 들어갈 값에 대한 조건을 명시함


create table t1_student(
 stu_no varchar2(8),
 stu_name varchar2(12),
stu_dept varchar2(20)
constraint n_stu_dept not null,
 stu_grade number(1),
 stu_class varchar2(1),
 stu_gender varchar2(1),
 stu_height number(5,2),
 stu_weight number(5,2) 
);

--UNIQUE KEY
--기본 키가 아닌 열의 값이 유일한 값을 유지하여야 할 때 사용
--자동으로 INDEX가 만들어진다.
create table t2_student(
stu_no varchar2(8),
stu_name varchar2(12)
constraint u_stu_name2 unique,
stu_dept varchar2(20)
constraint n_stu_dept2 not null,
stu_grade number(1),
stu_class varchar2(1),
stu_gender varchar2(1),
stu_height number(5,2),
stu_weight number(5,2) 
);
select * from t2_student;

create table t5_student(
sub_no varchar2(3),
stu_no varchar2(8),
enr_grade number(3),
constraint enrol_pk primary key (stu_no, sub_no));

create table t6_student(
sub_no char(3),
stu_no number(8),
sub_grade number(1),
constraint enr_sub_no_fk1 foreign key(sub_no) references 
subject(sub_no),
constraint enr_stu_no_fk2 foreign key(stu_no) 
references student(stu_no),
constraint enrol_pk2 primary key (sub_no, stu_no)
);

create table t1_student7(
 stu_no varchar2(9),
constraint pk_stu_no7 primary key(stu_no),
 stu_name varchar2(12)
 constraint u_stu_name7 unique,
 stu_dept varchar2(20)
 constraint n_stu_dept7 not null,
stu_grade number(1),
constraint c_stu_gender7 check (stu_gender in('M','F')),
 stu_class varchar2(1),
 stu_gender varchar2(1),
 stu_height number(5,2),
 stu_weight number(5,2) 
);

select * from user_constraints
 where table_name = 'STUDENT';

alter table t_student
enable constraint n_stu_dept;

alter table t_student
disable constraint n_stu_dept;
