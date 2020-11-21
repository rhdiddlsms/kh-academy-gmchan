--3번째 조인--

DROP TABLE student_info;
CREATE TABLE student_info (
--not null은 무조건 채워져야 하는것 로그인 할 떄 아이디 비밀번호라고 생각하기--
    name VARCHAR2(128) not null,  
    phone VARCHAR2(128) not null,
    email VARCHAR2(128) not null,
    age NUMBER not null,
    fired CHAR(1) default 'N',
    department_id NUMBER
);
SELECT * FROM student_info;

DROP TABLE department;

CREATE TABLE department (
    id NUMBER NOT NULL,
    name VARCHAR2(128) NOT NULL,
    location VARCHAR(128) NOT NULL
);
SELECT *FROM department;

INSERT INTO department(id, name, location) VALUES(11, '으악', '으으으으');
INSERT INTO department(id, name, location) VALUES(12, '000', '12131');
INSERT INTO department(id, name, location) VALUES(13, 'SQL', 'DATABASE');
INSERT INTO department(id, name, location) VALUES(14, 'ㅜㅜ', 'ㅠㅠㅠㅠㅠ');
SELECT *FROM department;

SELECT *FROM student_info;

INSERT INTO student_info(name, phone, email, age, department_id)
            VALUES('이금찬','01083550433', 'RHDIDDLSMS@NAVER.COM', '25' , 11);
INSERT INTO student_info(name, phone, email, age, department_id)
            VALUES('이은찬','01083550433', 'TADE@NAVER.COM', '22' , 12);
INSERT INTO student_info(name, phone, email, age, department_id)
            VALUES('이동찬','01083550433', 'FADE@NAVER.COM', '30' , 13);
INSERT INTO student_info(name, phone, email, age, department_id)
            VALUES('이동찬','01083550433', 'FADE@NAVER.COM', '30' , 14);
SELECT *FROM student_info;


--join
--테이블 1, 테이블2,...,테이블N
-- FROM table1 t1
-- JOIN 
SELECT *
FROM student_info si, department d
WHERE si.department_id = d.id;

SELECT *
FROM student_info si
JOIN department d
ON si.department_id = d.id;

--해독 하는 순서 1. FROM  2. WHERE 3.SELECT--

DROP TABLE student_info;

CREATE TABLE student_info(
    name VARCHAR2(20) not null,
    phone VARCHAR(20) not null,
    email VARCHAR(20) not null,
    age NUMBER not null,
    fired CHAR(1) DEFAULT 'N',
    department_id NUMBER,
    residence_id NUMBER
);
SELECT *FROM student_info;
INSERT INTO department(name,phone,email,age,fired,department_id,residence_id)
    VALUES ('gmchan','010','@naver',25,'N',11,11);
INSERT INTO department(name,phone,email,age,fired,department_id,residence_id)
    VALUES ('gmchan1','0101','@naver1',251,'N',12,12);
INSERT INTO department(name,phone,email,age,fired,department_id,residence_id)
    VALUES ('gmchan2','0102','@naver1',252,'N',13,13);
    
    
    
CREATE TABLE residence(
    r_id NUMBER not null,
    r_name VARCHAR(20) not null,
    r_nation VARCHAR(20) not null
)

INSERT INTO department(r_id, r_name, r_nation)
    VALUES ('');
    
  ------------------------------------------------  
    
CREATE TABLE user_account (
    id NUMBER NOT NULL,
    name VARCHAR2(128) NOT NULL,
    email VARCHAR2(128) NOT NULL,
    location VARCHAR2(128) NOT NULL
);
   
    
INSERT INTO user_account(id, name, email, location) 
    VALUES (1, '주호민', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) 
    VALUES (2, '이병건', 'b@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) 
    VALUES (3, '무엇', 'n@b.com', 'seoul');

CREATE TABLE account_log (
    id NUMBER NOT NULL,
    user_account_id NUMBER NOT NULL,
    action VARCHAR2(128) NOT NULL
);

INSERT INTO account_log (id, user_account_id, action)
    VALUES (1, 2, 'LOGGED IN');
INSERT INTO account_log (id, user_account_id, action)
    VALUES (2, 3, 'DELETED ACTION HISTORY');

SELECT * FROM user_account;
SELECT * FROM account_log;

COMMIT;

--WHERE 절 사용
SELECT *
FROM user_account ua, account_log al
WHERE ua.id = al.user_account_id;

--JOIN 절 사용
SELECT *
FROM user_account ua
JOIN account_log al ON ua.id = al.user_account_id;

SELECT *FROM emp
WHERE SAL<1500;

--ORDER BY는 어떤 칼럼을 정렬할지  오름차순  내림차순 DESC
SELECT *FROM emp ORDER BY SAL DESC;

-- AND 조건 절
SELECT *FROM emp 
WHERE job = 'SALESMAN' AND SAL>=1500;

--SALESMAN 빼고 다 나옴
SELECT *FROM emp 
WHERE NOT job = 'SALESMAN';

--포함 연산자
SELECT *FROM emp 
WHERE job IN ('SALESMAN', 'PRESIDENT');

--범위 연산자 
SELECT *FROM emp 
WHERE SAL BETWEEN 1000 AND 1500;

--LIKE 문자열 검색 할 떄   _는 종류상관X 한개의 문자  ,  %는 길이와 종류 상관X 모든 문자
SELECT *FROM emp 
WHERE ENAME LIKE 'MA%';
--%MA% 는 MA라는 모든 문자를 해서 오래걸리고  O%는 O만 찾아준다  : 문자열을 검색 할 수 있다.

SELECT *FROM emp 
WHERE ENAME LIKE '_';
--   _ 는 외자 이름을 찾을 때 사용   이 문장 에러 났음

-- is null 연산자는 값이 없는 칼럼을 조회
SELECT *FROM emp 
WHERE NOT comm is null;

--집합연산  합집합, 차집합, 교집합을 구하는 연산인데 많이 쓰이는 UNION학습
--UNION 중복된 원소들 다 제거하고 출력 해줌.

--UNION ALL 사용하면 중복 제거 안하고 출력 ALL 빼면 중복 제거
SELECT JOB FROM emp  
UNION 
SELECT JOB FROM job_table;
--SELECT '*' FROM은 열이 안맞기 때문에 사용 X

--UNION 은 열을 연결 한다고 생각 join은 행을 연결
CREATE TABLE job_table(
    id number not null,
    job varchar2(128) not null
);

SELECT * FROM job_table;
INSERT INTO job_table(id, job) VALUES (1, 'SALESMAN');
INSERT INTO job_table(id, job) VALUES (2, 'SALESMAN');
INSERT INTO job_table(id, job) VALUES (3, 'CLERK');
INSERT INTO job_table(id, job) VALUES (4, '아무말말');


-- select 열선택  from 테이블 1
-- UNION
-- select 열선택  from 테이블 2
-- 주의 : 열은 같아야함!(그래서 *을 못씀) , 이름도, 자료형도 같아야함


-- COST가 증가한다 == 실행 시간이 증가한다
SELECT lower(ename) as ename_lower FROM emp;
--as 변수명 사용하면 ....

--length 를 활용해서 이름 4글자 이하인 사람 출력하기 
select ename from emp where length(ename)<=4;

--from절  테이블 말고 셀렉트한 결과도 데이터로 취급 가능
SELECT * FROM (SELECT *FROM emp) WHERE length(JOB)<=7;
-- job에서 7글자 이하만 출력하기 SALESMAN 출력 안됨.

--SUBSTRING  문자열을 나누는거 , 문자열의 일부를 
-- 자바는 문자열 0부터 시작이지만 SQL은 1부터 시작함 
SELECT ename, substr(ename,2,4) from emp;
--substr (선택 할 열, 시작할 문자 위치, 추출할 문자개수) 기억하기.

--ename에서 L이라는 단어가 어디 있는지 아려면
SELECT ename, instr(ename, 'L') from emp;
-- 함수 왜 사용하냐? 원본 데이터를 변경하지 않고 추가적인 처리를 할 때 함수를 사용.

--replace(선택할 열, '타겟', 변경할 문자) -문자열 변경
SELECT replace(ename, 'AR', 'SC') FROM emp;
--이름에 AR이 들어가면 AR이 없어진다.

--PAD ('선택할 열' , '채울글자 수' ,  '채울 문자')  RPAD는 *를 오른쪽부터 채움 LPAD는 *를 왼쪽부터 채움
SELECT RPAD('121212-', 14, '*') FROM DUAL;

--concat('선택할 열1', '선택할 열 2(값)')  선택할 열이 값이 여도 상관이 없음
SELECT concat('ename', 'd') as result FROM DUAL;

-- round('선택할 열 of 값')   소숫점 빼서나옴
SELECT round(3.1415926535)FROM DUAL;

-- trunc(선택한열(값), 몇번째 이후로 버릴껀지)
SELECT trunc(3.1415926535,2)FROM DUAL;
            --두번째 이후로 버린다.
            
--mod는 자바의 %연산과 동일함 나머지값.   
-- mod(나눠질값, 나눌값)
SELECT mod(15, 2) FROM DUAL;

--sysdate는 오늘 날짜 나옴 +1해주면 하루 증가
SELECT sysdate FROM DUAL;

--localdatetime
SELECT add_months(SYSDATE, 3) FROM DUAL;

-- next_day(날짜타입의_열(혹은 값), '월~일요일(SUN~SAT로 자주쓴다)')
--다음주에 나오는거
SELECT next_day(SYSDATE, 'MON') FROM DUAL;

SELECT value
FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_LANGUAGE';

--3.4. 형변환 함수 TO_CHAR(날짜, 포맷문자열) 많이 사용됨.
--CC는 세기 /YYYY는 년도/ MM월 / DD 일 /HH24는 24시로표기/MI분 /SS초
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') FROM DUAL;

--문자열로 기록된 시간을 데이터타입 형태로 집어 넣을 때 사용
-- TO_DATE('날짜 입력','포맷 문자열')
SELECT TO_DATE('2020-10-13 03:02:24', 'YYYY/MM/DD HH24:MI:SS') FROM DUAL;

SELECT nv12(comm, '커미션 존재', '커미션 없음')FROM emp;
--nv12(선택할 열, 'NULL이 아닌 경우 반환할 값이나 식', '  NULL인 경우 반환할 값이나 식')

SELECT sum(sal) from emp;

SELECT count(comm) from emp;

select avg(sal) from emp;
-- sum(선택할 열); , count(선택할 열);,  avg(선택할 열);

select * from emp order by job;

select avg(sal) from emp where job = 'MANAGER';

select job from emp group by job;

select job, avg(sal) as avgsal from emp group by job;


--
CREATE TABLE GMCHAN (
    name VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    age NUMBER NOT NULL,
    id NUMBER NOT NULL
);

INSERT INTO GMCHAN (name, phone, age, id)
VALUES ('GMCHAN', '010', 25, 1);
INSERT INTO GMCHAN (name, phone, age, id)
VALUES ('GMCHAN2', '8355', 21, 1);
INSERT INTO GMCHAN (name, phone, age, id)
VALUES ('GMCHAN3', '0433', 23, 1);


CREATE TABLE gm_account (
    id NUMBER NOT NULL,
    name VARCHAR2(128) NOT NULL,
    email VARCHAR2(128) NOT NULL,
    location VARCHAR2(128) NOT NULL
);
    
INSERT INTO gm_account(id, name, email, location) 
    VALUES (1, '주호민', 'a@b.com', 'seoul');
INSERT INTO gm_account(id, name, email, location) 
    VALUES (2, '이병건', 'b@b.com', 'seoul');
INSERT INTO gm_account(id, name, email, location) 
    VALUES (3, '무엇', 'n@b.com', 'seoul');

select *from GMCHAN;
select *from gm_account;

select *
from GMCHAN g
join gm_account a ON g.gm_account_id= a.GMCHAN_id;
GROUP BY loc;
-- 순서는 : 조인이 먼저 발생 그룹바이로 그룹을 묶은 다음에 그룹 행 함수를 지정하고 셀렉트 한거
-- join -> group by -> 필요한 행렬 그룹바이로 

select *from emp;
select *from dept;

SELECT dname, avg(sal) AS avgsal
FROM emp e 
JOIN dept d ON  e.deptno = d.deptno
GROUP BY dname HAVING avg(sal)>=2000
ORDER BY avgsal DESC;

-- HAVING절
--등가조인 =기존에 했던 동등한 조건에서 조인 하는것  

SELECT * FROM emp;
SELECT *FROM salgrade;

-- 비등가 조인 = 범위값을 통해서 조인하는것 '=' 안쓰고 조인하는것
select s.grade, e.*
from emp e, salgrade s
where e.sal between s.LOSAL AND s.HISAL;

-- 자체조인은 : 나 혼자 조인하는것
-- 2일차는 where 부터 join까지 

--where절
-- ename에 SMITH가 있는사람
select * from emp where ename = 'SMITH';

--LIKE는 속도에 유의하기
-- 이름이 S로 끝나는 사람  
select * from emp where ename LIKE 'S%';
-- 이름이 S로 시작하는 사람  
select * from emp where ename LIKE '%S';

--2.3 not   in    btween 기억하기
select * from emp where not ename = 'SMITH'; --not
select * from emp where ename IN('SMITH','MARTIN'); --IN

select * from emp where comm IS NULL; --null 동등비교

--유니온은 타입 일치 시키고 (집합 연산)
-- 유니온은 중복이 제거 된 상태로 추력
-- 유니온 올은 중복 제거 하지 않고 결과가 다 나옴
select *from emp
UNION all
select *from emp;

-- 
select ename from emp as e
UNION all
select ename from emp as e;

--lower 대문자를 소문자로 바꿔줌
SELECT lower('ABCDE') from dual;

--
select * from emp where length(ename) <= 4;

-- 현재 날짜
select sysdate from dual;

-- add_months 는 몇 개월 후  '3'은 3개월 후
SELECT add_months(SYSDATE, 3) FROM DUAL;


-- NEXT_DAY(기준일, '요일')
SELECT next_day(SYSDATE, '목요일') FROM DUAL;

-- TO_CHAR(날짜, 날짜포맷)   형변환 함수
SELECT TO_CHAR(SYSDATE, 'CC YYYY/MM/DD HH24:MI:SS') FROM DUAL;

--NVL2(
  데이터 혹은 칼럼, 
  NULL이 아닌 경우 반환할 값이나 식,
  NULL인 경우 반환할 값이나 식
)

--count 에서는 null은 세지 않는다.


