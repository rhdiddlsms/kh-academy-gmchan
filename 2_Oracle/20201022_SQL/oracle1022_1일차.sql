--첫 번째 (필기)--

-- 기존에 잘못된 정보 삭제--
DROP TABLE student_info;

-- 표 맨 위에 행 생성하는법--
CREATE TABLE student_info (
--not null은 무조건 채워져야 하는것 로그인 할 떄 아이디 비밀번호라고 생각하기--
    name VARCHAR2(128) not null,  
    phone VARCHAR2(128) not null,
    email VARCHAR2(128) not null,
    age NUMBER not null,
    fired CHAR(1) default 'N' 
);

SELECT * FROM student_info;

--표 아래 내용 추가 하는법--
INSERT INTO student_info
        (name,phone, email, age, fired)  -- 
VALUES('내이름', '번호인것', '메일인것', 13, 'N'); --() 안에 있는 변수 열 순서대로 값 저장
COMMIT;
SELECT * FROM student_info;  --println 역할--
-- SELECT 절은 어떤 절을 고르겠다.
-- 열 하나를 고르겠다 하면 / SELECT 열1, 열2, 열3,...n
-- FROM 테이블_이름
-- 원하는 열을 꺼내겠따  SELECT  name,phone, email, age, fired
-- FROM student_info
--일부 열만 선택 : 프로젝션 
--모든 열 선택 : *

-- #JOIN--  두개 테이블을 연결해서 하나로 연결


DROP TABLE department_info;

CREATE TABLE department_info(  
    hoho VARCHAR2(32) not null,
    location VARCHAR2(32) not null
);

INSERT INTO department_info
        (hoho,location)
VALUES('kh정보교육원', '당산'); 

SELECT * FROM department_info;
