/*
[���� �����]
�ּ����� ������ �ŷ�ó ����ڰ� ����ϴ� ��ǰ�� 
�������� ���� ���� ���� ȸ�� �߿� 2���� ��ȥ������� �ִ�
ȸ�� ���̵�, ȸ�� �̸� ��ȸ 
�̸� �������� ����
*/
select m.mem_id,
        m.mem_name
    from member m
    where m.mem_id in(
    select c.cart_member
    from buyer b , prod p, cart c
    where c.cart_prod = p.prod_id
    and p.prod_buyer = b.buyer_id
    and substr(b.buyer_add1,1,2)!='����')
    and substr(m.mem_regno2,1,1)=2
    and substr(m.mem_add1,1,2)='����'
    and m.mem_memorial = '��ȥ�����'
    and to_char (m.mem_memorialday,'MM')=02;