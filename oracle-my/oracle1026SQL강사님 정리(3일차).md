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
