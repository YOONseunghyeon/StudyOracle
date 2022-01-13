--������� ��ȸ�ϴ� ������
SELECT*FROM emp
WHERE sal =5000;

--������ CLERK�� ��� ������
SELECT* FROM emp
WHERE job ='CLERK';

--COMM�� 0�̰ų� NULL�� �������
SELECT* FROM emp
WHERE  comm = 0 OR comm IS NULL;

--���ʽ� NULL�̰� ������ ANALYST�� ����� ������
SELECT* FROM emp
WHERE  comm IS NULL AND job = 'ANALYST';

--PROJECTION ��������

SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30;
      
--����, �ΰ� �̻��� ���̺��� �ϳ��� ���̺�ó�� ��ȸ�ϴ� ���                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
SELECT* FROM emp
 JOIN dept
   ON emp.deptno = dept.deptno;

select*from emp
 JOIN dept                                    
ON emp.deptno = dept.deptno;

--����, �ΰ� �̻��� ���̺��� �ϳ��� ���̺�ó�� ��ȸ�ϴ� ���                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
SELECT* FROM emp
 JOIN dept
   ON emp.deptno = dept.deptno;


--DISTINCT ����
SELECT DISTINCT job FROM emp;

--��Ī(����) ALIAS -�������� desc ASC �������� / DESC ��������
SELECT ename, job, sal , sal*12 AS annsal
 FROM emp
ORDER BY sal DESC  ; 

- �÷��� ���� ������ �����Ѱ� �ƴ϶� ���̺� ���� ��ȯ ����
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
 WHERE sal != 1000; -- <> , != ���� ���� ^= ���� �Ⱦ��Ӥ�

--NOT�� �����ڿ� �����°� �ƴ϶� AND, OR WHERE �����°� 
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
 
 
 --LIKE  ~�Ͱ��� (���� �˻�)
 --������ ����� �� ���ڱ��� __RD �̸� XXRD�� ���(%�� ��ġ�� ����ٸ�) 
 SELECT ename, job, sal , sal*12 AS annsal
 FROM emp 
 WHERE ename LIKE '__RD' ;                     -- J% ,%ER, %E%, __RD


 --NULL �ΰ��� ��õ
SELECT ename, job, sal, comm
FROM emp
WHERE comm IS NULL;
    
 --NULL �ƴѰ��� ����
SELECT ename, job, sal, comm
FROM emp
WHERE comm IS NOT NULL;
    
 --����
 SELECT empno, ename, job FROM emp
 WHERE comm IS NOT NULL
 UNION ALL
 SELECT deptno, dname, loc FROM dept;
 
 
 
 
 
 
 
 
 