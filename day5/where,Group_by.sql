--where��
--��Ÿ������
--��ǰ �з����̺��� ���� ��ǰ���̺� �����ϴ� �з��� �˻�(�з��ڵ�,�з���)
select lprod_gu �з��ڵ�, lprod_nm �з���
from lprod
where lprod_gu in (SELECT prod_lgu from prod);

--��ǰ �з����̺��� ���� ��ǰ���̺� �������� �ʴ� �з��� �˻��Ͻÿ�? (alias�� �з��ڵ�, �з���)
SELECT lprod_gu �з��ڵ�, lprod_nm �з���
FROM lprod
where lprod_gu not in (SELECT prod_lgu from prod);
/*
�ѹ��� ��ǰ�� ���������� ���� ȸ�� ���̵�, �̸� ��ȸ
*/
SELECT mem_id ȸ�����̵�, mem_name ȸ���̸�
FROM member
where mem_id not in(SELECT cart_member
    FROM cart);
    /*
lprod : ��ǰ�з�����
prod: ��ǰ����
buyer: �ŷ�ó ����
member: ȸ�� ����
cart: ���� ����
buyprod: �԰��ǰ����
remain: ��� �������� 
 */
 /*
 �ѹ��� �Ǹŵ� ���� ���� ��ǰ�� ��ȸ�Ϸ��� �մϴ�.
 �Ǹŵ� ���� ���� ��ǰ�̸��� ��ȸ�� �ּ���
 */
 select prod_name ��ǰ�̸� 
 from prod
 where prod_id not in (select cart_no
 from cart); 
 /*
 ȸ�� �߿� ������ ȸ���� ���ݱ��� �����ߴ� ��� ��ǰ���� ��ȸ�� �ּ���.
 */
SELECT prod_name
FROM prod
where prod_id in (select cart_prod from cart
where cart_member in ( select mem_id from member where mem_name='������'));

/*
��ǰ �� �ǸŰ����� 10�����̻�, 30���� ������ ��ǰ�� ��ȸ
��ȸ �÷��� ��ǰ�� , �ǸŰ��� �Դϴ�.
������ �ǸŰ����� �������� �������� ���ּ���
*/
SELECT prod_name ��ǰ��, prod_sale �ǸŰ���
FROM prod
where prod_sale >= 100000 and prod_sale <=300000
order by prod_sale desc;

SELECT prod_name ��ǰ��, prod_sale �ǸŰ���
FROM prod
where prod_sale between 100000 and 300000
order by prod_sale desc;

--ȸ�� �� ������ 1975-01-01 ���� 1976-12-31 ���̿� �¾ ȸ���� �˻��Ͻÿ�?
-- alias ��  ȸ��id ȸ����, ����
SELECT mem_id ȸ��id, mem_name ȸ����, mem_bir ����
FROM member
where mem_bir BETWEEN '1975-01-01 'and '1976-12-31'
order by mem_bir asc;

/*
�ŷ�ó ����� ���������� ����ϴ� ��ǰ�� 
������ ȸ������ ��ȸ�Ϸ��� �մϴ�.
ȸ�����̵�, ȸ���̸��� ��ȸ���ּ���..
*/
select mem_id ȸ�����̵�, mem_name ȸ���̸�
from member
where mem_id in (select cart_member from cart
                            where cart_prod in (select prod_lgu from prod
where prod_lgu in ( select buyer_id from buyer where buyer_charger='������')));


select mem_id ȸ�����̵�, mem_name ȸ���̸�
from member
where mem_id in (select cart_member from cart
                            where cart_prod in (select prod_id from prod
where prod_lgu in ( select lprod_gu from lprod
                                                            where lprod_gu in (select buyer_lgu from buyer 
                                                            where buyer_charger='������'))));
                                                            
/*
��ǰ �� ���԰��� 300,000~1,500,00�̰� 
�ǸŰ��� 800,000~2,000,000 �� ��ǰ�� �˻��Ͻÿ� 
(Alias�� ��ǰ��, ���԰�, �ǸŰ�)
*/
SELECT prod_name ��ǰ��, prod_cost ���԰�, prod_sale �ǸŰ�
FROM prod
where prod_cost between 300000 and 1500000 and prod_sale BETWEEN 800000 and 2000000;

/*
ȸ�� �� ������ 1975�⵵ ���� �ƴ� ȸ���� �˻��Ͻÿ�?
(Alias�� ȸ��ID, ȸ�� ��, ����)
*/
SELECT mem_id ȸ��, mem_name ȸ����, mem_bir ����
FROM member
where not (mem_bir between '75/01/01' and '75/12/31');

--ȸ�����̺��� �达 ���� ���� ȸ���� �˻��Ͻÿ�
--(Alias�� ȸ��ID, ����)
select mem_id ȸ��, mem_name ����
from member
where mem_name like '��%';
--ȸ�����̺��� �ֹε�Ϲ�ȣ ���ڸ��� �˻��Ͽ� 1975����� ������ ȸ���� �˻��Ͻÿ�
--(Alias�� ȸ��ID, ����,�ֹε�Ϲ�ȣ)
select mem_id ȸ��, mem_name ���� ,mem_regno1 �ֹε�Ϲ�ȣ
from member
where not mem_regno1 not like '75%';

select  'a' || 'bcde' from dual;
select mem_id || ' name is' || mem_name from member;
select concat('my name is' , mem_name) from member;
select chr(65) "chr", asc||('A') "asc||" from dual;
select asc||(chr(65) result from dual;
select chr(75)"chr", asc||('K') "asc||" from dual;
select lower ('DATA manipulation Language') "LOWER",
        upper('DATA manipulation Language') "UPPER",
        initcap('DATA manipulation Language') "INITCAP" FROM DUAL;
        
--ȸ�����̺��� ȸ��ID�� �빮�ڷ� ��ȯ�Ͽ� �˻��Ͻÿ� 
--(Alias���� ��ȯ ��ID, ��ȯ ��ID)
select mem_id ��ȯ��id,
        upper(mem_id)"��ȯ ��id"
        from member;
        
select replace('java flex via','a')
from dual;
/*
ȸ�����̺��� ȸ������ �� ���� '��' -->'��' ġȯ�Ͽ�
�ڿ� �̸��� ���� �� �˻��Ͻÿ�
(Alias���� ȸ����, ȸ����ġȯ)
*/
select concat(replace(substr(mem_name,1,1),'��','��'),
         substr(mem_name,2))
         from member;
         
SELECT sysdate-1
 FROM dual;
 --���� �ð����� 5�� ���ϱ�       
SELECT add_months(sysdate,5)
FROM dual;
--���� ������ , �̹��� ������ ��
SELECT next_day (sysdate, '������'),
    last_day(sysdate)
    from dual;
    
--�̹����� ��ĥ�� ���Ҵ��� �˻��Ͻÿ�
select last_day(sysdate)-sysdate
from dual;

--extract ��¥���� �ʿ��� �κи� ����
SELECT extract(year from sysdate) "�⵵"
    FROM dual;
--������ 3���� ȸ���� �˻��Ͻÿ�
select mem_bir,
extract(month from mem_bir) as bir3
from member
where extract(month from mem_bir) = '3'; 

/*
ȸ�� ���� �� 1973����� �ַ� ������ ��ǰ�� 
������������ ��ȸ�Ϸ��� �մϴ�.
 - ��ȸ�÷�: ��ǰ��
 - ��, ��ǰ�� �Ｚ�� ���Ե� ��ǰ�� ��ȸ,
 �׸��� ��ȸ����� �պ�����
 */
select prod_name ��ǰ��
from prod
where prod_name like '%�Ｚ%' and
prod_id in (
        select cart_prod    
        from cart
        where cart_member in ( 
        select mem_id   
        from member
        where  extract(year from mem_bir) = 1973))
    order by prod_name asc;
 
 /* 
 to char : ���� ,����, ��¥�� ������ ������ ���ڿ� ��ȯ
 */
 
--��ǰ���̺��� ��ǰ�԰����� '2008-09-28' �������� ������ �˻��Ͻÿ� (Alias ��ǰ��, ��ǰ�ǸŰ�, �԰���)
select prod_name ��ǰ��, prod_sale ��ǰ�ǸŰ�, 
to_char (prod_insdate,'YYYY-MM-DD') AS �԰���
from prod;

--ȸ���̸��� ���Ϸ� ����ó�� ��µǰ� �ۼ��Ͻÿ�
select  mem_name || '����' || 
extract(year from mem_bir) ||'�⵵'|| 
extract(month from mem_bir)|| '�� ����̰� �¾ ������ ' || to_char(mem_bir, 'day') as day
from member;

select to_char (1234.6, '99,999.00') from dual;
select to_char (-1234.6, 'L99,999.00PR') from dual;  --$ ,L �� �޷��� ���� ȭ���ȣ
select to_char (255, 'XXX') from dual;

--��ǰ���̺��� ��ǰ�ڵ�, ��ǰ��,���԰���, �Һ��� ����, �ǸŰ����� ����Ͻÿ�
-- ��, ������ õ���� ���� �� ��ȭǥ��
SELECT prod_id ��ǰ�ڵ� , prod_name ��ǰ��,
to_char(prod_cost,'L999,999,999') ���԰���, 
to_char(prod_price , 'L999,999,999')�Һ��ڰ���,
to_char(prod_sale,'L999,999,999') �ǸŰ���
FROM PROD;

--ȸ�����̺��� �̻���ȸ���� ȸ��id2~4 ���ڿ��� ���������� ġȯ�� �� 10�� ���Ͽ� ���ο� ȸ�� id�� �����Ͻÿ�
--(alias�� ȸ��id, ����ȸ��id)
select mem_id,
substr(mem_id,1,2) ||
(substr(mem_id,3,4)+10) as new_mem_id
         from member
         where mem_name = '�̻���';
         
-- ��ǰ���̺��� ��ǰ�з��� ���԰��� ��հ�
/*
�Ϲ��÷��� �׷��Լ��� ���� ����� ��쿡�� 
��~ Group by ���� �־� �־�� �մϴ�
�׸��� Group by������ �Ϲ��÷��� ��� ���� �մϴ�.
*/
select prod_lgu,
round(avg(prod_cost),2) --"�з��� ������� ����"
from prod
group by prod_lgu;

-- ��ǰ���̺긣�� �ǸŰ��� ��� ���� ���Ͻÿ�
select avg(prod_sale) as avg_sale
from plod;

-- ��ǰ���̺��� ��ǰ�з��� �ǸŰ��� ��� ���� ���Ͻÿ�
select prod_lgu, avg(prod_sale) as avg_sale
from prod
group by prod_lgu;
/*
��ٱ������̺��� ȸ���� count���� �Ͻÿ� 
*/
select cart_member, count(cart_member) as mem_count
from cart
group by cart_member;
/*
���ż����� ��ü��� �̻��� ������ ȸ������ 
���̵�� �̸��� ��ȸ�� �ּ���.
�� ������ �ֹι�ȣ ���ڸ� �������� ��������
*/
select mem_id, mem_name 
from member
where 
mem_id in (select cart_member from cart
where cart_qty>=(select avg(cart_qty) from cart ))
order by mem_regno1 asc;
