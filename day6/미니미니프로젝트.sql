/*
��ö�� �� ���� �� TV �� ���峪�� ��ȯ�������� �Ѵ�
��ȯ�������� �ŷ�ó ��ȭ��ȣ�� �̿��ؾ� �Ѵ�.
����ó�� ��ȸ�ϰ� ���� ��ȭ�ؾ� �ϴ��� ��ȭ��ȣ�� ���Ͻÿ�. 
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
                                    WHERE mem_name = '��ö��'))
            AND prod_name = '�Ｚ Į�� TV 53��ġ');
            where substr(mem_add1,1,2) = '����' and substr(mem_regno1,1,2)>'73'
            
/*������ ��� 73�����Ŀ� �¾ �ֺε��� 2005��4���� ������ ��ǰ�� ��ȸ�ϰ�, 
�׻�ǰ�� �ŷ��ϴ� ���ŷ�ó�� ���� ������ ���¹�ȣ�� �����ÿ�.
(��, �����-���¹�ȣ).*/
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
                WHERE mem_add1 LIKE '%����%'
                AND mem_job = '�ֺ�'
                AND substr(mem_regno1,1,2) >= 73)
            AND CART_NO like '200504%'));
/*            
 ������ ������ ȸ���� �� 5���̻� ������ ȸ�����Դ� �籸�� ���� 20���� ������ �����ϰ�
1~4�����Ϸ� ������ ȸ�����Դ� 10���� ���� ������ 0�� ������ ȸ�����Դ� 3000�� ���� ������ 
��ȸ�� �����̴�.  ȸ������ ����Ƚ���� ���� �з��ϰ� ȸ������ ȸ��id�� ��ȭ��ȣ�� ��ȸ�϶�.
*/
select mem_id, mem_hp,
from member
where mem_id in( select cart_qty from cart
                                where cart_qty>=5 and select decode(cart_qty,'cart_qty>=5',
                                                                            '1<=cart_qty<=4','
                                                                            cart_qty<0')) qty_mileage;


