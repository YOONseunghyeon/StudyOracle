/*
¦�� �޿� ���ŵ� ��ǰ�� �� ��Ź ���ǰ� �ʿ� ���� ��ǰ���� ID, �̸�, �Ǹ� ������ ����Ͻÿ�.
���� ��� �� ������ ���� ���� ���� 10�ۼ�Ʈ ���ϵ� ������, ���� ���� ���� 10�ۼ�Ʈ �߰��� ������ ����Ͻÿ�.
������ ID, �̸� ������ �����Ͻÿ�.
(��, ������ �Һ��ڰ� - ���԰��� ����Ѵ�.)
*/
select p.prod_id, 
        p.prod_name,
        p.prod_price-p.prod_sale �ǸŸ���,
        case
        when  p.prod_price-p.prod_sale = (select        max(pp.prod_price-pp.prod_sale)
                                                           from prod pp , cart cc
                                                                 where pp.prod_id = cc.cart_prod
                                                                 and mod(cc.cart_no ,2)=0 and pp.prod_delivery !='��Ź ����')
        then  (p.prod_price-p.prod_sale )*0.9
        else  p.prod_price-p.prod_sale 
        end as max�ǸŸ���,
        case
        when p.prod_price-p.prod_sale =  (select       min(pp.prod_price-pp.prod_sale)
                                                           from prod pp , cart cc
                                                                 where pp.prod_id = cc.cart_prod
                                                                 and mod(cc.cart_no ,2)=0 and pp.prod_delivery !='��Ź ����')
        then  (p.prod_price-p.prod_sale )*1.1
        else  p.prod_price-p.prod_sale 
        end as min�ǸŸ���
         from prod p , cart c
         where p.prod_id = c.cart_prod
         and mod(c.cart_no ,2)=0 and p.prod_delivery !='��Ź ����';
         

    
