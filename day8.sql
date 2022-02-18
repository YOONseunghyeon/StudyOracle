-- 테이블 생성하기
Create Table lprod(
    lprod_id number(5)  Not Null,
    lprod_gu char(4) Not Null,
    lprod_nm varchar2(40)Not Null,
    CONSTRAINT pk_lprod Primary Key (lprod_gu)
);

--조회하기
SELECT lprod_id, lprod_gu,lprod_nm
FROM lprod ;

-- 데이터 입력하기.
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P101' ,  '컴퓨터제품'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P102' ,  '전자제품'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P201' ,  '여성케쥬얼'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P202' ,  '남성케쥬얼'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P301' ,  '피혁잡화'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P302' ,  '화장품'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P401' ,  '음반/CD'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P402' ,  '도서'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P403' ,  '문구류'
);

--상품분류정보에서 상품분류코드의 값이
-- P201인 데이터를 조회해 주세요..
SELECT *
From lprod
--조건추가
WHERE LPROD_GU> 'P201';
 
 -- 상품분류코드가 P102에 대해서
 -- 상품분류명의 값을 향수로 수정해 주세요....
 SELECT * 
 FROM LPROD
 WHERE LPROD_GU = 'P102';
 
 UPDATE LPROD
      SET LPROD_NM='향수'
WHERE LPROD_GU = 'P102';

--상품분류코드가 'P202' 대한 데이터를 
--삭제해 주세요

 SELECT * 
 FROM LPROD
 WHERE LPROD_GU = 'P202';
 
 DELETE from lprod
 where LPROD_GU='P202';

COMMIT;
 
-- 테이블 생성하기
Create Table buyer(
    buyer_id char(6)  NOT NULL,                        --거래처코드
    buyer_name VARCHAR2(40) NOT NULL,         -- 거래처명
    buyer_lgu char(4) Not Null,                        --취급상품 대분류
    buyer_bank varchar2(60),                           --은행
    buyer_bankno varchar2(60),                        --계좌번호
    buyer_bankname varchar2(15),                   -- 예금주
    buyer_zip char(7),                                    --우편번호
    buyer_add1 varchar2(100),                        --주소1
    buyer_add2 varchar2(70),                         --주소2
    buyer_comtel varchar2(14) NOT NULL ,          --전화번호
    buyer_fax  varchar2(20) NOT NULL                 --FAX 번호
);

alter table buyer  ADD(buyer_mail varchar2(60) NOT NULL,
                                        buyer_charger varchar2(20),
                                        buyer_telext varchar2(2) );
alter table buyer MODIFY(buyer_name varchar(60) );                         
alter table buyer
    ADD( CONSTRAINT pk_buyer Primary Key (buyer_id),
            CONSTRAINT fr_buyer_lprod Foreign Key (buyer_lgu)
                                              References lprod(lprod_gu) );

 






