--주석, 아래의 Select 구문을 실행
SELECT*FROM emp;

--컬럼을 구분해서 select
SELECT ename ,job,hiredate
FROM emp;

--부서명만 출력 (데이터 중복제외)
SELECT DISTINCT deptno
FROM emp;
--원하는 컬럼의 데이터를 제거할때 DISTINCT사용 즉 사원번호는 중복이 안돼므로 중복되는 데이터 가없음
SELECT DISTINCT empno,deptno
FROM emp;

--2개의 열이 다 같아야지 데이터 중복제거
SELECT DISTINCT JOB,deptno
FROM emp;

--조건절   where
SELECT*FROM emp
Where empno = 7499;

SELECT*FROM emp
WHERE  ename = '홍길동';

SELECT * FROM emp
WHERE job = 'CLERK';

SELECT* FROM emp
WHERE sal >=1500 
    