/*
[문제 만들기]
주소지가 대전인 거래처 담당자가 담당하는 상품을 
구매하지 않은 대전 여성 회원 중에 2월에 결혼기념일이 있는
회원 아이디, 회원 이름 조회 
이름 오름차순 정렬
*/
select m.mem_id,
        m.mem_name
    from member m
    where m.mem_id in(
    select c.cart_member
    from buyer b , prod p, cart c
    where c.cart_prod = p.prod_id
    and p.prod_buyer = b.buyer_id
    and substr(b.buyer_add1,1,2)!='대전')
    and substr(m.mem_regno2,1,1)=2
    and substr(m.mem_add1,1,2)='대전'
    and m.mem_memorial = '결혼기념일'
    and to_char (m.mem_memorialday,'MM')=02;