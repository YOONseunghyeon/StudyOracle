/*
lprod : ��ǰ�з�����
prod: ��ǰ����
buyer: �ŷ�ó ����
member: ȸ�� ����
cart: ���� ����
buyprod: �԰��ǰ����
remain: ��� �������� 
 */
SELECT mem_id,mem_name
FROM member;
SELECT PROD_ID, PROD_NAME
FROM PROD;

SELECT mem_mileage, mem_mileage/12 as mem_12
FROM member;


SELECT PROD_ID , PROD_NAME , PROD_sale*55 as PROD_sale
FROM PROD;
--��ǰ ���̺��� ��ǰ�з��� �ߺ����� �ʰ� �˻�
SELECT  PROD_LGU FROM PROD;
SELECT DISTINCT PROD_LGU FROM PROD;

--������ ����
--ȸ�����̺��� ȸ��ID,ȸ���� , ���� , ���ϸ��� �˻�
  SELECT mem_id, mem_name, mem_bir, mem_mileage
  from member
  order by mem_id ASC;
  
  SELECT mem_id as id, mem_name as nm,
  mem_bir ����, mem_mileage ���ϸ���
  from member
  order by ID ASC;
  
  SELECT mem_id, mem_name, mem_bir, mem_mileage
    from member
  order by 3;
 --��ǰ �� �ǸŰ��� 170,000���� ��ǰ ��ȸ 
  SELECT  PROD_NAME ��ǰ, PROD_SALE �ǸŰ�
  FROM PROD
  WHERE PROD_SALE = 170000;
-- ��ǰ �ǸŰ����� 170,00���� �ƴ�
--��ǰ���̵�� ��ǰ�� ��ȸ
SELECT  PROD_ID ��ǰ�ڵ�, PROD_NAME ��ǰ��,PROD_SALE ��ǰ����
  FROM PROD
  WHERE PROD_SALE !=170000;
---- ��ǰ �ǸŰ����� 170,00���� �ʰ��ϴ�
--��ǰ���̵�� ��ǰ�� ��ȸ
  SELECT  PROD_ID ��ǰ�ڵ�, PROD_NAME ��ǰ��,PROD_SALE ��ǰ����
  FROM PROD
  WHERE PROD_SALE !=170000;
-- ��ǰ�߿� ���԰��ݱ� 200,000�� ������ 
--��ǰ�˻�.. �� , ��ǰ�ڵ带 �������� ��������
-- ��ȸ �÷��� ��ǰ�� , ���԰���, ��ǰ��
SELECT PROD_NAME ��ǰ�� , PROD_COST ���Ժ��
FROM PROD 
WHERE (PROD_COST <=200000 ) 
order by ���Ժ�� desc;

--ȸ���߿� 76�⵵ 1�� 1�� ���ޤ̿� �¾
--ȸ�����̵�, ȸ���̸�,�ֹε�Ϲ�ȣ ���ڸ� ��ȸ
--��, ȸ�����̵� ���� ��������
SELECT mem_id , mem_name, mem_regno1
FROM member
where (mem_regno1 >760101)
order by mem_id asc;
  
--��ǰ �� ��ǰ�з��� P201(���� ĳ���)�̰� �ǸŰ��� 170,000���� ��ǰ ��ȸ
SELECT prod_name ��ǰ, prod_lgu ��ǰ�з�, prod_sale �ǸŰ� FROM prod
WHERE prod_lgu = 'P201'
AND prod_sale = 170000;

--��ǰ�� ��ǰ�з��� P201(���� ĳ���)�� �ƴϰ� �ǸŰ��� 170.000���� �ƴ� ��ǰ��ȸ
SELECT prod_name ��ǰ, prod_lgu ��ǰ�з�, prod_sale �ǸŰ� 
FROM prod
WHERE NOT( prod_lgu = 'P201' OR prod_sale=170000) ;

--��ǰ�� �ǸŰ���300,000�� �̻� , 500,000�� ������ ��ǰ�� �˻��Ͻÿ�
--ALIAS�� ��ǰ�ڵ�, ��ǰ��, �ǸŰ�
SELECT prod_id ��ǰ�ڵ�, prod_name ��ǰ��, prod_sale �ǸŰ�
FROM prod
WHERE  prod_sale>=300000 and prod_sale <=500000;

/*
��ǰ�߿� �ǸŰ����� 15����,17����,33������ ��ǰ���� ��ȸ,
��ǰ�ڵ�, ��ǰ��, �ǸŰ��� ��ȸ 
������ ��ǰ���� �������� ��������..
*/
SELECT prod_id ��ǰ�ڵ�, prod_name ��ǰ��, prod_sale �ǸŰ�
FROM prod
WHERE  prod_sale=150000 OR prod_sale =170000 OR prod_sale =330000 
ORDER BY PROD_NAME ASC;
/*
ȸ�� �߿� ���̵� C001, F001, W001 ȸ����ȸ
ȸ�����̵�, ȸ�� �̸� ��ȸ..
������ �ֹι�ȣ ���ڸ��� �������� ��������
*/
SELECT MEM_ID, MEM_NAME, mem_regno1
FROM MEMBER
WHERE MEM_ID = 'c001' OR MEM_ID =' f001' OR  MEM_ID = 'w001'
ORDER BY mem_regno1 DESC;