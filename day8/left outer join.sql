/*
����
��ǰ�з���, ��ǰ��, ��ǰ����,���Լ���,�ֹ�����,�ŷ�ó���� ��ȸ�ϼ���...
��, ��ǰ�з� �ڵ尡 'P101','P201','P301' �� �͵鿡 ���� ��ȸ�ϰ�,
���Լ����� 15�� �̻��� �͵��, '����'�� ����ִ� ȸ�� �߿� ������ 1974�� ���� ����鿡 ���� ��ȸ���ּ���.
������ ȸ����̵� �������� ��������, ���Լ����� �������� �����������ּ���.
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
and substr(m.mem_add1,1,2)= '����'
and to_char(m.mem_bir,'YY')='74'
order by mem_id desc , buy_qty desc;






---��ü �з��� ��ǰ�ڷ� ���� �˻� ��ȸ
--(alias�� �з��ڵ�,�з���, ��ǰ�ڷ��)


--1 . �з����̺���ȸ
select * from lprod;
--2.�Ϲ� join
select lprod_gu,
        lprod_nm,
        count(prod_lgu)
    from lprod, prod
    where lprod_gu = prod_lgu
    group by lprod_gu, lprod_nm;
--3.outerjoin���Ȯ��
select lprod_gu ,lprod_nm,
        count(prod_lgu)
    from lprod,prod
    where lprod_gu = prod_lgu(+)
    group by lprod_gu,lprod_nm
    order by lprod_gu;

--ansi ����
/* ��� ���� �˻��Ǿ�� �� ���̺��� ��ġ�� �������� �Ѵ�.
��ġ�� ���� left, rigrt, full�� ������
(+) ���� ��Ȯ�ϰ� ����� ���´�
(+)�� �������� ���ϴ� full outer join�� �ȴ�.
*/
--ansi outer join--
select lprod_gu �з��ڵ�, lprod_nm �з���,
count(prod_lgu) ��ǰ�ڷ��
from lprod
    left outer join prod on (lprod_gu = prod_lgu)
group by lprod_gu, lprod_nm
order by lprod_gu;

--��ü ��ǰ�� 2005�� 1�� �԰� ������ �˻� ��ȸ
--(alias�� ��ǰ�ڵ�, ��ǰ��, �԰����)
--1.�Ϲ� join
select prod_id,
        prod_name,
        sum(buy_qty)
    from prod,buyprod
    where prod_id = buy_prod
    and buy_date between '2005-01-01'and'2005-01-31'
    group by prod_id, prod_name;
    
-- outer join  ���Ȯ��
select prod_id,
        prod_name,
        sum(buy_qty)
    from prod,buyprod
    where prod_id =buy_prod(+)
    and buy_date between '2005-01-01'and'2005-01-31'
    group by prod_id, prod_name
    order by prod_id, prod_name;
    
--2�� ������ ��ü��ǰ�� ����� ��ȸ���� �ʾҴ�,
--���������� ����ϰų� ansi������ ����Ͽ� �ذ� �ؾ� �Ѵ�.
--3 ANSI OUTER JOIN 
    select prod_id,
            prod_name,
            sum(buy_qty)
        from prod left outer join buyprod
        on(prod_id = buy_prod
            and buy_date between '2005-01-01'and'2005-01-31')
            group by prod_id, prod_name
    order by prod_id, prod_name;
            
--4. outer join ��� Ȯ�� ( NULL�� ����)
Select prod_id ��ǰ�ڵ�,
        prod_name ��ǰ��,
        sum(nvl(buy_qty,0)) �԰����
    From prod Left outer join buyprod
             on( prod_id = buy_prod
             And buy_date Between '2005-01-01' and '2005-01-31')
        group by prod_id, prod_name
    order by prod_id, prod_name;
    
-- ��ü ȸ���� 2005�� 4���� ������Ȳ ��ȸ(ȸ��id,����,���ż����� ��)
--�Ϲ�join
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
/*2005�⵵ ���� ���� ��Ȳ�� �˻��Ͻÿ� 
���Կ�, ���Լ���, ���Աݾ�(���Լ���*��ǰ���̺� ���԰�)*/
select to_char(buy_date,'MM')���Կ�,
sum(buy_qty)���Լ���,
to_char(sum(buy_qty*prod_cost),'L999,999,999')���Աݾ�
from buyprod,prod
where buy_prod=prod_id
and extract(year from buy_date) = 2005
group by to_char(buy_date,'MM')
order by ���Կ� asc;

--2005�⵵ ���� �Ǹ� ��Ȳ�� �˻��Ͻÿ�
--(alias�� �Ǹſ�,�Ǹż���,�Ǹűݾ�(�Ǹż���*��ǰ���̺��� �ǸŰ�)
SELECT  SUBSTR(cart_no,5, 2) �Ǹſ�,
            sum(cart_qty) �Ǹż���,
            TO_CHAR(sum(cart_qty *prod_sale),'999,999,999') �ǸŰ�
FROM prod P INNER JOIN cart C
                    ON( prod_id = cart_prod)
                    and substr(cart_no,1,4) ='2005'
GROUP BY  SUBSTR(cart_no,5,2);

select substr(cart_no, 5, 2) ���Կ�,
        sum(cart_qty) �Ǹż���,
        sum(cart_qty*prod_sale) �Ǹűݾ�
        from cart,prod
        where prod_id=cart_prod
group by substr(cart_no, 5, 2);

--��ǰ�з��� ��ǻ����ǰ('P101')�� ��ǰ�� 2005�⵵ ���ں� �Ǹ� ��ȸ
--(�Ǹ���, �Ǹűݾ�(5,00,000 �ʰ��� ��츸), �Ǹż���)
--HAVING�� �̿��Ͽ� �ش� ��ȸ
select substr(cart_no,1,8) "�Ǹ���",
        sum(cart_qty * prod_sale) "�Ǹűݾ�",
        sum(cart_qty) "�Ǹż���"
        from prod,cart
        where cart_no like '2005%'
        and prod_id =cart_prod
        and prod_lgu = 'P101'
        group by substr (cart_no,1,8)
        having sum(cart_qty * prod_sale)>5000000
        order by substr(cart_no,1,8);
        
        
        
--��������
/* SQL ���� �ȿ� �� �ٸ� select ������ �ִ� ���� ���Ѵ�.
Subquery�� ���ٸ� SQL������ �ʹ� ���� join �� �ؾ��ϰų� ������ ����������.
subquery�� ��ȣ�� ���´�.
�����ڸ� ���� �����ʿ� ��ġ
from���� ����ϴ� ��� view�� ���� ������ ���̺�ó�� Ȱ��Ǿ� inline view��� �θ���
main query�� sub query������ ������ ���ο� ����
����, �񿬰� ���������� ����
��ȯ�ϴ� ���� ��, �÷����� ���� ������/������, �����÷�/�����÷����� ����.
��ü������ �������� Ư���� �����ϸ� ����.
*/
