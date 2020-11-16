show user;

select * from tab;

DESC emp;
DESC dept;

SELECT * FROM emp;
SELECT DISTINCT count(job) FROM emp;
SELECT DISTINCT deptno FROM emp; -- 중복이 제거되고 출력

SELECT * FROM emp;
SELECT * FROM emp WHERE deptno <> 30;
SELECT * FROM emp WHERE deptno != 30;
SELECT * FROM emp  WHERE deptno ^= 30;
SELECT * FROM emp  WHERE NOT deptno = 30;

SELECT * FROM emp WHERE job = 'SALESMAN' AND comm >= 300;

SELECT * FROM dept;

SELECT -10 , ABS(10) FROM dual;

SELECT 3.141592, round(3.541592) FROM dual;

SELECT length(ename) FROM emp;


SELECT TO_CHAR(SYSDATE+1, 'yyyy/mm/dd hh24:mi:ss') FROM dual;

--  MONTHS_BETWEEN
SELECT months_between(A,B) FROM dual;
SELECT months_between(SYSDATE,SYSDATE +1) FROM dual;

--ADD_MONTHS  (기준일, 더할 월 수)
SELECT ADD_MONTHS(SYSDATE, '2') FROM dual;  


SELECT DECODE(100, 100, 'EQUAL', 'UNEQUAL') FROM dual;  --같은게 참이면 첫 번째 문자열 실행 
SELECT DECODE(100, 150, 'EQUAL', 'UNEQUAL') FROM dual;  --같은게 거짓이면 두 번째 문자열 실행

--DECODE   조인 사용하는게 더 깔끔하게[ 나온다
SELECT empno, ename, deptno, DECODE(deptno, 10, '회계팀', 20, '개발팀', 30, '영업팀', 40, '운영팀') deptname
FROM emp;

-- join
SELECT empno, ename, deptno, d.dname
 FROM emp e JOIN dept d ON e.deptno;
 
 
 --CASE 문
 SELECT
    ename,
    CASE
        WHEN deptno = 10 THEN '회계팀'
        WHEN deptno = 20 THEN '개발팀'
        WHEN deptno = 30 THEN '영업팀'
        WHEN deptno = 40 THEN '운영팀'
        ELSE '팀없음'
    END
FROM emp;

```sql
CASE
    WHEN 조건 THEN 출력할값
    WHEN 조건 THEN 출력할값
    ...
    WHEN 조건 THEN 출력할값
    ELSE 기본으로출력할값
END
```
-- 그룹 함수(count)
SELECT count(*), count(comm), count(empno) FROM emp;
SELECT * FROM emp WHERE NOT comm IS NULL;

--sum 
SELECT sum(sal) FROM emp;

--avg  
select avg(sal) from emp;

--avg() 사용 안하고 sum값으로 평균 구하기
select sum(sal)/count(*) from emp;

--round 를 사용해서 소수점 둘 째 자리만 사용하기
select round(avg(sal),2) from emp;

--order by 로 내림 오름차순 하기
select * from emp order by sal DESC;

select job, round(avg(sal),2) AS avgsal 
from emp 
GROUP BY job ORDER BY avgsal DESC;

-- 그룹 ㅂㅇ
SELECT job, count(job) AS 인원
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY job
ORDER BY 인원 DESC;

-- 지역별로 몇명이 근무하는지
-- 1. 출력할 테이블   2. 그룹기준 3. 출력할 열  4. 정렬  

SELECT e.deptno, dname, COUNT(e.empno)
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.loc;

SELECT e.deptno, dname, COUNT(e.empno)   --부서번호, 부서이름
FROM emp e, dept d  -- e와 d로 변수 설정
WHERE e.deptno = d.deptno  -- 
GROUP BY e.deptno, dname
HAVING COUNT(e.empno) > 5;

-- DML
CREATE TABLE emp_research
AS (SELECT * FROM emp WHERE 1=0);


```sql
CREATE TABLE 테이블이름 AS 쿼리;
```
INSERT INTO 테이블이름(쿼리);
CREATE TABLE emp_hire AS SELECT empno, ename, hiredate FROM emp WHERE 1=0;
CREATE TABLE emp_sal AS SELECT empno, ename, sal FROM emp WHERE 1=0;
SELECT * FROM emp_hire ;
SELECT * FROM emp_sal ;

    
INSERT ALL
    WHEN 조건 THEN INTO 테이블 VALUES (값,...)
    WHEN 조건 THEN INTO 테이블 VALUES (값,...)
SELECT문

INSERT ALL
    WHEN HIREDATE > '2010/01/01' -- 고용일이 '2010/01/01' 이후인 사원
        THEN INTO emp_hire VALUES(empno, ename, hiredate)
    WHEN sal>=2000 -- 급여가 2000 이상인 사원
        THEN INTO emp_sal VALUES(empno, ename, sal)
SELECT empno, ename, hiredate, sal FROM emp;

DESC emp_hire;
DESC emp_sal;

SELECT * FROM  emp;

UPDATE emp
SET sal =1200
WHERE empno = 7396;

UPDATE emp
SET sal = sal * 1.1
WHERE deptno IN (SELECT deptno FROM dept WHERE dname IN ('SALES','ACCOUNTING'));
WHERE deptno IN (10, 30);

SELECT * FROM emp;
SELECT * FROM emp_hire;
SELECT * FROM emp_sal;



--DELETE
DELETE FROM emp WHERE sal <3000;
--3000 이하 애들 다 해고 시키는거 없어짐.
ROLLBACK; --바꾼 값 다시 되돌리기
COMMIT; --완벽하게 DB작성이 완료됐다 하면 해주기 저장되는거 롤백 하면 커밋하고 난 후 코드 되돌리는거임.


show user;

select * from tab;

DESC emp;
DESC dept;

SELECT * FROM emp;
SELECT DISTINCT count(job) FROM emp;
SELECT DISTINCT deptno FROM emp; -- 중복이 제거되고 출력

SELECT * FROM emp;
SELECT * FROM emp WHERE deptno <> 30;
SELECT * FROM emp WHERE deptno != 30;
SELECT * FROM emp  WHERE deptno ^= 30;
SELECT * FROM emp  WHERE NOT deptno = 30;

SELECT * FROM emp WHERE job = 'SALESMAN' AND comm >= 300;

SELECT * FROM dept;

SELECT -10 , ABS(10) FROM dual;

SELECT 3.141592, round(3.541592) FROM dual;

SELECT length(ename) FROM emp;


SELECT TO_CHAR(SYSDATE+1, 'yyyy/mm/dd hh24:mi:ss') FROM dual;

--  MONTHS_BETWEEN
SELECT months_between(A,B) FROM dual;
SELECT months_between(SYSDATE,SYSDATE +1) FROM dual;

--ADD_MONTHS  (기준일, 더할 월 수)
SELECT ADD_MONTHS(SYSDATE, '2') FROM dual;  

SELECT DECODE(100, 100, 'EQUAL', 'UNEQUAL') FROM dual;  --같은게 참이면 첫 번째 문자열 실행 
SELECT DECODE(100, 150, 'EQUAL', 'UNEQUAL') FROM dual;  --같은게 거짓이면 두 번째 문자열 실행

--DECODE   조인 사용하는게 더 깔끔하게[ 나온다
SELECT empno, ename, deptno, DECODE(deptno, 10, '회계팀', 20, '개발팀', 30, '영업팀', 40, '운영팀') deptname
FROM emp;

-- join
SELECT empno, ename, deptno, d.dname
 FROM emp e JOIN dept d ON e.deptno;
 
 
 --CASE 문
 SELECT
    ename,
    CASE
        WHEN deptno = 10 THEN '회계팀'
        WHEN deptno = 20 THEN '개발팀'
        WHEN deptno = 30 THEN '영업팀'
        WHEN deptno = 40 THEN '운영팀'
        ELSE '팀없음'
    END
FROM emp;

-- 그룹 함수(count)
SELECT count(*), count(comm), count(empno) FROM emp;
SELECT * FROM emp WHERE NOT comm IS NULL;

--sum 
SELECT sum(sal) FROM emp;

--avg  
select avg(sal) from emp;

--avg() 사용 안하고 sum값으로 평균 구하기
select sum(sal)/count(*) from emp;

--round 를 사용해서 소수점 둘 째 자리만 사용하기
select round(avg(sal),2) from emp;

--order by 로 내림 오름차순 하기
select * from emp order by sal DESC;

select job, round(avg(sal),2) AS avgsal 
from emp 
GROUP BY job ORDER BY avgsal DESC;

-- 그룹 ㅂㅇ
SELECT job, count(job) AS 인원
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY job
ORDER BY 인원 DESC;

-- 지역별로 몇명이 근무하는지
-- 1. 출력할 테이블   2. 그룹기준 3. 출력할 열  4. 정렬



SELECT e.deptno, dname, COUNT(e.empno)
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.loc;

SELECT e.deptno, dname, COUNT(e.empno)   --부서번호, 부서이름
FROM emp e, dept d  -- e와 d로 변수 설정
WHERE e.deptno = d.deptno  -- 
GROUP BY e.deptno, dname
HAVING COUNT(e.empno) > 5;

-- DML
CREATE TABLE emp_research
AS (SELECT * FROM emp WHERE 1=0);

SELECT * FROM emp;

INSERT INTO emp_research (SELECT * FROM emp WHERE deptno= 20);
SELECT * FROM emp_research;

-- 칼럼을 선   제약조건과 
CREATE TABLE emp_hire AS SELECT empno, ename, hiredate FROM emp where 1=0;
CREATE TABLE emp_sal AS SELECT empno, ename, sal FROM emp where 1=0;

INSERT ALL
    WHEN HIREDATE > '2010/01/01' -- 고용일이 '2010/01/01' 이후인 사원
        THEN INTO emp_hire VALUES(empno, ename, hiredate)
    WHEN sal>=2000 -- 급여가 2000 이상인 사원
        THEN INTO emp_sal VALUES(empno, ename, sal)
SELECT empno, ename, hiredate, sal FROM emp;

DESC emp_hire;
DESC emp_sal;

SELECT * FROM  emp;

UPDATE emp
SET sal =1200
WHERE empno = 7396;

UPDATE emp
SET sal = sal * 1.1
WHERE deptno IN (SELECT deptno FROM dept WHERE dname IN ('SALES','ACCOUNTING'));
WHERE deptno IN (10, 30);

SELECT * FROM emp;
SELECT * FROM emp_hire;
SELECT * FROM emp_sal;

ROLLBACK;


MERGE INTO emp_merge_ex m
USING (
    SELECT empno, ename, deptno, sal FROM emp WHERE deptno IN (20, 30)
) e
ON (m.empno = e.empno)
WHEN MATCHED THEN
    UPDATE SET m.sal = round(m.sal * 1.1)
WHEN NOT MATCHED THEN 
    INSERT (m.empno, m.ename, m.sal, m.deptno) 
    VALUES (e.empno, e.ename, e.sal, e.deptno)
    WHERE e.sal > 1000;
