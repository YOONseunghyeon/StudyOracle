/*
짝수 달에 구매된 상품들 중 세탁 주의가 필요 없는 상품들의 ID, 이름, 판매 마진을 출력하시오.
마진 출력 시 마진이 가장 높은 값은 10퍼센트 인하된 값으로, 가장 낮은 값은 10퍼센트 추가된 값으로 출력하시오.
정렬은 ID, 이름 순으로 정렬하시오.
(단, 마진은 소비자가 - 매입가로 계산한다.)
*/
select p.prod_id, 
        p.prod_name,
        p.prod_price-p.prod_sale 판매마진,
        case
        when  p.prod_price-p.prod_sale = (select        max(pp.prod_price-pp.prod_sale)
                                                           from prod pp , cart cc
                                                                 where pp.prod_id = cc.cart_prod
                                                                 and mod(cc.cart_no ,2)=0 and pp.prod_delivery !='세탁 주의')
        then  (p.prod_price-p.prod_sale )*0.9
        else  p.prod_price-p.prod_sale 
        end as max판매마진,
        case
        when p.prod_price-p.prod_sale =  (select       min(pp.prod_price-pp.prod_sale)
                                                           from prod pp , cart cc
                                                                 where pp.prod_id = cc.cart_prod
                                                                 and mod(cc.cart_no ,2)=0 and pp.prod_delivery !='세탁 주의')
        then  (p.prod_price-p.prod_sale )*1.1
        else  p.prod_price-p.prod_sale 
        end as min판매마진
         from prod p , cart c
         where p.prod_id = c.cart_prod
         and mod(c.cart_no ,2)=0 and p.prod_delivery !='세탁 주의';
         

    
