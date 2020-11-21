-- 1. 제약조건 NOT NULL

DROP TABLE account_info;
--ㅇㅇㅇ
CREATE TABLE account_info(
    id NUMBER,
    --축약형 not null
    email VARCHAR2(128) CONSTRAINT account_info_email_nn NOT NULL
);

SELECT * FROM account_info;
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
--INSERT INTO account_info(id, email) VALUES (2, NULL); --오류
UPDATE account_info SET email = NULL WHERE id =1;


-- 2. 제약조건 UNIQUE
-- 제약조건은 인서트 할 떄와 업데이트 할 때 발생한다
DROP TABLE account_info;
--ㅇㅇㅇ
CREATE TABLE account_info(
    id NUMBER,
    --축약형 not null
    email VARCHAR2(128) UNIQUE
);

SELECT * FROM account_info;
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, 'abcd@gmail.com');
UPDATE account_info SET email = 'abc@gmail.com' WHERE id =2;

INSERT INTO account_info(id, email) VALUES (2, NULL); --오류
UPDATE account_info SET email = NULL WHERE id =1;

-- 제약조건 PRIMARY KEY 
-- 제약조건은 인서트 할 떄와 업데이트 할 때 발생한다
DROP TABLE account_info;
--ㅇㅇㅇ
CREATE TABLE account_info(
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) UNIQUE
); -- account_info 테이블 생성

DROP TABLE account_authentication_1;
CREATE TABLE account_authentication_1(
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER,
    CONSTRAINT account_info_fk FOREIGN KEY (account_info_id) 
    REFERENCES account_info(id)
); -- account_authentication 테이블 생성


SELECT * FROM account_info;
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_authentication_1(id, password, account_info_id) VALUES (1, '1234', 1);

INSERT INTO account_info(id, email) VALUES (2, 'abcd@gmail.com');
UPDATE account_info SET email = 'abc@gmail.com' WHERE id =2;

INSERT INTO account_info(id, email) VALUES (2, NULL); --오류
UPDATE account_info SET email = NULL WHERE id =1;
SELECT * FROM account_authentication_1;


-- 강사님 자료 행 삭제
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_email_uq UNIQUE (email),
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
);

INSERT INTO account_info(id, email) VALUES(1, 'abc@gmail.com');
SELECT * FROM account_info;
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE CASCADE
);
INSERT INTO account_authentication(id, account_info_id) VALUES (1, 1);
-- 테이블 account_info 생성
DROP TABLE account_info CASCADE CONSTRAINTS;
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    created_date TIMESTAMP DEFAULT SYSDATE, --자동으로 날짜 생성
    grade VARCHAR2(128) DEFAULT 'NEW',
    CONSTRAINT account_info_email_uq UNIQUE (email),  -- 메일이 유일한 값인가
    --CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3) -- 4자 이상인가
);

-- 값 넣기
INSERT INTO account_info(id, email) VALUES(1, 'abVbb');
-- 값 확인
SELECT * FROM account_info;

-- 테이블 account_authentication 생성
DROP TABLE account_authentication CASCADE CONSTRAINTS;
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE SET NULL
);

-- account_authentication에 값 넣기
INSERT INTO account_authentication(id, account_info_id) VALUES (1, 1);
-- account_authentication 값 확인
SELECT * FROM account_authentication;

-- 부모테이블 account_info 확인
SELECT * FROM account_info;
-- 부모테이블의 값 삭제
DELETE FROM account_info WHERE id = 1;

-- 실제로 영향을 받았는지 확인
SELECT * FROM account_info;
SELECT * FROM account_authentication;

--
CREATE USER test07 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO test07;

-제약조건 : 인서트와 업데이트 하기 전에 검사하는것//
 사용자가 원하는 조건의 데이터만 유지하기 위해서 특정 
컬럼에 설정하는 제약으로 데이터 무결성을 지키기 위해 제한된 조건.




-----------------
-----------------
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_email_uq UNIQUE (email),
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
);

INSERT INTO account_info(id, email) VALUES(1, 'abc@gmail.com');
SELECT * FROM account_info;
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE CASCADE
);
INSERT INTO account_authentication(id, account_info_id) VALUES (1, 1);
-- 테이블 account_info 생성
DROP TABLE account_info CASCADE CONSTRAINTS;
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    created_date TIMESTAMP DEFAULT SYSDATE, --자동으로 날짜 생성
    grade VARCHAR2(128) DEFAULT 'NEW',
    CONSTRAINT account_info_email_uq UNIQUE (email),  -- 메일이 유일한 값인가
    --CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3) -- 4자 이상인가
);

-- 값 넣기
INSERT INTO account_info(id, email) VALUES(1, 'abVbb');
-- 값 확인
SELECT * FROM account_info;

-- 테이블 account_authentication 생성
DROP TABLE account_authentication CASCADE CONSTRAINTS;
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE SET NULL
);

-- account_authentication에 값 넣기
INSERT INTO account_authentication(id, account_info_id) VALUES (1, 1);
-- account_authentication 값 확인
SELECT * FROM account_authentication;

-- 부모테이블 account_info 확인
SELECT * FROM account_info;
-- 부모테이블의 값 삭제
DELETE FROM account_info WHERE id = 1;

-- 실제로 영향을 받았는지 확인
SELECT * FROM account_info;
SELECT * FROM account_authentication;

--
CREATE USER test07 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO test07;


-- 실습 account_info50 제약조건 not null
--not null은 칼럼 지정 할 떄 선언 해주기
CREATE TABLE account_info50(
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) CONSTRAINT account_info50_email_nn NOT NULL  --제약조건
    -- 제약조건 이름을 걸어주는거는 명시적인 이름에 제약조건을 걸어준다.
);

INSERT INTO account_info50(id, email) VALUES(1,NULL); --NULL이여서 안들어감
INSERT INTO account_info50(id, email) VALUES(1,'ABC@NAVER.COM');

SELECT * FROM account_info50;

-- 실습 account_info60 제약조건 unique(1)
DROP TABLE account_info60;
CREATE TABLE account_info60(
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128),
    CONSTRAINT account_info60_email_uq UNIQUE(email),  --제약조건
    -- 제약조건 이름을 걸어주는거는 명시적인 이름에 제약조건을 걸어준다.
    created_date TIMESTAMP default SYSDATE
);

INSERT INTO account_info60(id, email) VALUES(1,NULL); --NULL이여서 안들어감
INSERT INTO account_info60(id, email) VALUES(2,'ABC@NAVER.COM');
INSERT INTO account_info60(id, email) VALUES(1,'ABC@NAVER.COM');
INSERT INTO account_info60(id, email) VALUES(3,null);

SELECT * FROM account_info60;

--제약조건이 필요한 이유
-- account_authentication 제약조건 추가하기 
DROP TABLE account_authentication;
CREATE TABLE account_authentication(
    id NUMBER PRIMARY KEY,
    -- not null 은 바로 안되고 뒤에 살 붙임
    password VARCHAR2(128) CONSTRAINT account_authentication_pwd_nn NOT NULL,
    -- CONSTRAINT 제약조건이름 제약조건타입(칼럼)
    CONSTRAINT account_authentication_pk PRIMARY KEY(id),
    CONSTRAINT account_info60_fk -- 제약조건이름
        FOREIGN KEY (account_info60_id)--(지정할 칼럼)
            REFERENCES account_info60(id),--참조할 테이블(참조할테이블의_칼럼)
    CONSTRAINT account_authentication_length_chk CHECK(length(password) >7)
);

INSERT INTO account_authentication(id,password,account_info_id) VALUES (1, '1234123456',1)

SELECT * FROM account_authentication;
