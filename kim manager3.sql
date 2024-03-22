select * from emp;
select * from dept;
select * from enrol;
--1. 10번 부서 월급의 평균, 최고, 최저, 인원수를 구하여 출력하라.
select avg(sal),max(sal),min(sal),count(sal) 
from emp
where deptno =10;
--2. 각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
select avg(sal),max(sal),min(sal),count(sal) 
from emp
group by deptno ;
--3. 입사일을 “2022년 5월 14일" 의 형식으로 이름, 입사일을 출력하라.
select ename,to_char(hiredate,'yyyy"년" mm"월" dd"일"')
from emp;
--4. 입사일 부터 지금까지의 날짜수를 출력하라. --출력양식은 부서번호, 이름, 입사일, 현재일, 근무일수(소수점 이하 절삭), 근무 년수, 근무 월수, 근무 주수를 출력하라.
select deptno,ename,sysdate, FLOOR((sysdate-hiredate)+1),FLOOR(((sysdate-hiredate)+1)/365),floor(months_between(sysdate,hiredate)),FLOOR(((sysdate-hiredate)+1)/7)
from emp;
--5. 커미션이 NULL이 아닌 사원의 정보를 출력하라.
select ename
from emp
where comm is not null;
--6. 모든 사원의 실수령액을 계산하여 출력하라.  -- 단 급여가 많은 순으로 이름, 급여, 실수령액을 출력하라. -- (실수령액은 급여에 대해 10%의 세금을 뺀 금액)
select sal-(sal*0.1)
from emp
order by sal desc;
--7. 입사일로 부터 6개월이 지난 후의 입사일, 6개월 후의 날짜, 급여를 출력하라.
select ADD_MONTHS(hiredate, 6),ADD_MONTHS(sysdate, 6),sal
from  emp;
--8. 이름의 글자수가 6자 이상인 사원의 이름을 앞에서 3자리만 구하여 소문자로 이름만을 출력하라.
select LOWER(LPAD(ename,3))||ename
from emp
where LENGTH(ename)>=6;
--9. 같은 업무를 하는 사원의 수가 4명 이상인 업무와 인원수를 출력하라.
select distinct job,count(job)
from emp
group by job
having  count(job)>=4;
--10. 각 부서별 평균 월급, 전체 월급, 최고 월급, 최저 월급 을 구하여 평균 월급이 많은 순으로 출력하
select avg(sal),sum(sal),max(sal),min(sal)
from emp
group by deptno
order by avg(sal) desc;
--11. 이름이 ALLEN인 사원의 부서명과 부서위치를 출력하라. --natural join
select dname,loc
from dept natural join emp
where ename='ALLEN';
--12. 회사내의 최소급여와 최대급여의 차이를 구하라
select max(sal)-min(sal)
from emp;
--13. JOB과 그 JOB에 속한 사원수를 출력하라.
select job,count(job)
from emp
group by job;
--14. 이름에 "M"자가 들어간 사원들의 이름,부서명,급여를 구하라
select ename,dname,sal
from emp natural join dept
where ename like '%M%';
--15. SCOTT의 급여에서 1000 을 뺀 급여보다 적게 받는 사원의 이름, 급여를 출력하라.
select ename,sal
from emp
where sal < (select sal-1000 from emp where ename='SCOTT');
--16. JOB이 MANAGER인 사원들 중 최소급여를 받는 사원보다 급여가 적은 사원의 이름, 급여를 출력하라.
select ename,sal
from emp
where sal<(select min(sal) from emp where job ='MANAGER');
--17. WARD가 소속된 부서 사원들의 평균 급여보다 급여가 높은 사원의 이름 ,급여를 출력하라.
select ename,sal
from emp
where sal > (select avg(sal) from emp where DEPTNO =(SELECT DEPTNO
FROM  EMP
WHERE ENAME = 'WARD'));
--50. 학생들의 성별을 소문자로 검색하라.
select lower(stu_gender) from student;
--51. 학생들의 이름과 이름의 첫 2글자를 검색하라.
select stu_name,lpad(stu_name,2)
from student;
--52. 학생들의 이름과 이름의 길이를 검색하라.
select stu_name,length(stu_name)
from student;
--53. 학생들의 이름에 ‘김’이 몇 번째 있는지 검색하라.
select instr(stu_name,'김')
from student;
--54. 학생들의 학과에 ‘기’가 몇 번째 있는지 검색하라.
select instr(stu_dept,'기')
from student;
--55. 학생의 학과를 20자리로 하고, 앞에 ‘%’를 채워서 검색하라.
select LPAD(stu_dept,20,'%')
from student;
--56. 신장열의 값이 NULL인 학생의 경우 ‘미기록’으로 검색하라.
select nvl(to_char(stu_height),'미기록')
from student;
--57. 학생 중에서 가장 키가 큰 학생의 신장을 학번, 이름과 함께 검색하라.
select stu_no,stu_name
from student
where stu_height = (select max(stu_height)from student);
--58. 학생 중에서 가장 적은 체중이 나가는 학생이름과 체중을 검색하라.
select stu_name,stu_weight
from student
where stu_weight = (select min(stu_weight)from student);
--59.학과의 수를 검색하라.
select count(distinct sub_dept)
from subject;
--60.학생들의 성씨의 수를 검색하라.
select count(distinct lpad(stu_name,2))
from student;
--61.학년별 학생수를 검색하라.
select COUNT(distinct stu_grade)
from student;
--62.학년별 학생들의 인원수가 많은 순으로 검색하라.
select stu_grade,COUNT(stu_name)
from student
group by stu_grade;
--63.학과별 학생들의 평균 신장을 검색하라.
select stu_dept,avg(stu_height)
from student
group by stu_dept;
--64.학과별 학생들의 체중의 표준편차를 검색하라.
select stu_dept,STDDEV(stu_weight)
from student
group by stu_dept;
--65.학과별 학년별 학생들의 평균 체중을 검색하라.
select stu_dept,avg(stu_weight)
from student
group by stu_dept;
--66.학과별 학생들의 인원수가 많은 순으로 검색하라.
select stu_dept,count(*)
from student
group by stu_dept
order by count(*) desc;
--67.학과별 학년별 학생들의 평균 체중이 많은 순으로 검색하라.
select stu_dept,avg(stu_weight)
from student
group by stu_dept
order by avg(stu_weight) desc;
--68.학과별 학생들의 평균 신장이 높은 순으로 검색하라.
select stu_dept,avg(stu_height)
from student
group by stu_dept
order by avg(stu_height) desc;

--47.사원들의 사원이름을 소문자로 검색하라.
select lower(ename)
from emp;
--48.사원들의 사원이름, 사원직무를 소문자로 검색하라.
select lower(ename),lower(job)
from emp;
--49.사원들의 사원이름을 대문자로 검색하라.
select upper(ename)
from emp;
--50.사원들의 사원이름, 사원직무를 대문자로 검색하라.
select upper(ename),upper(job)
from emp;
--51.사원들의 사원이름을 첫 자만 대문자로 검색하라.
select INITCAP(ename)
from emp;
--52.사원들의 사원이름과 사원직무를 첫 자만 대문자로 검색하라.
select INITCAP(ename),INITCAP(job)
from emp;
--53.사원들의 사원이름과 사원직무를 연결하여 검색하라.
select CONCAT(ename,job)
from emp;
--54.사원들의 사원이름과 사원이름의 첫 두 글자만 검색하라.
select ename,lpad(ename,2)
from emp;
--55.사원번호들의 사원이름, 사원직무 그리고 사원직무의 두 번째부터 세 글자를 검색하라.
select ename,job,SUBSTR(job,2,3)
from emp;
--56.사원들의 사원이름과 사원이름의 길이를 검색하라.
select ename,length(ename)
from emp;
--57.사원들의 사원이름과 사원직무의 자리수를 검색하라.
select ename,length(job)
from emp;
--58.사원들의 사원이름에 ‘A’가 몇 번 째 위치에 들어 있는지 검색하라.
select INSTR(ename,'A')
from emp;
--59.사원직무에 ‘A’가 몇 번 째 위치에 들어 있는지 검색하라.
select INSTR(job,'A')
from emp;
--60.사원이름을 15자리로 하고, 뒤에 ‘&’를 채워서 검색하라.
select rpad(ename,15,'&')
from emp;
--61.사원직무를 20자리로 하고, 앞에 ‘%’를 채워서 검색하라.
select lpad(job,20,'%')
from emp;
--62.사원의 사원번호, 사원이름과 급여를 검색하라. (급여는 두 번째 자리에서 반올림함)
select empno,ename,round(sal,-2)
from emp;
--63.사원의 사원번호, 사원이름, 급여를 검색하라. (급여는 두 번째 자리까지 절삭함)
select empno,ename,trunc(sal,-2)
from emp;
--64.사원번호와 급여를 100으로 나눈 나머지를 검색하라.
select empno,MOD(sal,100)
from emp;
--65.사원번호, 사원이름, 입사일, 입사 후 100일의 날짜를 검색하라.
select empno,ename,hiredate,hiredate+100
from emp;
--66.사원번호, 사원이름, 입사일, 근무 일자를 계산하여 검색하라.
select empno,ename,hiredate,sysdate-hiredate
from emp;
--67.사원들의 입사일에서 3달째 되는 날짜를 검색하라.
select ADD_MONTHS(hiredate,3)
from emp;
--68.사원들의 입사일 다음 토요일의 날짜를 검색하라.
select next_day(hiredate,6)
from emp;
--69.사원들의 입사 월의 마지막 날짜를 검색하라.
select last_day(hiredate)
from emp;
--70.사원들의 입사일을 년을 기준으로 반올림하여 검색하라.
select round(hiredate,'year')
from emp;
--71.사원들의 입사일을 년을 기준으로 절삭하여 검색하라.
select trunc(hiredate,'year')
from emp;
--72.상급자사원번호가 없는 경우 ‘상급자 없음’을 나타내도록 질의문을 작성하라. 
select nvl(to_char(mgr),'상급자 없음')
from emp;
--73.상여금을 포함한 급여를 사원번호, 사원이름과 함께 검색하라. 
select sal+nvl(comm,0)empno,ename
from emp;
--74.상여금을 포함한 연봉을 사원번호, 사원이름과 함께 검색하라. 
select (sal*12)+nvl(comm,0)empno,ename
from emp;
--75.상급자사원번호가 NULL인 경우 ‘CEO’로 변경하여 사원번호, 사원이름, 상급자사원번호를 검색하라.
select empno,ename,nvl(to_char(mgr),'CEO')
from emp;
--76.전체 사원들 중 최고 상여금을 받는 사원의 사원번호, 사원이름, 상여금을 검색하라.(subquery)
select empno,ename,comm
from emp
where comm = (select max(comm)from emp);
--77.전체 사원들 중 최저 상여금을 받는 사원의 사원번호, 사원이름, 상여금을 검색하라.(subquery)
select empno,ename,comm
from emp
where comm = (select min(comm)from emp);
--78.전체 사원의 사원이름 중 MAX와 MIN값을 검색하라.
select max(ename),min(ename)
from emp;
--79.전체 사원의 입사일 중 MAX와 MIN값을 검색하라.
select max(hiredate),min(hiredate)
from emp;
--80.전체 사원의 사원번호 중 MAX와 MIN값을 검색하라.
select max(empno),min(empno)
from emp;
--81.상급자사원번호 열의 개수를 검색하라.
select length(mgr)
from emp;
--82.사원이름의 개수를 검색하라. 
select length(ename)
from emp;
--83.사원 테이블의 튜플 수를 검색하라. 
select count(*)
from emp;
--84.부서 테이블의 튜플 수를 검색하라. 
select count(*)
from dept;
--85.상여금의 개수를 검색하라.
select count(comm)
from emp;
--86.부서별 사원들의 인원수를 검색하라.
select deptno,count(distinct ename)
from emp
group by deptno;
--87.상급자 사원 번호별 사원들의 인원수를 검색하라.
select mgr,count(distinct ename)
from emp
group by mgr;
--88.부서별 사원들의 평균 급여를 검색하라.
select deptno,avg(sal)
from emp
group by deptno;
--89. 부서별 사원들의 급여의 표준편차를 검색하라.
select deptno,STDDEV(sal)
from emp
group by deptno;
--90.부서별 사원 직무별 사원의 급여 합을 검색하라.
select deptno,job,sum(sal)
from emp
group by deptno,job;
--91.부서별 사원 직무별 사원들의 평균 급여를 검색하라.
select deptno,job,avg(sal)
from emp
group by deptno,job;
--92. 부서별 사원 직무별 사원들의 입사일의 MAX와 MIN 값을 검색하라. 
select deptno,job,max(hiredate),min(hiredate)
from emp
group by deptno,job;
--93. 부서별 사원들의 인원수를 인원수가 많은 순으로 검색하라. 
select deptno,count(*)
from emp
group by deptno;
--94.부서별 사원들의 평균 급여를 평균 급여 순으로 검색하라. 
select deptno,avg(sal)
from emp
group by deptno
order by avg(sal);

--95.부서별, 사원 직무별 사원의 급여 합을 많은 순으로 검색하라.
select deptno,job,sum(sal)
from emp

group by deptno,job
order by sum(sal) desc;
--96. 부서별, 사원 직무별 사원들의 평균 급여가 많은 순으로 검색하라.
select deptno,job,avg(sal)
from emp
group by deptno,job
order by avg(sal) desc;
--97.모든 사원들에게 급여의 20%를 보너스로 지불하기로 하였다. 이름, 급여, 보너스 금액을 출력하라.
select ename,sal,sal*0.2
from emp;
--98.급여가 2,000 이상인 모든 사원은 급여의 15%를 경조비로 내기로 하였다. 이름, 급여, 경조비 를 출력하라.
select ename,sal,sal*0.15
from emp
where sal >=2000;
--99. 부서번호가 20인 부서의 시간당 임금을 계산하여 출력하라.
select deptno,(sal/4)/7
from emp
where deptno =20;
--100. 입사일이 81/04/02보다 늦고 82/12/09보다 빠른 모든 정보를 출력하라.
select *
from emp
where hiredate >='81/04/02' and hiredate <='82/12/09';
--101.급여가 1,600보다 크고 3,000보다 작은 사원의 이름, 직업(업무), 급여를 출력하라.
select ename,job,sal
from emp
where sal > 1600 and sal < 3000 ;
--102. 직업이 MANAGER와 SALESMAN인 사원의 모든 정보를 출력하라. --단, 부서번호로 ASCENDING SORT 한 후 급여가 많은 사원 순으로 출력하라.
select *
from emp
where job = 'MANAGER' or job = 'SALESMAN' 
ORDER BY deptno desc;
--103.부서번호가 20, 30번을 제외한 모든 사원의 모든 정보를 출력하라.
select *
from emp
where deptno <>20 and deptno <>30;
--104. 입사일이 81년도인 사원의 모든 정보를 출력하라.
select *
from emp
where hiredate like '81%';
--105. 커미션의 합이 2000 이상인 부서의 총급여와 총 커미션을 구하라.
select sum(sal),sum(comm)
from emp
group by deptno 
having sum(comm)>=2000;
--106. 입사일별 평균 급여를 구하라.
select avg(sal)
from emp
group by hiredate;
--107. 직급이 ANALYST인 사원의 이름, 부서명을 구하라.
select ename,deptno
from emp
where job ='ANALYST';
--108. 이름에 "M"자가 들어간 사원들의 이름,부서명,급여를 구하라.
select ename,deptno,sal
from emp
where ename like '%M%';
--109. DALLAS에 위치한 부서에 속한 사원의 총사원수, 평균급여, 전체급여, 최고급여, 최저급여를 구하라 .
select count(*),avg(sal),sum(sal),max(sal),min(sal)
FROM EMP NATURAL JOIN deptf
where loc ='DALLAS';
--110. MANAGER인 사원들의 월급의 평균보다 월급이 적은 사람들의 이름과 월급을 출력하라.(subquery)
select ename,sal
from emp
where sal < (select avg(sal) from emp where job = 'MANAGER');
--111. SCOTT의 급여에서 1000 을 뺀 급여보다 적게 받는 사원의 이름,급여를 출력하라.(subquery)
select ename,sal
from emp
where sal < (select sal-1000 from emp where ename = 'SCOTT');
--112. EMP 테이블에서 이름이 5글자인 사원중 급여가 가장 높은 사원의 이름,급여,부서명을 출력하라.
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
INSERT INTO tCity VALUES ('서울',605,974,'y','경기');
INSERT INTO tCity VALUES ('부산',765,342,'y','경상');
INSERT INTO tCity VALUES ('오산',42,21,'n','경기');
INSERT INTO tCity VALUES ('청주',940,83,'n','충청');
INSERT INTO tCity VALUES ('전주',205,65,'n','전라');
INSERT INTO tCity VALUES ('순천',910,27,'n','전라');
INSERT INTO tCity VALUES ('춘천',1116,27,'n','강원');
INSERT INTO tCity VALUES ('홍천',1819,7,'n','강원');

commit;

 select student.*, enrol.*
 from student cross join enrol;
 
select student.stu_no, stu_name, stu_dept, enr_grade
from student, enrol
where student.stu_no = enrol.stu_no;

--? NATURAL JOIN
select stu_no, stu_name, stu_dept, enr_grade
from student natural join enrol;
--?두 테이블에 같은 열의 이름이 존재하면 사용.
--?해결방법1] JOIN ~ USING
select stu_no, stu_name, stu_dept, enr_grade
from student join enrol using(stu_no) ;
--?해결방법2] JOIN ~ ON
select student.stu_no, stu_name, stu_dept, enr_grade
from student join enrol on student.stu_no = enrol.stu_no ;

create table CCC (
stu_no number(9),
stu_name varchar2(12),
stu_gender char(1),
stu_hakjum char(1),
stu_kg number(3)); 
drop table CCC;
insert into CCC values(20153075, '옥한빛', 'M','A',78);
insert into CCC values(20153088, '이태연', 'F','B',68);
insert into CCC values(20143054, '유가인', 'F','C',58);
insert into CCC values(20152088, '조민우', 'M','A',88);
insert into CCC values(20142021, '심수정', 'F','B',68);
insert into CCC values(20132003, '박희철', 'M','B',68);
insert into CCC values(20151062, '김인중', 'M','C',58);
insert into CCC values(20141007, '진현무', 'M','A',88);
insert into CCC values(20131001, '김종헌', 'M','B',68);
insert into CCC values(20131025, '옥성우', 'F','B',68);
insert into CCC values(20131026, '옥성우2', 'F','A',64);

commit;

select stu_no, stu_name, stu_gender, stu_dept, stu_kg
from student natural join CCC; 
select stu_no, student.stu_name, student.stu_gender, stu_dept, stu_kg
from student join CCC using(stu_no);
select stu_no, stu_name, stu_gender, stu_dept, stu_kg
from student join CCC using(stu_no, stu_name, stu_gender);
select student.stu_no, student.stu_name, student.stu_gender, stu_dept, CCC.stu_kg
from student join CCC on student.stu_no = CCC.stu_no;--결과 출력됨

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

select a.empno as 사원번호, a.ename as 사원이름, 
b.empno as 상급자사원번호, b.ename as 상급자이름
from emp a, emp b
where a.mgr = b.empno;

select a.empno as 사원번호, a.ename as 사원이름, 
b.empno as 상급자사원번호, b.ename as 상급자이름
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

--right outer join조인
select a.*, sub_name
from enrol a right outer join subject b
on a.sub_no = b.sub_no
order by 1;

--left outer join조인
select a.empno as 사원번호, a.ename as 사원이름, 
b.empno as 상급자사원번호, b.ename as 상급자이름
 from emp a left outer join emp b on a.mgr = b.empno;

--full outer join조인
 select a.empno as 사원번호, a.ename as 사원이름, 
b.empno as 상급자사원번호, b.ename as 상급자이름
 from emp a full outer join emp b on a.mgr = b.empno;
