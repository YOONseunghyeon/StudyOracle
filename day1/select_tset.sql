--�ּ�, �Ʒ��� Select ������ ����
SELECT*FROM emp;

--�÷��� �����ؼ� select
SELECT ename ,job,hiredate
FROM emp;

--�μ��� ��� (������ �ߺ�����)
SELECT DISTINCT deptno
FROM emp;
--���ϴ� �÷��� �����͸� �����Ҷ� DISTINCT��� �� �����ȣ�� �ߺ��� �ȵŹǷ� �ߺ��Ǵ� ������ ������
SELECT DISTINCT empno,deptno
FROM emp;

--2���� ���� �� ���ƾ��� ������ �ߺ�����
SELECT DISTINCT JOB,deptno
FROM emp;

--������   where
SELECT*FROM emp
Where empno = 7499;

SELECT*FROM emp
WHERE  ename = 'ȫ�浿';

SELECT * FROM emp
WHERE job = 'CLERK';

SELECT* FROM emp
WHERE sal >=1500 
    