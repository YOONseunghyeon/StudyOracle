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








