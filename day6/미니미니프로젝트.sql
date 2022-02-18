/*
오철희가 산 물건 중 TV 가 고장나서 교환받으려고 한다
교환받으려면 거래처 전화번호를 이용해야 한다.
구매처를 조회하고 어디로 전화해야 하는지 전화번호를 구하시오. 
*/
SELECT buyer_name, buyer_comtel
FROM buyer
WHERE buyer_id IN ( 
            SELECT prod_buyer
            FROM prod
            WHERE prod_id IN( 
                            SELECT cart_prod
                            FROM cart
                            WHERE cart_member IN(
                                    SELECT mem_id
                                    FROM member
                                    WHERE mem_name = '오철희'))
            AND prod_name = '삼성 칼라 TV 53인치');
            where substr(mem_add1,1,2) = '대전' and substr(mem_regno1,1,2)>'73'
            
/*대전에 사는 73년이후에 태어난 주부들중 2005년4월에 구매한 물품을 조회하고, 
그상품을 거래하는 각거래처의 계좌 은행명과 계좌번호를 뽑으시오.
(단, 은행명-계좌번호).*/
SELECT buyer_bank ||'-'||buyer_bankno as bankno
    FROM buyer
    WHERE buyer_id IN(
        SELECT prod_buyer
        FROM prod
        WHERE prod_id IN(
            SELECT cart_prod
            FROM cart
            WHERE cart_member IN(
                SELECT mem_id
                FROM member
                WHERE mem_add1 LIKE '%대전%'
                AND mem_job = '주부'
                AND substr(mem_regno1,1,2) >= 73)
            AND CART_NO like '200504%'));
/*            
 물건을 구매한 회원들 중 5개이상 구매한 회원에게는 재구매 할인 20프로 쿠폰을 발행하고
1~4개이하로 구매한 회원에게는 10프로 할인 쿠폰을 0개 구매한 회원에게는 3000원 할인 쿠폰을 
조회할 예정이다.  회원들을 구매횟수에 따라 분류하고 회원들의 회원id와 전화번호를 조회하라.
*/
select mem_id, mem_hp,
from member
where mem_id in( select cart_qty from cart
                                where cart_qty>=5 and select decode(cart_qty,'cart_qty>=5',
                                                                            '1<=cart_qty<=4','
                                                                            cart_qty<0')) qty_mileage;


