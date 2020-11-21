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


--TCL
CREATE TABLE bank_account (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(32) NOT NULL,
    money NUMBER DEFAULT 0
);

SELECT * FROM bank_account;

INSERT INTO bank_account(id,name,money) VALUES(1,'A', 1000);
INSERT INTO bank_account(id,name,money) VALUES(2,'B', 0);
COMMIT;

--A의 계좌를 0으로 업데이트
--B의 계좌를 100으로 업데이트
-- transaction 시작
UPDATE bank_account SET money = 0 WHERE name='A';
UPDATE bank_account SET money = 1000 WHERE name='B';
COMMIT;  --에러가 없으면 커밋 해주기
-- transaction 끝

SELECT * FROM bank_account;

-- 10.29 --

SELECT empno, ename, job, sal,
RANK() OVER(ORDER BY sal DESC) 급여순위
FROM emp;

SELECT ename, deptno, sal,
    RANK() OVER (ORDER BY sal DESC) "순위1",
        DENSE_RANK() OVER (ORDER BY sal DESC) "순위2",
        DENSE_RANK() OVER (PARTITION BY deptno
    ORDER BY sal DESC) "순위3" -- 그룹 안에서의 순위
FROM emp
ORDER BY 순위1;

-- NTILE 등급을 몇개로 나눌지 ()에 써주기
SELECT ename, sal,
NTILE(4) OVER(ORDER BY sal) 등급   --등급을 나눠주는 구문.
FROM emp;

-- ROW_NUMBER() 은 
SELECT empno, ename, sal, hiredate,
ROW_NUMBER() OVER (ORDER BY sal DESC,
hiredate ASC) 순번
FROM emp;

SELECT deptno, SUM(sal) s_sal
FROM emp
GROUP BY deptno;


SELECT *FROM emp JOIN dept USING(deptno)
WHERE sal IN (SELECT MAX(sal)
FROM emp
GROUP BY deptno);

-- ANY연산자 범위로 일치하는 직원들 
SELECT empno, ename,job, sal
FROM emp
WHERE sal > ANY (SELECT sal FROM emp WHERE JOB = 'SALESMAN');

SELECT sal FROM emp WHERE sal > 1250;

-- ANY연산자 정확하게 일치하는 직원들
SELECT empno, ename, job,sal
FROM emp
WHERE sal = ANY (SELECT sal FROM emp WHERE JOB = 'SALESMAN');

-- ALL 연산자 의미만 기억하기!
SELECT * FROM emp WHERE sal > ALL (SELECT sal FROM emp
WHERE JOB = 'MANAGER');

-- 가장 큰 값을 가진 EMP의 JOB의'MANAGER'에서
SELECT max(sal) FROM emp WHERE job = 'MANAGER';

-- 표준조인
SELECT e.ename, e.job, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno;


--from 절 서브쿼리  (어떻게 분석했나 )  안쪽에 있는거 한 다음에 
SELECT b.empno, b.ename, b.job, b.sal, b.deptno
FROM (
SELECT empno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20)
) a, emp b WHERE a.empno = b.empno AND b.mgr is NOT NULL AND b.deptno != 20;
--급여가 부서번호 20인 부서의 평균보다 높고 사원을 관리하는 ‘MANAGER’ 로써 20 부서에 속하지 않는 사원ㅈ

--1. 가장 안쪽에 있는 서브쿼리  b
SELECT AVG(sal) FROM emp WHERE deptno =20;
--2.: a
SELECT empno, ename FROM emp WHERE sal > (SELECT AVG(SAL)FROM emp WHERE deptno = 20);



--
DROP TABLE test_table;
    
CREATE TABLE test_table(
    id NUMBER,
    name VARCHAR(128) CONSTRAINT test_table_nn NOT NULL,  --컬럼 레벨
    --테이블 레벨
    CONSTRAINT test_table_pk PRIMARY KEY(id)
);

DESC test_table;   --어떤 형식으로 되어있는지 알 수 있음

SELECT *FROM test_table;  

--복합기를 지정 할 때는 두개이상 지정 해야되니깐.. 이거 기억하기



--DEFAULT 값을 변경하는 경우 기존 데이터는 영향 X  컬럼 추가
ALTER TABLE 테이블이름 ADD CONSTRAINT 제약조건이름 제약조건종류(칼럼이름);
ALTER TABLE test_table ADD CONSTRAINT test_table_name_uq UNIQUE(name);

--NOT NULL 일 때 ALTER
ALTER TABLE 테이블이름 MODIFY (칼럼 NOT NULL);
ALTER TABLE emp MODIFY (comm NOT NULL);

--FOREIGN KEY
CREATE TABLE user_info (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(128) NOT NULL,
    email VARCHAR2(128) UNIQUE
);

DROP TABLE bank_account;
CREATE TABLE bank_account (
    id NUMBER PRIMARY KEY,
    user_info_id NUMBER CONSTRAINT user_info_fk REFERENCES user_info(id),
    balance NUMBER DEFAULT 0
);
INSERT INTO user_info(id, name, email) VALUES (10, 'abc', 'a@b.com');
INSERT INTO bank_account(id, user_info_id) VALUES (1, 10);

SELECT * FROM user_constraints WHERE table_name = 'BANK_ACCOUNT';
SELECT * FROM user_cons_columns WHERE table_name = 'BANK_ACCOUNT';


-- 컬럼 추가 / 이름변경 / 수정 / 삭제

CREATE TABLE test AS (SELECT empno, ename, sal FROM emp WHERE 1=0);
SELECT * FROM test;

-- 새 컬럼 추가하기.
ALTER TABLE 테이블이름 ADD (컬럼 데이터타입);
ALTER TABLE test ADD (job VARCHAR(9));
DESC test; --확인

ALTER TABLE 테이블이름 RENAME COLUMN 원래_컬럼_이름 to 바뀔_컬럼_이름;
ALTER TABLE test RENAME COLUMN job to ha;

ALTER TABLE 테이블이름 MODIFY (컬럼 바꿀타입);
ALTER TABLE test MODIFY (ha VARCHAR2(128);

ALTER TABLE 테이블이름 DROP COLUMN 원래_컬럼_이름;  --칼럼 삭제
ALTER TABLE 테이블이름 RENAME CONSTRAINT 원레제약조건명 TO 바뀔제약조건명;

ALTER TABLE 테이블이름 DROP CONSTRAINT 제약조건명;
--또한 삭제 작업을 할 경우 데이터 무결성을 위하여 다른 사용자의 접근을
--막을 수 있다(LOCK 발생). 우선 SET UNUSED를 이용하여 비활성시킨 후에 작업량이 적은 시간대에
--DROP을 하도록 한다.


---- 20201030
--0. 혹시 몰라서 삭제
--1. 사용자 계정 생성 및 권한 부여

DROP USER test01 CASCADE;
DROP USER test02 CASCADE;

-- 1. 사용자 계정 생성 및 권한 부여
CREATE USER test01 IDENTIFIED BY 1234;
CREATE USER test02 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO test01, test02;
-- 2. test02 계정으로 접속해서 abc라는 테이블을 하나 만들었음
SELECT * FROM abc;
CREATE TABLE abc (
    id NUMBER PRIMARY KEY
);
-- 3. 공개 동의어를 생성하고 test01에게 부여해줌
GRANT create sunonym TO test02;
DROP PUBLIC SYNONYM abc_public;
CREATE PUBLIC SYNONYM abc_public FOR test02.abc;
GRANT SELECT ON test02.abc TO test01;
