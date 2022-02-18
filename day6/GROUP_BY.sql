/*
���ų���(��ٱ���)�������� ȸ�����̵𺰷� �ֹ�[����]�� ����
����� ��ȸ�� �ּ���..
ȸ�����̵� �������� ���������� �ּ���..
*/
select  cart_member, avg(cart_qty) avg_qty
from cart
group by cart_member
order by cart_member desc;

/*
����.
��ǰ�������� �ǸŰ����� ��� ���� �����ּ���.
��, ��հ��� �Ҽ��� 2°�ڸ����� ǥ�����ּ���.
*/
select round(avg(prod_sale),2) as avg_sale
from prod;
/*
����.
��ǰ�������� ��ǰ�з��� �ǸŰ����� ��հ��� �����ּ���.
��ȸ �÷��� ��ǰ�з��ڵ�, ��ǰ�з��� �ǸŰ����� ���
��, ��հ��� �Ҽ��� 2°�ڸ� ���� ǥ���� �ּ���.
*/
select prod_lgu, round(avg(prod_sale),2) as avg_sale
from prod
group by prod_lgu;

-- ȸ�����̺��� ����������� count ���� �Ͻÿ� ( alias�� ��� ������)
select count(distinct mem_like)��������� from member;
--ȸ�����̺��� ��̺� count���� �Ͻÿ�(alias�� ���, �ڷ��, �ڷ��(*))
select mem_like ���, 
count(mem_like) �ڷ�� , count(*)"�ڷ��(*)"
from member
group by mem_like;
--ȸ�����̺��� ������������ count�����Ͻÿ� (alias�� ���� ������)
select mem_job, count(mem_job) ����������
from member
group by mem_job
order by count(mem_job) desc;
/*
����.
ȸ�� ��ü�� ���ϸ��� ��պ��� ū ȸ���� ���� ���̵�, �̸�, ���ϸ����� ��ȸ�� �ּ���.
������ ���ϸ����� ���� ������..
*/
select mem_id, mem_name, mem_mileage
from member
where mem_mileage>(select avg(mem_mileage) from member)
order by mem_mileage desc;
/* ��ٱ������̺��� ȸ���� �ִ뱸�ż����� �˻��Ͻÿ�
 ȸ��id, �ִ����, �ּҼ���*/
 select cart_member ȸ��id,
         max(distinct cart_qty) "�ִ����(distinct)",
        max(cart_qty)�ִ����,
        min(distinct cart_qty)"�ּҼ���(distinct)",
         min(cart_qty)�ּҼ���
    from cart
    group by cart_member;
--������ 2005�� 7��11���̶� �����ϰ� ��ٱ��� ���̺��� �߻��� �߰��ֹ���ȣ�� �˻��Ͻÿ�
--(alias�� �������� ���� ���� ���� �ֹ���ȣ, �߰��ֹ���ȣ)
select max(cart_no), max(cart_no )+1
from cart
where cart_no like '20050711%';
/*
����.
������������ �⵵���� �Ǹŵ� ��ǰ�� ����,
��ձ��ż����� ��ȸ�Ϸ��� �մϴ�.
������ �⵵�� ���ؤ��� �����������ּ���.
*/
select substr(cart_no,1 ,4 ) as yyyy,
        sum(cart_qty) as sum_qty,
        avg(cart_qty) as avg_qty
from cart 
group by substr(cart_no,1 ,4 ) 
order by yyyy desc;
/*
����.
������������ �⵵��, ��ǰ�з��ڵ庰�� ��ǰ�� ������ ��ȸ�Ϸ��� �մϴ�.(��ǰ�� ������ count)
������ �⵵�� �������� �����������ּ���
*/
select substr(cart_no,1 ,4 ) as sub_no, 
        substr(cart_prod,1 ,4 ) as ��ǰ�з��ڵ�,
        count(cart_prod) as count_qty
from cart
group by substr(cart_no,1 ,4 ) ,substr(cart_prod,1 ,4 )
order by  count_qty desc;

--��ٱ������̺��� ��ǰ�з��� �Ǹż����� �հ� �� (alias�� ��ǰ, �Ǹż����հ�)
select substr(cart_prod,0,4) ��ǰ�з�,
        sum(cart_qty) "�Ǹż��� �հ�"
from cart
group by substr(cart_prod,0,4);

-- ȸ�����̺��� ȸ����ü�� ���ϸ��� ���, �������� �հ�, �ְ� ���ϸ���, �ּ� ���ϸ���, �ο����� �˻��Ͻÿ�
--(alias�� ���ϸ��� ���, ���ϸ��� �հ� , �ְ��ϸ���, �ּҸ��ϸ���, �ο���)
select avg(mem_mileage), sum(mem_mileage), max(mem_mileage),min(mem_mileage)
from member;

--��ǰ���̺� ��ǰ�з��� �ǸŰ���ü�� ���,�հ�,�ְ�,������, �ڷ� ���� �˻��Ͻÿ�
--(alias�� ���, �հ�, �ְ�, ������, �ڷ�� )
-- ���� �ڷ���� 
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
Where �� : �Ϲ����Ǹ� ���
Having �� : HAVING ��: �׷����Ǹ� (�׷��Լ��� �����  ����ó��)
*/
/*
ȸ�����̺��� ����(�ּ�1��2�ڸ�),���ϳ⵵���� ���ϸ��� ���, ���ϸ��� �հ�, �ְ��ϸ���, �ּҸ��ϸ���, �ڷ�� �� �˻��Ͻÿ�?
(alias�� ����, ���Ͽ���,���ϸ������, ���ϸ��� �հ�, �ְ��ϸ���, �ּҸ��ϸ���, �ڷ��
*/
select substr(mem_add1,1,2) ����,
         to_char(mem_bir,'yyyy') ���Ͽ���,
        avg(mem_mileage) ���ϸ������,
        sum(mem_mileage) ���ϸ����հ�,
        max(mem_mileage)���ϸ����ְ�,
        min(mem_mileage)���ϸ����ּ�,
        count(mem_mileage) �ڷ��
from member
group by substr(mem_add1,1,2),
            to_char(mem_bir,'yyyy');
            
--�ŷ�ó ����� ������ '��' �̸� NULL�� ����
UPDATE buyer set buyer_charger = NULL
WHERE buyer_charger like '��%';
--�ŷ�ó ����ڰ� ������ '��' �̸� white space�� ����
update buyer set buyer_charger = ' '
where buyer_charger like '��%';

-- null�� �̿� null �� ��
Select buyer_name �ŷ�ó, buyer_charger �����
From buyer
where buyer_charger = Null;


Select buyer_name �ŷ�ó, buyer_charger �����
From buyer
where buyer_charger is null;

Select buyer_name �ŷ�ó, buyer_charger �����
From buyer
where buyer_charger is not null;

-- null�� �����ϴ� ���·� ��ȸ
Select buyer_name �ŷ�ó, buyer_charger �����
From buyer;

--ȸ�����ϸ����� 100�� ���� ��ġ�� �˻��Ͻÿ�
--(NVL ���, Alias�� ����, ���ϸ���, ���渶�ϸ���)
select mem_name ����, mem_mileage  ���ϸ���, (nvl(mem_mileage,0)+100)  ���渶�ϸ���
from member;

-- ȸ�� ���ϸ����� ������ '���� ȸ��' , null �̸� '������ ȸ��' ���� �˻��Ͻÿ�
--(nvl2 ���, alias�� ����, ���ϸ���, ȸ������)
select mem_name ����, mem_mileage  ���ϸ���, nvl2(mem_mileage,'����','������')  ȸ������
from member;

select decode(9,10,'A',9,'B',8,'C','D')
FROM DUAL;
select decode(substr(prod_lgu,1,2),
        'P1','��ǻ��/���� ��ǰ',
        'P2',' �Ƿ�',
        'P3', '��ȭ', '��Ÿ')
        from prod;
--��ǰ �з��� ���� �� ���ڰ� 'P1'�̸� �ǸŰ��� 10%�λ��ϰ� 'P2'�̸� �ǸŰ��� 15%�λ��ϰ�,�������� �����ǸŰ��� �˻��Ͻÿ�?
--(DECODE �Լ����, ALIAS�� ��ǰ��,�ǸŰ�,�����ǸŰ�)
Select prod_name, prod_sale,
decode(substr(prod_lgu,1,2),
'P1',prod_sale*(110/100),
'P2',prod_sale*(115/100)) new_sale
FROM prod;

--ȸ���������̺��� �ֹε�� ���ڸ� (7�ڸ� �� ù°�ڸ�)���� ���� ������ �˻��Ͻÿ�
--(case ���� ���, alias�� ȸ����, �ֹε�Ϲ�ȣ (�ֹ�1-�ֹ�2), ����)
select mem_name ȸ����, 
mem_regno1||'-'|| mem_regno2 �ֹε�Ϲ�ȣ,
decode(substr(mem_regno2,1,1), 
'1','����',
'2','����') ����
from member;
select mem_name ȸ����, 
(mem_regno1 ||'-'||  mem_regno2) �ֹε�Ϲ�ȣ,
case
when substr(mem_regno2,1,1) =1
then '����'
else '����'
end as ����
from member;