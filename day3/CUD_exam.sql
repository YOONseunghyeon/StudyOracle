--������ �Է� INSERT
INSERT INTO BONUS
        ( ename
        , job
        , sal
        , comm)
VALUES
         ( 'JACK'
        , 'SALESMAN'
        , 4000
        , NULL) ;        
    
COMMIT ;      --��������      
ROLLBACK;     -- ���


--TEST ���̺� �Է�����
INSERT INTO TEST
        ( idx, title, descs )  
VALUES
        ( 1, '��������' , NULL ) ;
        
 INSERT INTO TEST
        ( idx, title, descs )  
VALUES
        ( 2, '��������2' , '���볻�볻��' ) ;

 INSERT INTO TEST
        ( idx, title, descs, regdate )  
VALUES
        ( 3 , '��������3' , '���볻�볻��3' , SYSDATE ) ;

 INSERT INTO TEST
        ( idx, title, descs ,regdate )  
        VALUES
        ( 4, '��������4' , '���볻�볻��4' , TO_DATE('2021-12-31' , 'yyyy-mm-dd')  ) ;
        
COMMIT ;      --��������      
ROLLBACK;     -- ���

--������
SELECT SEQ_TEST. CURRVAL FROM dual ;       --���� ���ڸ� �˰���� �� CURRVAL
        
        
INSERT INTO TEST
        ( idx, title, descs, regdate )  
VALUES
        ( SEQ_TEST.NEXTVAL , '��������7' , '���볻�볻��7' , SYSDATE ) ;        --�������� �ڵ����� �� NEXTVAL
       
        
INSERT INTO TEST
        ( idx, title, descs, regdate )  
VALUES
        ( SEQ_STR.NEXTVAL , '��������102' , '���볻�볻��102' , SYSDATE ) ;         
COMMIT ;        
        
--UPDATE        
UPDATE test 
       SET title = ' ��������� '
          ,  descs = ' ������ ����˴ϴ� '
WHERE idx = 100;     
COMMIT ;


--DELETE
DELETE FROM test
WHERE idx = 100 ;


--�������� SELECT���� ���
SELECT ROWNUM, su. ename, su.  job, SU. SAL, su. comm FROM (
        SELECT ename, job, sal, comm  FROM emp
         ORDER BY sal DESC
) su
WHERE ROWNUM = 1;

