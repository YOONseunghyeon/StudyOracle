/*
문제
상품분류명, 상품명, 상품색상,매입수량,주문수량,거래처명을 조회하세요...
단, 상품분류 코드가 'P101','P201','P301' 인 것들에 대해 조회하고,
매입수량이 15개 이상인 것들과, '서울'에 살고있는 회원 중에 생일이 1974년 생인 사람들에 대해 조회해주세요.
정렬은 회운아이디를 기준으로 내림차순, 매입수량을 기준으로 내림차순해주세요.
*/
select lp.lprod_nm,
        p.prod_name,
        p.prod_color,
        c.cart_qty,
        u.buy_qty,
        b.buyer_name
from lprod lp, prod p, buyer b, member m, buyprod u, cart c
where lp.lprod_gu = p.prod_lgu
and p.prod_buyer = b.buyer_id
and p.prod_id = u.buy_prod
and c.cart_prod=p.prod_id
and c.cart_member = mem_id
and lp.lprod_GU  IN ('P101', 'P201','P301')
and u.buy_qty >= 15
and substr(m.mem_add1,1,2)= '서울'
and to_char(m.mem_bir,'YY')='74'
order by mem_id desc , buy_qty desc;






---전체 분류의 상품자료 수를 검색 조회
--(alias는 분류코드,분류명, 상품자료수)


--1 . 분류테이블조회
select * from lprod;
--2.일반 join
select lprod_gu,
        lprod_nm,
        count(prod_lgu)
    from lprod, prod
    where lprod_gu = prod_lgu
    group by lprod_gu, lprod_nm;
--3.outerjoin사용확인
select lprod_gu ,lprod_nm,
        count(prod_lgu)
    from lprod,prod
    where lprod_gu = prod_lgu(+)
    group by lprod_gu,lprod_nm
    order by lprod_gu;

--ansi 형식
/* 모든 행이 검색되어야 할 테이블의 위치를 기준으로 한다.
위치에 따라서 left, rigrt, full로 나눈다
(+) 보다 명확하게 결과가 나온다
(+)가 지원하지 못하는 full outer join이 된다.
*/
--ansi outer join--
select lprod_gu 분류코드, lprod_nm 분류명,
count(prod_lgu) 상품자료수
from lprod
    left outer join prod on (lprod_gu = prod_lgu)
group by lprod_gu, lprod_nm
order by lprod_gu;

--전체 상품의 2005년 1월 입고 수량을 검색 조회
--(alias는 상품코드, 상품명, 입고수량)
--1.일반 join
select prod_id,
        prod_name,
        sum(buy_qty)
    from prod,buyprod
    where prod_id = buy_prod
    and buy_date between '2005-01-01'and'2005-01-31'
    group by prod_id, prod_name;
    
-- outer join  사용확인
select prod_id,
        prod_name,
        sum(buy_qty)
    from prod,buyprod
    where prod_id =buy_prod(+)
    and buy_date between '2005-01-01'and'2005-01-31'
    group by prod_id, prod_name
    order by prod_id, prod_name;
    
--2번 쿼리는 전체상품의 결과가 조회되지 않았다,
--서브쿼리를 사용하거나 ansi조인을 사용하여 해결 해야 한다.
--3 ANSI OUTER JOIN 
    select prod_id,
            prod_name,
            sum(buy_qty)
        from prod left outer join buyprod
        on(prod_id = buy_prod
            and buy_date between '2005-01-01'and'2005-01-31')
            group by prod_id, prod_name
    order by prod_id, prod_name;
            
--4. outer join 사용 확인 ( NULL값 제거)
Select prod_id 상품코드,
        prod_name 상품명,
        sum(nvl(buy_qty,0)) 입고수량
    From prod Left outer join buyprod
             on( prod_id = buy_prod
             And buy_date Between '2005-01-01' and '2005-01-31')
        group by prod_id, prod_name
    order by prod_id, prod_name;
    
-- 전체 회원의 2005년 4월의 구매현황 조회(회원id,성명,구매수량의 합)
--일반join
select mem_id,
        mem_name,
        sum(cart_qty)
    from member,cart
    where mem_id = cart_member
    and substr(cart_no,1,6) ='200504'
    group by mem_id,mem_name
    order by mem_id,mem_name;

--left outer join
select mem_id,
        mem_name,
        sum(cart_qty)
    from member left outer join cart
    on(mem_id = cart_member
    and substr(cart_no,1,6) ='200504')
   group by mem_id,mem_name
    order by mem_id,mem_name;
    
    
    
    
--join group by
/*2005년도 월별 매입 현황을 검색하시오 
매입월, 매입수량, 매입금액(매입수량*상품테이블 매입가)*/
select to_char(buy_date,'MM')매입월,
sum(buy_qty)매입수량,
to_char(sum(buy_qty*prod_cost),'L999,999,999')매입금액
from buyprod,prod
where buy_prod=prod_id
and extract(year from buy_date) = 2005
group by to_char(buy_date,'MM')
order by 매입월 asc;

--2005년도 월별 판매 현황을 검색하시오
--(alias는 판매월,판매수량,판매금액(판매수량*상품테이블의 판매가)
SELECT  SUBSTR(cart_no,5, 2) 판매월,
            sum(cart_qty) 판매수량,
            TO_CHAR(sum(cart_qty *prod_sale),'999,999,999') 판매가
FROM prod P INNER JOIN cart C
                    ON( prod_id = cart_prod)
                    and substr(cart_no,1,4) ='2005'
GROUP BY  SUBSTR(cart_no,5,2);

select substr(cart_no, 5, 2) 매입월,
        sum(cart_qty) 판매수량,
        sum(cart_qty*prod_sale) 판매금액
        from cart,prod
        where prod_id=cart_prod
group by substr(cart_no, 5, 2);

--상품분류가 컴퓨터제품('P101')인 상품의 2005년도 일자별 판매 조회
--(판매일, 판매금액(5,00,000 초과의 경우만), 판매수량)
--HAVING을 이용하여 해당 조회
select substr(cart_no,1,8) "판매일",
        sum(cart_qty * prod_sale) "판매금액",
        sum(cart_qty) "판매수량"
        from prod,cart
        where cart_no like '2005%'
        and prod_id =cart_prod
        and prod_lgu = 'P101'
        group by substr (cart_no,1,8)
        having sum(cart_qty * prod_sale)>5000000
        order by substr(cart_no,1,8);
        
        
        
--서브쿼리
/* SQL 구문 안에 또 다른 select 구문이 있는 것을 말한다.
Subquery가 없다면 SQL구문은 너무 많은 join 을 해야하거나 구문이 복잡해진다.
subquery는 괄호로 묶는다.
연산자를 사용시 오른쪽에 배치
from절에 사용하는 경우 view와 같이 독립된 테이블처럼 활용되어 inline view라고 부른다
main query와 sub query사이의 참조성 여부에 따라
연관, 비연관 서브쿼리로 구분
반환하는 행의 수, 컬럼수에 따라 단일행/다중행, 단일컬럼/다중컬럼으로 구분.
대체적으로 연산자의 특성을 이해하면 쉽다.
*/
