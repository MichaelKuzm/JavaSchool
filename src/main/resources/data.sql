--���������� ������������
--������
insert into Country (code, name) values ('643', '������');

-- ���� ����������
insert into Doc_Type (code, name)
values ('21', '������� ���������� ���������� ���������', );

insert into Doc_Type (code, name)
values ('10', '������� ������������ ����������');
 --���������� ������������ end

--�����������
insert into Organisation (name, full_name, inn, kpp, is_active, version)
values ('�����������������������1', '������ ������������ ����������� 1', '123456789', '1123456789', 1, 0);

insert into Organisation (name, full_name, inn, kpp, is_active, version)
values ('�����������������������2', '������ ������������ ����������� 2', '223456789', '2123456789', 1, 0);

-- ����
insert into Office (org_id, address, phone, is_active, version)
values (1, '����� ����� 1 ����������� 1', '+11 123 1234567', 1, 0);

insert into Office (org_id, address, phone, is_active, version)
values (1, '����� ����� 2 ����������� 1', '+12 123 1234567', 1, 0);

insert into Office (org_id, address, phone, is_active, version)
values (2, '����� ����� 1 ����������� 2', '+21 123 1234567', 1, 0);


-- ������
insert into User (office_id, first_name, second_name, middle_name, position, phone, doc_id, doc_number, doc_date, country_id, is_identified, version)
values(1, '���1', '�������1', '��������1', '���������1', '+11 495 1234567', 1, '1234 123456', '2001-03-03', 1, '�����1', 0);

insert into User (office_id, first_name, second_name, middle_name, position, phone, doc_id, doc_number, doc_date, country_id, is_identified, version)
values(2, '���2', '�������2', '��������2', '���������2', '+22 495 1234567', 1, '1234 123456', '2001-03-03', 1, '�����2', 0);

insert into User (office_id, first_name, second_name, middle_name, position, phone, doc_id, doc_number, doc_date, country_id, is_identified, version)
values(2, '���3', '�������3', '��������3', '���������3', '+32 495 1234567', 1, '1234 123456', '2001-03-03', 1, '�����3', 0);


insert into User (office_id, first_name, second_name, middle_name, position, phone, doc_id, doc_number, doc_date, country_id, is_identified, version)
values(3, '���3', '�������4', '��������4', '���������4', '+43 495 1234567', 1, '1234 123456', '2001-03-03', 1, '�����4', 0);


