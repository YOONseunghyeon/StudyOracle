--행단위로 조회하는 셀렉션
SELECT*FROM emp
WHERE sal =5000;
--직업이 CLERK인 사람 셀렉션
SELECT* FROM emp
WHERE job ='CLERK';
--COMM이 0이거나 NULL인 사람추출
SELECT* FROM emp
WHERE  comm = 0 OR comm IS NULL;
--보너스 NULL이고 직업이 ANALYST인 사람만 셀렉션
SELECT* FROM emp
WHERE  comm IS NULL AND job = 'ANALYST';

--PROJECTION 프로젝션

SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30;
      
--조인, 두개 이상의 테이블을 하나의 테이블처럼 조회하는 방법                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
SELECT* FROM emp
 JOIN dept
   ON emp.deptno = dept.deptno;

select*from emp
 JOIN dept                                    
ON emp.deptno = dept.deptno;

--조인, 두개 이상의 테이블을 하나의 테이블처럼 조회하는 방법                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
SELECT* FROM emp
 JOIN dept
   ON emp.deptno = dept.deptno;


--DISTINCT 복습
SELECT DISTINCT job FROM emp;

--별칭(별명) ALIAS -내림차순 desc ASC 오름차순 / DESC 내림차순
SELECT ename, job, sal , sal*12 AS annsal
 FROM emp
ORDER BY sal DESC  ; 

- 컬럼만 별명 변경이 가능한게 아니라 테이블도 별명 변환 가능
select e.empno, e.ename, e.job, e.hiredate, e.sal, d.deptno, d.dname
FROM emp e
 JOIN dept  d                                    
ON e.deptno = d.deptno;
 





--WHERE
SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE sal* 12 >= 10000;

SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE sal != 1000; -- <> , != 많이 쓰임 ^= 거의 안쓰임ㅁ

--NOT은 연산자에 붙히는게 아니라 AND, OR WHERE 붙히는거 
SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE NOT sal = 1000;

SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE sal IN (800, 1600, 5000);



SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE sal = 800 OR sal = 1600 OR sal = 5000; 

--BETWEEN A AND B
SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE sal >=1600 AND sal <= 2975 
 
 SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE sal  BETWEEN 1600 AND 2975; 
 
 
 --LIKE  ~와같은 (조건 검색)
 --J 가 들어가는 이름 추출
 SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE ename LIKE 'J%';
 
 
 
 
 
 
 
 
 