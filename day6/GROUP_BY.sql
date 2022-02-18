/*
구매내역(장바구니)정보에서 회원아이디별로 주문[수량]에 대한
평균을 조회해 주세요..
회원아이디를 기준으로 내림차순해 주세요..
*/
select  cart_member, avg(cart_qty) avg_qty
from cart
group by cart_member
order by cart_member desc;

/*
문제.
상품정보에서 판매가격의 평균 값을 구해주세요.
단, 평균값은 소수점 2째자리까지 표현해주세요.
*/
select round(avg(prod_sale),2) as avg_sale
from prod;
/*
문제.
상품정보에서 상품분류별 판매가격의 평균값을 구해주세요.
조회 컬럼은 상품분류코드, 상품분류별 판매가격의 평균
단, 평균값은 소수점 2째자리 까지 표현해 주세요.
*/
select prod_lgu, round(avg(prod_sale),2) as avg_sale
from prod
group by prod_lgu;

-- 회원테이블의 취미종류수를 count 집계 하시오 ( alias는 취미 종류수)
select count(distinct mem_like)취미종류수 from member;
--회원테이블의 취미별 count집계 하시오(alias는 취미, 자료수, 자료수(*))
select mem_like 취미, 
count(mem_like) 자료수 , count(*)"자료수(*)"
from member
group by mem_like;
--회원테이블의 직업종류수를 count집계하시오 (alias는 직업 종류수)
select mem_job, count(mem_job) 직업종류수
from member
group by mem_job
order by count(mem_job) desc;
/*
문제.
회원 전체의 마일리지 평균보다 큰 회원에 대한 아이디, 이름, 마일리지를 조회해 주세요.
정렬은 마일리지가 높은 순으로..
*/
select mem_id, mem_name, mem_mileage
from member
where mem_mileage>(select avg(mem_mileage) from member)
order by mem_mileage desc;
/* 장바구니테이블의 회원별 최대구매수량을 검색하시오
 회원id, 최대수량, 최소수량*/
 select cart_member 회원id,
         max(distinct cart_qty) "최대수량(distinct)",
        max(cart_qty)최대수량,
        min(distinct cart_qty)"최소수량(distinct)",
         min(cart_qty)최소수량
    from cart
    group by cart_member;
--오늘이 2005년 7월11일이라 가정하고 장바구니 테이블에서 발생될 추가주문번호를 검색하시오
--(alias는 현재년월일 기준 가장 높은 주문번호, 추가주문번호)
select max(cart_no), max(cart_no )+1
from cart
where cart_no like '20050711%';
/*
문제.
구매정보에서 년도별로 판매된 상품의 갯수,
평균구매수량을 조회하려고 합니다.
정렬은 년도를 기준ㅇ로 내림차순해주세요.
*/
select substr(cart_no,1 ,4 ) as yyyy,
        sum(cart_qty) as sum_qty,
        avg(cart_qty) as avg_qty
from cart 
group by substr(cart_no,1 ,4 ) 
order by yyyy desc;
/*
문제.
구매정보에서 년도별, 상품분류코드별로 상품의 갯수를 조회하려고 합니다.(상품의 갯수는 count)
정렬은 년도를 기준으로 내림차순해주세요
*/
select substr(cart_no,1 ,4 ) as sub_no, 
        substr(cart_prod,1 ,4 ) as 상품분류코드,
        count(cart_prod) as count_qty
from cart
group by substr(cart_no,1 ,4 ) ,substr(cart_prod,1 ,4 )
order by  count_qty desc;

--장바구니테이블의 상품분류별 판매수량의 합계 값 (alias는 상품, 판매수량합계)
select substr(cart_prod,0,4) 상품분류,
        sum(cart_qty) "판매수량 합계"
from cart
group by substr(cart_prod,0,4);

-- 회원테이블의 회원전체의 마일리지 평균, 마일지리 합계, 최고 마일리지, 최소 마일리지, 인원수를 검색하시오
--(alias는 마일리지 평균, 마일리지 합계 , 최고마일리지, 최소마일리지, 인원수)
select avg(mem_mileage), sum(mem_mileage), max(mem_mileage),min(mem_mileage)
from member;

--상품테이블 상품분류별 판매가전체의 평균,합계,최고값,최저값, 자료 수를 검색하시오
--(alias는 평균, 합계, 최고값, 최저값, 자료수 )
-- 조건 자료수가 
select prod_lgu, 
        round(avg(prod_sale),2) avg,
        sum(prod_sale) sum,
        max(prod_sale) max, 
        min(prod_sale) min, 
        count(prod_sale) count        
from prod
group by prod_lgu
having count(prod_sale)>=20;

/*
Where 절 : 일반조건만 사용
Having 절 : HAVING 절: 그룹조건만 (그룹함수를 사용한  조건처리)
*/
/*
회원테이블에서 지역(주소1의2자리),생일년도별로 마일리지 평균, 마일리지 합계, 최고마일리지, 최소마일리지, 자료수 를 검색하시오?
(alias는 지역, 생일연도,마일리지평균, 마일리지 합계, 최고마일리지, 최소마일리지, 자료수
*/
select substr(mem_add1,1,2) 지역,
         to_char(mem_bir,'yyyy') 생일연도,
        avg(mem_mileage) 마일리지평균,
        sum(mem_mileage) 마일리지합계,
        max(mem_mileage)마일리지최고,
        min(mem_mileage)마일리지최소,
        count(mem_mileage) 자료수
from member
group by substr(mem_add1,1,2),
            to_char(mem_bir,'yyyy');
            
--거래처 담당자 성씨가 '김' 이면 NULL로 갱신
UPDATE buyer set buyer_charger = NULL
WHERE buyer_charger like '김%';
--거래처 담당자가 성씨가 '성' 이면 white space로 갱신
update buyer set buyer_charger = ' '
where buyer_charger like '성%';

-- null을 이용 null 값 비교
Select buyer_name 거래처, buyer_charger 담당자
From buyer
where buyer_charger = Null;


Select buyer_name 거래처, buyer_charger 담당자
From buyer
where buyer_charger is null;

Select buyer_name 거래처, buyer_charger 담당자
From buyer
where buyer_charger is not null;

-- null이 존재하는 상태로 조회
Select buyer_name 거래처, buyer_charger 담당자
From buyer;

--회원마일리지에 100을 더한 수치를 검색하시오
--(NVL 사용, Alias는 성명, 마일리지, 변경마일리지)
select mem_name 성명, mem_mileage  마일리지, (nvl(mem_mileage,0)+100)  변경마일리지
from member;

-- 회원 마일리지가 있으면 '정상 회원' , null 이면 '비정상 회원' 으로 검색하시오
--(nvl2 사용, alias는 성명, 마일리지, 회원상태)
select mem_name 성명, mem_mileage  마일리지, nvl2(mem_mileage,'정상','비정상')  회원상태
from member;

select decode(9,10,'A',9,'B',8,'C','D')
FROM DUAL;
select decode(substr(prod_lgu,1,2),
        'P1','컴퓨터/전자 제품',
        'P2',' 의류',
        'P3', '잡화', '기타')
        from prod;
--상품 분류중 앞의 두 글자가 'P1'이면 판매가를 10%인상하고 'P2'이면 판매가를 15%인상하고,나머지는 동일판매가로 검색하시오?
--(DECODE 함수사용, ALIAS는 상품명,판매가,변경판매가)
Select prod_name, prod_sale,
decode(substr(prod_lgu,1,2),
'P1',prod_sale*(110/100),
'P2',prod_sale*(115/100)) new_sale
FROM prod;

--회원정보테이블의 주민등록 뒷자리 (7자리 중 첫째자리)에서 성별 구분을 검색하시오
--(case 구문 사용, alias는 회원명, 주민등록번호 (주민1-주민2), 성별)
select mem_name 회원명, 
mem_regno1||'-'|| mem_regno2 주민등록번호,
decode(substr(mem_regno2,1,1), 
'1','남자',
'2','여자') 성별
from member;
select mem_name 회원명, 
(mem_regno1 ||'-'||  mem_regno2) 주민등록번호,
case
when substr(mem_regno2,1,1) =1
then '남자'
else '여자'
end as 성별
from member;