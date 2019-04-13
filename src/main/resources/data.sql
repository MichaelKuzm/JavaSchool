--Заполнение справочников
--Страна
insert into Country (code, name) values ('643', 'Россия');

-- Типы документов
insert into Doc_Type (code, name)
values ('21', 'Паспорт гражданина Российской Федерации', );

insert into Doc_Type (code, name)
values ('10', 'Паспорт иностранного гражданина');
 --Заполнение справочников end

--Организация
insert into Organisation (name, full_name, inn, kpp, is_active, version)
values ('НаименованиеОрганизации1', 'Полное Наименование Организации 1', '123456789', '1123456789', 1, 0);

insert into Organisation (name, full_name, inn, kpp, is_active, version)
values ('НаименованиеОрганизации2', 'Полное Наименование Организации 2', '223456789', '2123456789', 1, 0);

-- офис
insert into Office (org_id, address, phone, is_active, version)
values (1, 'Адрес офиса 1 орнанизации 1', '+11 123 1234567', 1, 0);

insert into Office (org_id, address, phone, is_active, version)
values (1, 'Адрес офиса 2 орнанизации 1', '+12 123 1234567', 1, 0);

insert into Office (org_id, address, phone, is_active, version)
values (2, 'Адрес офиса 1 орнанизации 2', '+21 123 1234567', 1, 0);


-- Клиент
insert into User (office_id, first_name, second_name, middle_name, position, phone, doc_id, doc_number, doc_date, country_id, is_identified, version)
values(1, 'Имя1', 'Фамилия1', 'Отчество1', 'Должность1', '+11 495 1234567', 1, '1234 123456', '2001-03-03', 1, 'Идент1', 0);

insert into User (office_id, first_name, second_name, middle_name, position, phone, doc_id, doc_number, doc_date, country_id, is_identified, version)
values(2, 'Имя2', 'Фамилия2', 'Отчество2', 'Должность2', '+22 495 1234567', 1, '1234 123456', '2001-03-03', 1, 'Идент2', 0);

insert into User (office_id, first_name, second_name, middle_name, position, phone, doc_id, doc_number, doc_date, country_id, is_identified, version)
values(2, 'Имя3', 'Фамилия3', 'Отчество3', 'Должность3', '+32 495 1234567', 1, '1234 123456', '2001-03-03', 1, 'Идент3', 0);


insert into User (office_id, first_name, second_name, middle_name, position, phone, doc_id, doc_number, doc_date, country_id, is_identified, version)
values(3, 'Имя3', 'Фамилия4', 'Отчество4', 'Должность4', '+43 495 1234567', 1, '1234 123456', '2001-03-03', 1, 'Идент4', 0);


