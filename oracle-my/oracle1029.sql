오늘한거 다른거 하기귀찮다 하면 이니어조인 외우기 교재 81p

SELECT empno, sal,
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED 
PRECEDING AND UNBOUNDED FOLLOWING) "win1",
-- rows : 부분그룹인 윈도우의 크기를 물리적인 단위로 행집합을 지정
-- unbounded preceding : 윈도우의 첫행
-- unbounded following : 윈도우의 마지막행
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "win2",
-- 윈도우의 시작행에서 현재 위치(current row) 까지의 합계를 구해서 win2에
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) "win3"
-- 현재 위치에서 윈도우의 마지막행까지의 합계를 구해서 win3에
FROM emp
WHERE deptno = 30;
SELECT empno, sal,
SUM(sal) OVER (PARTITION BY deptno
ORDER BY empno
ROWS BETWEEN 1 PRECEDING
AND 1 FOLLOWING) "win1",
-- 1 preceding and 1 following
-- 현재 행을 중심으로 이전행과 다음행의 급여합계
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno
ROWS BETWEEN 1 PRECEDING AND
CURRENT ROW) "win2",
-- 1 preceding and current row
-- 이전행과 현재행의 급여 합계
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno
ROWS BETWEEN CURRENT ROW AND
1 FOLLOWING) "win3"
-- current row and 1 following
-- 현재 행과 다음행의 합계
FROM emp
WHERE deptno = 30;


SELECT  ename, deptno, sal,
LAG(sal, 1, 0) OVER (ORDER BY sal) 이전값,
-- 1 : 위의 행값, 0 : 이전행이 없으면 0 처리함
LAG(sal, 1, sal) OVER (ORDER BY sal) "조회2",
-- 이전행이 없으면 현재 행의 값을 출력
LAG(sal, 1, sal) OVER (PARTITION BY deptno
ORDER BY sal) "조회3"
-- 부서 그룹안에서의 이전 행값 출력
FROM emp;

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

-- 기억하기!!!!!!!!!
UNION ALL : 중복이 제거되서 
