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

INSERT INTO department(id, name, location) VALUES(1, '으악', '으으으으');
INSERT INTO department(id, name, location) VALUES(2, '000', '12131');
INSERT INTO department(id, name, location) VALUES(3, 'SQL', 'DATABASE');
INSERT INTO department(id, name, location) VALUES(4, 'ㅜㅜ', 'ㅠㅠㅠㅠㅠ');
SELECT *FROM department;

SELECT *FROM student_info;

INSERT INTO student_info(name, phone, email, age, department_id)
            VALUES('이금찬','01083550433', 'RHDIDDLSMS@NAVER.COM', '25' , '85');
INSERT INTO student_info(name, phone, email, age, department_id)
            VALUES('이은찬','01083550433', 'TADE@NAVER.COM', '22' , '11');
INSERT INTO student_info(name, phone, email, age, department_id)
            VALUES('이동찬','01083550433', 'FADE@NAVER.COM', '30' , '33');
INSERT INTO student_info(name, phone, email, age, department_id)
            VALUES('이동찬','01083550433', 'FADE@NAVER.COM', '30' , '33');
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
    VALUES ('gmchan','010','@naver',25,'N','11','11');
INSERT INTO department(name,phone,email,age,fired,department_id,residence_id)
    VALUES ('gmchan1','0101','@naver1',251,'N','12','12');
INSERT INTO department(name,phone,email,age,fired,department_id,residence_id)
    VALUES ('gmchan2','0102','@naver1',252,'N','13','13');
    
CREATE TABLE residence(
    r_id VARCHAR2(20) not null,
    r_name VARCHAR(20) not null,
    r_nation VARCHAR(20) not null,

--JOIN 순차적으로 설명 변수명 쉽게-----
-- 테이블 a의 변수 생성 ------------------------------
CREATE TABLE a (
    id NUMBER not null, -- 테이블의 기본키
    name VARCHAR2(32) not null, --32글자 제한이 있는 문자열
    b_id NUMBER not null
);

INSERT INTO a(id, name, b_id) VALUES (1, 'a_value1', 1);
INSERT INTO a(id, name, b_id) VALUES (2, 'a_value2', 1);
INSERT INTO a(id, name, b_id) VALUES (3, 'a_value3', 2);

-- 테이블 b의 변수 생성 
CREATE TABLE b (
    id NUMBER not null,
    name VARCHAR2(32) not null
);

-- b에 (id, name) 에  	값을   (여기 있는 값)
INSERT INTO b(id, name) VALUES (1, 'b_value1');
INSERT INTO b(id, name) VALUES (2, 'b_value2');

--a , b 테이블을 전체 조회
SELECT * FROM a;   
SELECT * FROM b;

-- SELECT * FROM a,b --를 하면 a는 3열 b는 2열 이 곱해져서 6열이 나온다. 

--a의 b_id와  b의 id가 같을 때를 보여준다
SELECT * FROM a a, b b WHERE a.b_id = b.id;