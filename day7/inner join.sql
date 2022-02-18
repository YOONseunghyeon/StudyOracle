/*
����. 
ȸ������ �߿� ���ų����� �ִ� ȸ���� ���� ȸ�����̵�, ȸ���̸�, ����(0000-00-00 ����)�� ��ȸ�� �ּ���
������ ������ �������� �������� �� �ּ���
*/
select mem_id, mem_name, to_char(mem_bir,'YYYY-MM-DD')
from member
where not mem_id in (select cart_member from cart)

order by to_char(mem_bir,'YYYY-MM-DD') asc;

-- �Ѱ��� ���̺� ��ȸ
select prod_id, prod_name, prod_lgu
    from prod
        where exists (select lprod_gu
                    from lprod
                    where lprod_gu = prod.prod_lgu
                    and lprod_gu = 'P301');
                    
--Table join
-- cross ����
--�Ϲݹ��
select m.mem_id, c.cart_member, p.prod_id
from member m, cart c, prod p, lprod lp, buyer b;

select count(*)
from member m, cart c, prod p, lprod lp, buyer b;

--[����ǥ�ع��]
Select *
From member cross join cart 
             cross join prod    
             cross join lprod
             cross join buyer;

/*��ǰ���̺��� ��ǰ�ڵ�, ��ǰ��, �з����� ��ȸ..
 ��ǰ���̺� : prod
 �з����̺� : lprod
 */
 --�Ϲݻ��
 select p.prod_id, p.prod_name, lp.lprod_nm
 from prod p, lprod lp
 where p.prod_lgu = lp.lprod_gu;
 
 -- ����ǥ�ع��
  select prod.prod_id, prod.prod_name, lprod.lprod_nm
  from prod inner join lprod
  on(prod.prod_lgu = lprod.lprod_gu);
  
--alias ����� ���
select A.prod_id "��ǰ�ڵ�",
        A.prod_name "��ǰ��",
        B.lprod_nm "�з���",
        C.buyer_name "�ŷ�ó��"
        from prod A, lprod B, buyer C
        Where A.prod_lgu = B.lprod_gu
        and A.prod_buyer = C.buyer_id;
        
--����ǥ�ع��
select A.prod_id "��ǰ�ڵ�",
        A.prod_name "��ǰ��",
        B.lprod_nm "�з���",
        C.buyer_name "�ŷ�ó��"
        from prod A inner join lprod B
        on(A.prod_lgu = B.lprod_gu)
      inner join buyer C
        on(A.prod_buyer = C.buyer_id);

/*
����
ȸ���� ������ �ŷ�ó ������ ��ȸ�Ϸ��� �մϴ�.
ȸ�����̵�, ȸ���̸�, ��ǰ�ŷ�ó��,
��ǰ�з����� ��ȸ���ּ���
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

 --����ǥ�ع��       
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
����
�ŷ�ó�� '�Ｚ����' �� �ڷῡ ���� ��ǰ�ڵ�, ��ǰ��, �ŷ�ó���� ��ȸ�Ϸ��� �մϴ�.
*/
select p.prod_id ��ǰ�ڵ�, 
        p.prod_name ��ǰ��, 
        b.buyer_name �ŷ�ó��
from prod p, buyer b
    where p.prod_buyer = b.buyer_id
        and b.buyer_name = '�Ｚ����';

select p.prod_id ��ǰ�ڵ�, 
        p.prod_name ��ǰ��, 
        b.buyer_name �ŷ�ó��
from prod p inner join buyer b 
    on(p.prod_buyer = b.buyer_id)
    and b.buyer_name = '�Ｚ����';
    
-- ��ǰ���̺��� ��ǰ�ڵ�, ��ǰ��, �з���, �ŷ�ó��, �ŷ�ó�ּҸ� ��ȸ.
--1. �ǸŰ����� 10���� �����̰�
--2. �ŷ�ó�ּҰ� �λ��� ��츸 ��ȸ
select p.prod_id, p.prod_name, lp.lprod_nm, b.buyer_name, b.buyer_add1
from prod p, lprod lp, buyer b
where p.prod_buyer = b.buyer_id
and b.buyer_lgu=lp.lprod_gu
and p.prod_sale <=100000
and b.buyer_add1 like '%�λ�%';

/*
����. ��ǰ�з��ڵ尡 p101�ΰͿ� ����
��ǰ�з���, ��ǰ���̵�, �ǸŰ�, �ŷ�ó�����, ȸ�����̵�, �ֹ����� ��ȸ
��, ��ǰ�з����� ������ ��������, ��ǰ���̵� �������� ��������
�Ϲ�/ǥ�� ���
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
        