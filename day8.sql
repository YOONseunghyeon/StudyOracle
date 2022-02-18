-- ���̺� �����ϱ�
Create Table lprod(
    lprod_id number(5)  Not Null,
    lprod_gu char(4) Not Null,
    lprod_nm varchar2(40)Not Null,
    CONSTRAINT pk_lprod Primary Key (lprod_gu)
);

--��ȸ�ϱ�
SELECT lprod_id, lprod_gu,lprod_nm
FROM lprod ;

-- ������ �Է��ϱ�.
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P101' ,  '��ǻ����ǰ'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P102' ,  '������ǰ'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P201' ,  '���������'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P202' ,  '���������'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P301' ,  '������ȭ'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P302' ,  'ȭ��ǰ'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P401' ,  '����/CD'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P402' ,  '����'
);
INSERT into lprod(
 lprod_id, lprod_gu ,lprod_nm
) Values(
1,  'P403' ,  '������'
);

--��ǰ�з��������� ��ǰ�з��ڵ��� ����
-- P201�� �����͸� ��ȸ�� �ּ���..
SELECT *
From lprod
--�����߰�
WHERE LPROD_GU> 'P201';
 
 -- ��ǰ�з��ڵ尡 P102�� ���ؼ�
 -- ��ǰ�з����� ���� ����� ������ �ּ���....
 SELECT * 
 FROM LPROD
 WHERE LPROD_GU = 'P102';
 
 UPDATE LPROD
      SET LPROD_NM='���'
WHERE LPROD_GU = 'P102';

--��ǰ�з��ڵ尡 'P202' ���� �����͸� 
--������ �ּ���

 SELECT * 
 FROM LPROD
 WHERE LPROD_GU = 'P202';
 
 DELETE from lprod
 where LPROD_GU='P202';

COMMIT;
 
-- ���̺� �����ϱ�
Create Table buyer(
    buyer_id char(6)  NOT NULL,                        --�ŷ�ó�ڵ�
    buyer_name VARCHAR2(40) NOT NULL,         -- �ŷ�ó��
    buyer_lgu char(4) Not Null,                        --��޻�ǰ ��з�
    buyer_bank varchar2(60),                           --����
    buyer_bankno varchar2(60),                        --���¹�ȣ
    buyer_bankname varchar2(15),                   -- ������
    buyer_zip char(7),                                    --�����ȣ
    buyer_add1 varchar2(100),                        --�ּ�1
    buyer_add2 varchar2(70),                         --�ּ�2
    buyer_comtel varchar2(14) NOT NULL ,          --��ȭ��ȣ
    buyer_fax  varchar2(20) NOT NULL                 --FAX ��ȣ
);

alter table buyer  ADD(buyer_mail varchar2(60) NOT NULL,
                                        buyer_charger varchar2(20),
                                        buyer_telext varchar2(2) );
alter table buyer MODIFY(buyer_name varchar(60) );                         
alter table buyer
    ADD( CONSTRAINT pk_buyer Primary Key (buyer_id),
            CONSTRAINT fr_buyer_lprod Foreign Key (buyer_lgu)
                                              References lprod(lprod_gu) );

 






