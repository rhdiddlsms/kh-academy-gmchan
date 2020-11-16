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
DROP PUBLIC SYNONYM abc_public;
CREATE PUBLIC SYNONYM abc_public FOR test02.abc;
GRANT SELECT ON test02.abc TO test01;

CREATE USER test03 IDENTIFIED BY 1234;
ALTER USER test03 IDENTIFIED BY 4321;
DROP USER test03;

CREATE SEQUENCE seq_abc;   -- CREATE는 만들 때
ALTER SEQUENCE seq_abc INCREMENT BY 1000; --ALTER는 수정할 때

REVOKE INSERT ON emp FROM PUBLIC; --전체를 지우는거

SELECT
    *
FROM emp;

DESC emp;
INSERT INTO emp(empno, ename) VALUES ()

-- *은 모두를 
--셀렉션
SELECT * FROM emp;

--프로젝션
SELECT job FROM emp;

-- 이런식으로 별칭을 나타 낼 수 있음.
SELECT ename AS 직원명
FROM emp e
JOIN dept d ON e.deptno = e.deptno;




