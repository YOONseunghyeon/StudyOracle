--데이터 입력 INSERT
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
    
COMMIT ;      --완전저장      
ROLLBACK;     -- 취소


--TEST 테이블 입력쿼리
INSERT INTO TEST
        ( idx, title, descs )  
VALUES
        ( 1, '내용증명' , NULL ) ;
        
 INSERT INTO TEST
        ( idx, title, descs )  
VALUES
        ( 2, '내용증명2' , '내용내용내용' ) ;

 INSERT INTO TEST
        ( idx, title, descs, regdate )  
VALUES
        ( 3 , '내용증명3' , '내용내용내용3' , SYSDATE ) ;

 INSERT INTO TEST
        ( idx, title, descs ,regdate )  
        VALUES
        ( 4, '내용증명4' , '내용내용내용4' , TO_DATE('2021-12-31' , 'yyyy-mm-dd')  ) ;
        
COMMIT ;      --완전저장      
ROLLBACK;     -- 취소

--시퀀스
SELECT SEQ_TEST. CURRVAL FROM dual ;       --현재 숫자를 알고싶을 때 CURRVAL
        
        
INSERT INTO TEST
        ( idx, title, descs, regdate )  
VALUES
        ( SEQ_TEST.NEXTVAL , '내용증명7' , '내용내용내용7' , SYSDATE ) ;        --다음숫자 자동생성 시 NEXTVAL
       
        
INSERT INTO TEST
        ( idx, title, descs, regdate )  
VALUES
        ( SEQ_STR.NEXTVAL , '내용증명102' , '내용내용내용102' , SYSDATE ) ;         
COMMIT ;        
        
--UPDATE        
UPDATE test 
       SET title = ' 내용증명요 '
          ,  descs = ' 내용이 변경됩니다 '
WHERE idx = 100;     
COMMIT ;


--DELETE
DELETE FROM test
WHERE idx = 100 ;


--서브쿼리 SELECT에서 사용
SELECT ROWNUM, su. ename, su.  job, SU. SAL, su. comm FROM (
        SELECT ename, job, sal, comm  FROM emp
         ORDER BY sal DESC
) su
WHERE ROWNUM = 1;

