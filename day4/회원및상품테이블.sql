/*
lprod : 상품분류정보
prod: 상품정보
buyer: 거래처 정보
member: 회원 정보
cart: 구매 정보
buyprod: 입고상품정보
remain: 재고 수불정보 
 */
SELECT mem_id,mem_name
FROM member;
SELECT PROD_ID, PROD_NAME
FROM PROD;

SELECT mem_mileage, mem_mileage/12 as mem_12
FROM member;


SELECT PROD_ID , PROD_NAME , PROD_sale*55 as PROD_sale
FROM PROD;
--상품 테이블의 상품분류를 중복되지 않게 검색
SELECT  PROD_LGU FROM PROD;
SELECT DISTINCT PROD_LGU FROM PROD;

--데이터 정렬
--회원테이블에서 회원ID,회원명 , 생일 , 마일리지 검색
  SELECT mem_id, mem_name, mem_bir, mem_mileage
  from member
  order by mem_id ASC;
  
  SELECT mem_id as id, mem_name as nm,
  mem_bir 생일, mem_mileage 마일리지
  from member
  order by ID ASC;
  
  SELECT mem_id, mem_name, mem_bir, mem_mileage
    from member
  order by 3;
 --상품 중 판매가가 170,000원인 상품 조회 
  SELECT  PROD_NAME 상품, PROD_SALE 판매가
  FROM PROD
  WHERE PROD_SALE = 170000;
-- 상품 판매가격이 170,00원을 아닌
--상품아이디와 상품명 조회
SELECT  PROD_ID 상품코드, PROD_NAME 상품명,PROD_SALE 상품가격
  FROM PROD
  WHERE PROD_SALE !=170000;
---- 상품 판매가격이 170,00원을 초과하는
--상품아이디와 상품명 조회
  SELECT  PROD_ID 상품코드, PROD_NAME 상품명,PROD_SALE 상품가격
  FROM PROD
  WHERE PROD_SALE !=170000;
-- 상품중에 매입가격깅 200,000원 이하인 
--상품검색.. 단 , 상품코드를 기준으로 내림차순
-- 조회 컬럼은 상품명 , 매입가격, 상품명
SELECT PROD_NAME 상품명 , PROD_COST 매입비용
FROM PROD 
WHERE (PROD_COST <=200000 ) 
order by 매입비용 desc;

--회원중에 76년도 1월 1일 이휴ㅜ에 태어난
--회원아이디, 회원이름,주민등록번호 앞자리 조회
--단, 회원아이디 기준 오름차순
SELECT mem_id , mem_name, mem_regno1
FROM member
where (mem_regno1 >760101)
order by mem_id asc;
  
--상품 중 상품분류가 P201(여성 캐쥬얼)이고 판매가가 170,000원인 상품 조회
SELECT prod_name 상품, prod_lgu 상품분류, prod_sale 판매가 FROM prod
WHERE prod_lgu = 'P201'
AND prod_sale = 170000;

--상품중 상품분류가 P201(여성 캐쥬얼)도 아니고 판매가가 170.000원도 아닌 상품조회
SELECT prod_name 상품, prod_lgu 상품분류, prod_sale 판매가 
FROM prod
WHERE NOT( prod_lgu = 'P201' OR prod_sale=170000) ;

--상품중 판매가가300,000원 이상 , 500,000운 이하인 상품을 검색하시오
--ALIAS는 상품코드, 상품명, 판매가
SELECT prod_id 상품코드, prod_name 상품명, prod_sale 판매가
FROM prod
WHERE  prod_sale>=300000 and prod_sale <=500000;

/*
상품중에 판매가격이 15만원,17만원,33만원인 상품정보 조회,
상품코드, 상품명, 판매가격 조회 
정렬은 상품명을 기준으로 오름차순..
*/
SELECT prod_id 상품코드, prod_name 상품명, prod_sale 판매가
FROM prod
WHERE  prod_sale=150000 OR prod_sale =170000 OR prod_sale =330000 
ORDER BY PROD_NAME ASC;
/*
회원 중에 아이디가 C001, F001, W001 회원조회
회원아이디, 회원 이름 조회..
정렬은 주민번호 앞자리를 기준으로 내림차순
*/
SELECT MEM_ID, MEM_NAME, mem_regno1
FROM MEMBER
WHERE MEM_ID = 'c001' OR MEM_ID =' f001' OR  MEM_ID = 'w001'
ORDER BY mem_regno1 DESC;