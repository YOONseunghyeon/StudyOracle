/*
문제. 
회원정보 중에 구매내역이 있는 회원에 대한 회원아이디, 회원이름, 생일(0000-00-00 형태)을 조회해 주세요
정렬은 생일을 기준으로 오름차순 해 주세요
*/
select mem_id, mem_name, to_char(mem_bir,'YYYY-MM-DD')
from member
where not mem_id in (select cart_member from cart)

order by to_char(mem_bir,'YYYY-MM-DD') asc;

-- 한개의 테이블 조회
select prod_id, prod_name, prod_lgu
    from prod
        where exists (select lprod_gu
                    from lprod
                    where lprod_gu = prod.prod_lgu
                    and lprod_gu = 'P301');
                    
--Table join
-- cross 조인
--일반방식
select m.mem_id, c.cart_member, p.prod_id
from member m, cart c, prod p, lprod lp, buyer b;

select count(*)
from member m, cart c, prod p, lprod lp, buyer b;

--[국제표준방식]
Select *
From member cross join cart 
             cross join prod    
             cross join lprod
             cross join buyer;

/*상품테이블에서 상품코드, 상품명, 분류명을 조회..
 상품테이블 : prod
 분류테이블 : lprod
 */
 --일반상식
 select p.prod_id, p.prod_name, lp.lprod_nm
 from prod p, lprod lp
 where p.prod_lgu = lp.lprod_gu;
 
 -- 국제표준방식
  select prod.prod_id, prod.prod_name, lprod.lprod_nm
  from prod inner join lprod
  on(prod.prod_lgu = lprod.lprod_gu);
  
--alias 사용한 방법
select A.prod_id "상품코드",
        A.prod_name "상품명",
        B.lprod_nm "분류명",
        C.buyer_name "거래처명"
        from prod A, lprod B, buyer C
        Where A.prod_lgu = B.lprod_gu
        and A.prod_buyer = C.buyer_id;
        
--국제표준방식
select A.prod_id "상품코드",
        A.prod_name "상품명",
        B.lprod_nm "분류명",
        C.buyer_name "거래처명"
        from prod A inner join lprod B
        on(A.prod_lgu = B.lprod_gu)
      inner join buyer C
        on(A.prod_buyer = C.buyer_id);

/*
문제
회원이 구매한 거래처 정보를 조회하려고 합니다.
회원아이디, 회원이름, 상품거래처명,
상품분류명을 조회해주세요
*/
select m.mem_id, 
        m.mem_name,
        b.buyer_name,
        lp.lprod_gu
from member m, buyer b,cart c,prod p, lprod lp
where m.mem_id = c.cart_member
and  c.cart_prod = p.prod_id
and p.prod_lgu = b.buyer_lgu
and b.buyer_lgu = lp.lprod_gu;

 --국제표준방식       
select m.mem_id, 
        m.mem_name,
        b.buyer_name,
        lp.lprod_gu
 from member m inner join cart c
 on(m.mem_id = c.cart_member)
 inner join prod p
 on( c.cart_prod = p.prod_id)
 inner join buyer b
on(  p.prod_lgu = b.buyer_lgu)
inner join lprod lp
on(b.buyer_lgu = lp.lprod_gu);

/*
문제
거래처가 '삼성전자' 인 자료에 대한 상품코드, 상품명, 거래처명을 조회하려고 합니다.
*/
select p.prod_id 상품코드, 
        p.prod_name 상품명, 
        b.buyer_name 거래처명
from prod p, buyer b
    where p.prod_buyer = b.buyer_id
        and b.buyer_name = '삼성전자';

select p.prod_id 상품코드, 
        p.prod_name 상품명, 
        b.buyer_name 거래처명
from prod p inner join buyer b 
    on(p.prod_buyer = b.buyer_id)
    and b.buyer_name = '삼성전자';
    
-- 상품테이블에서 상품코드, 상품명, 분류명, 거래처명, 거래처주소를 조회.
--1. 판매가격이 10만원 이하이고
--2. 거래처주소가 부산인 경우만 조회
select p.prod_id, p.prod_name, lp.lprod_nm, b.buyer_name, b.buyer_add1
from prod p, lprod lp, buyer b
where p.prod_buyer = b.buyer_id
and b.buyer_lgu=lp.lprod_gu
and p.prod_sale <=100000
and b.buyer_add1 like '%부산%';

/*
문제. 상품분류코드가 p101인것에 대한
상품분류명, 상품아이디, 판매가, 거래처담당자, 회원아이디, 주문수량 조회
단, 상품분류명을 기준을 내림차순, 상품아이디를 기준으로 오름차순
일반/표준 모두
*/
select lp.lprod_nm,
        p.prod_id ,
        p.prod_sale,
        b.buyer_charger,        
        m.mem_id,
        c.cart_qty
    from prod p, buyer b , lprod lp, member m, cart c
        where m.mem_id = c.cart_member
        and c.cart_prod = p.prod_id
        and p.prod_buyer=b.buyer_id
        and p.prod_lgu=lp.lprod_gu
        and lp.lprod_gu='P101';
        