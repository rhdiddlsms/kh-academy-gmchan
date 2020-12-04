--2번째--

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