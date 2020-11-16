# 오전 계정생성 및 제약조건 정리

# 계정생성과 삭제 권한부여
```SQL
CREATE USER TEST01 IDENTIFIED BY 1234; --계정생성 비밀번호부여
GRANT CONNECT, RESOURCE TO test01; -- 권한 부여 (CONNECT 와 RESOURCE //두 개의 권한 부여)


SELECT * FROM ALL_USERS WHERE USERNAME = 'TEST01'; --생성한 계정확인
SELECT * FROM DBA_USERS;
SELECT * FROM DBA_OBJECTS;

ALTER USER TEST01 IDENTIFIED BY 12345; -- 비밀번호 변경

DROP USER TEST01; -- 계정삭제

-- 권한관리
-- CONNECT --롤
-- CREATE SESSION --여러 다른 권한들 이것들을 묶어놓은것이 롤
-- 다른거 등등

GRANT CONNECT TO TEST01;  -- GRANT 권한(혹은 롤) TO 사용자이름; GRANT는 권한을 부여하는 것.
REVOKE CONNECT FROM TEST01; -- REVOKE는 주어진 권한을 뺐는 것.



CREATE TABLE TEST_TABLE(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR(32) NOT NULL
);

SELECT * FROM TEST_TABLE;

```



## NOT NULL 제약조건 걸기
 --제약조건을 거는 이유 : 데이터의 무결성과 정합성을을 갖추기 위해서
  제약조건을 거쳐야만 INSERT(삽입)와 UPDATE(수정)가 가능해진다.

```SQL
CREATE TABLE ACCOUNT_INFO(
 ID NUMBER PRIMARY KEY,
 EMAIL VARCHAR2(128) NOT NULL   -- 1.제약조건 이름 붙이지 않고 거는법
 );

CREATE TABLE ACCOUNT_INFO(   -- 2.이름 붙여서 NOT NULL 거는법
-- 이름붙여서 제약조건 거는 이유 : 나중에 데이터가 방대해졌을 때 제약조건을 한번에 조회하게 될때 명시적 이름을 붙여야만 찾기 쉽다.

 ID NUMBER PRIMARY KEY,
 EMAIL VARCHAR2(128) CONSTRAINT ACCOUNT_INFO_NN NOT NULL -- ACCOUNT_INFO_NN 테이블 이름에 NN 붙여서 보통 이름 짓는다.
 );
 
INSERT INTO ACCOUNT_INFO (ID, EMAIL) VALUES(123,'AJKD@NAVER.COM');
INSERT INTO ACCOUNT_INFO (ID, EMAIL) VALUES(1234,'AJKD@NAVER.COM');
INSERT INTO ACCOUNT_INFO (ID, EMAIL) VALUES(1235, NULL);  --NULL을 넣을 수 없다. NOT NULL 제약조건 걸었기 때문에.
 -- 'NULL' 문자가 NULL인 것은 상관없으나 보통 이렇게 하지는 않는다.
 SELECT * FROM ACCOUNT_INFO;

 SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'ACCOUNT_INFO';
```

## UNIQUE 걸기

```sql
CREATE TABLE ACCOUNT_INFO(
 ID NUMBER PRIMARY KEY,
 EMAIL VARCHAR2(128) UNIQUE
 );

CREATE TABLE ACCOUNT_INFO(
 ID NUMBER PRIMARY KEY,
 EMAIL VARCHAR2(128) CONSTRAINT ACCOUNT_INFO_UQ UNIQUE  --이름붙여서 UNIQUE 제약조건 거는법
 );

CREATE TABLE ACCOUNT_INFO(
 ID NUMBER PRIMARY KEY,
 EMAIL VARCHAR2(128) NOT NULL, -- NOT NULL 걸고 이 후에 열이름 적어서 UNIQUE 도 동시에 건다.
 CONSTRAINT ACCOUNT_INFO_UQ UNIQUE(EMAIL)   -- NOT NULL과 UNIQUE 동시에 여러개 걸 때는 이런식으로 건다.
 );
 
INSERT INTO ACCOUNT_INFO (ID, EMAIL) VALUES(123,'AJKD@NAVER.COM');
INSERT INTO ACCOUNT_INFO (ID, EMAIL) VALUES(1234,'AJKD@NAVER.COM');  -- 이메일 같은 값 들어가려해서 오류 UNIQE 제약조건 걸었기에 중복 허용하지 않는다.
INSERT INTO ACCOUNT_INFO (ID, EMAIL) VALUES(1235, NULL); 
 
 SELECT * FROM ACCOUNT_INFO;
```

## PRIMART KEY 걸기
```sql
CREATE TABLE ACCOUNT_INFO(
 ID NUMBER PRIMARY KEY,
 EMAIL VARCHAR2(128) NOT NULL,
 CONSTRAINT ACCOUNT_INFO_UQ UNIQUE(EMAIL)
 );


CREATE TABLE ACCOUNT_INFO(
 ID NUMBER CONSTRAINT ACCOUNT_INFO_PK PRIMARY KEY,  --PRIMARY KEY 이름 지정해서 생성 테이블이름적고 _PK 이런식으로 적는다.
 EMAIL VARCHAR2(128) NOT NULL,
 CONSTRAINT ACCOUNT_INFO_UQ UNIQUE(EMAIL)
 );

CREATE TABLE ACCOUNT_INFO(
 ID NUMBER,
 CONSTRAINT ACCOUNT_INFO_PK PRIMARY KEY(ID),  -- PRIMARY KEY 이름 걸고 생성하는 또 다른 방법
 EMAIL VARCHAR2(128) NOT NULL,
 CONSTRAINT ACCOUNT_INFO_UQ UNIQUE(EMAIL)
 );
```


# FOREIGN KEY 걸기
```sql
CREATE TABLE ACCOUNT_AUTHENTICATION(
 ID NUMBER PRIMARY KEY,
 PASSWORD VARCHAR(128) NOT NULL,   --- 비밀번호에는 UNIQUE 걸면 안된다. 비밀번호 같은 사람들끼리 충돌일어난다.
 ACCOUNT_INFO_ID NUMBER REFERENCES ACCOUNT_INFO(ID)
);

CREATE TABLE ACCOUNT_AUTHENTICATION(
 ID NUMBER PRIMARY KEY,
 PASSWORD VARCHAR(128) NOT NULL,   --- 비밀번호에는 UNIQUE 걸면 안된다. 비밀번호 같은 사람들끼리 충돌일어난다.
 ACCOUNT_INFO_ID NUMBER CONSTRAINT ACCOUNT_INFO_FK REFERENCES ACCOUNT_INFO(ID)  --이름걸어 생성 테이블이름_FK 이런식으로 만든다.
);


CREATE TABLE ACCOUNT_AUTHENTICATION(
 ID NUMBER PRIMARY KEY,
 PASSWORD VARCHAR(128) NOT NULL,
 ACCOUNT_INFO_ID NUMBER,      -- ACCOUNT_INFO_ID이름걸고 FOREIGN KEY 거는 다른 방법
CONSTRAINT ACCOUNT_INFO_FK FOREIGN(ACCOUNT_INFO_ID) KEY REFERENCES ACCOUNT_INFO(ID)
);


INSERT INTO ACCOUNT_AUTHENTICATION(ID,PASSWORD,ACCOUNT_INFO_ID)
VALUES(1, '1234', 124);   -- ACCOUNT_INFO 테이블 = 부모테이블 '124' 존재하지 않는 값 넣으려 했기 때문에 오류
-- 부모테이블 ACCOUN_INFO 테이블의  ACCOUNT_INFO-ID 와 연결되므로 맞는 값을 넣어야 삽입이 가능하다.
--비밀번호 문자열로 넣는 이유 위에 ACCOUNT_INFO의 비밀번호 타입이 VARCHAR 타입이기 때문에 그냥 숫자1234가 아니라 '1234' 이런식으로 VARCHAR타입 맞추어 넣어야한다.
```


# 삭제정책
```sql
자식테이블 전부 삭제 후 부모테이블 삭제가능하다. DROP TABLE 사용시
참조되어있는 TABLE 들 전부 날린 후 가능하다


CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE CASCADE  -- 삭제정책
);

DELETE FROM account_info WHERE id = 123; -- 자신만 삭제하는 것이 아닌 참조한 부분 전부 삭제시킨다.

CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE SET NULL  -- 삭제정책 2번째
);
 
--- 자신만 삭제하거나 부모걸 참조시켰을 때 삭제되었을 때 위의 삭제정책과 같이 다 지워지는것이 아니라 NULL 값으로 나오게 된다.
```

# CHECK 제약조건
```sql
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE SET NULL,  
    CONSTRAINT PASSWORD_LENGTH_CHK CHECK(LENGTH(PASSWORD) >3) -- 패스워드 제약조건
);
  --CHECK 걸어서 비밀번호 값의 제약범위 설정할 수 있다.

INSERT INTO ACCOUNT_AUTHENTICATION(ID,PASSWORD,ACCOUNT_INFO_ID) VALUES(1, '1234', 123);
SELECT * FROM ACCOUNT_AUTHENTICATION;
-- PSSWORD 설정했을 때 제약조건 걸었기 때문에 3자 밑으로는 삽입했을 때 오류 뜬다.

```
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

## 강사님 정리
# NN 제약조건

두 가지 방법

```sql
-- 제약조건 이름이 없는 경우
CREATE TABLE account_info (
    id NUMBER,
    email VARCHAR2(128) NOT NULL
);

-- 제약조건 이름이 있는 경우
CREATE TABLE account_info (
    id NUMBER,
    email VARCHAR2(128) CONSTRAINT account_info_email_nn NOT NULL
);
```

실제로 테스트 해보기

```sql
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, NULL);
UPDATE account_info SET email = NULL WHERE id = 1;
```

# UQ 제약조건

세 가지 방법

```sql
-- 칼럼 레벨
CREATE TABLE account_info (
    id NUMBER,
    email VARCHAR2(128) UNIQUE
);

-- 칼럼 레벨
CREATE TABLE account_info (
    id NUMBER,
    email VARCHAR2(128) CONSTRAINT account_info_email_uq UNIQUE
);

-- 테이블 레벨
CREATE TABLE account_info(
    id NUMBER,
    email VARCHAR2(128),
    CONSTRAINT account_info_email_uq UNIQUE (email)
)
```

테스트 데이터

```sql
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, 'abcd@gmail.com');
UPDATE account_info SET email = 'abc@gmail.com' WHER
Neoul One님이 모두에게:  11:55 AM

# PK 제약조건

```

```sql
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) UNIQUE
);

CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) UNIQUE
);

CREATE TABLE account_info (
    id NUMBER,
    email VARCHAR2(128) UNIQUE,
    CONSTRAINT account_info_pk PRIMARY KEY (id)
);
```

테스트 데이터

```sql
SELECT * FROM account_info;
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (1, 'abcd@gmail.com');
INSERT INTO account_info(id, email) VALUES (NULL, 'abcd@gmail.com');
```

# FK 제약조건

```sql
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER,
    CONSTRAINT account_info_fk FOREIGN KEY (account_info_id) REFERENCES account_info(id)
);
```

테스트 데이터

```sql
SELECT * FROM account_info;
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
SELECT* FROM account_authentication;
INSERT INTO account_authentication(id, password, account_info_id) VALUES(1, '1234', 1);
INSERT INTO account_authentication(id, password, account_info_id) VALUES(1, '1234', 2);
```

# FK 삭제 정책

```sql

CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL UNIQUE
);
INSERT INTO account_info(id, email) VALUES(1, 'abc@gmail.com');
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL UNIQUE
);
INSERT INTO account_info(id, email) VALUES(1, 'abc@gmail.com');
SELECT * FROM account_info;

CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    account_info_id NUMBER REFERENCES account_info(id)
);
INSERT INTO account_authentication(id, account_info_id) VALUES (1, 1);
INSERT INTO account_authentication(id, account_info_id) VALUES (1, 2);

```

테스트 데이터

```sql
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
```

```sql
-- 테이블 account_info 생성
DROP TABLE account_info CASCADE CONSTRAINTS;
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_email_uq UNIQUE (email),
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
);

-- 값 넣기
INSERT INTO account_info(id, email) VALUES(1, 'abc@gmail.com');
-- 값 확인
SELECT * FROM account_info;

-- 테이블 account_authentication 생성
DROP TABLE account_authentication CASCADE CONSTRAINTS;
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE CASCADE
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
```

# java로 표현했을 시 코드

```java
public class AccountInfo {
    private Long id;
    private String email;
}

public class AccountAuthentication {
    private Long id;
    private String password;
    private Account account;
}
```

# CHECK 조건

-- CHECK 제약조건

```sql
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_email_uq UNIQUE (email),
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
);  --제약조건은 값의 생성이나 수정 시 체크하게 된다.

--check constraint 3자 이상이 아니라 체크조건에 걸려 오류발생
INSERT INTO account_info(id, email) VALUES(1, 'AB'); 
```

# DEFAULT 조건

--default 제약조건

```sql

DROP TABLE account_info CASCADE CONSTRAINTS;
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    CREATED_DATE TIMESTAMP DEFAULT SYSDATE,  --시간 삽입
    GRADE VARCHAR2(126) DEFAULT 'NEW', --GRADE DEFAULT 삽입
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_email_uq UNIQUE (email),
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
);  

-- 값 넣기
INSERT INTO account_info(id, email) VALUES(1, 'ABC@GMAIE.COM'); 
-- 값 확인
SELECT * FROM account_info;

-- 값 확인 시 시간과 GRADE COLUMN 삽입되어 NEW 들어와있는 것 확인할 수 있다.

```

```

CONSTRAINT 제약조건이름 제약조건타입(칼럼)

```