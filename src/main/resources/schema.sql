drop all objects;

CREATE TABLE IF NOT EXISTS Organisation (
    id         integer                  COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    name       varchar(50)     NOT NULL COMMENT 'Наименование',
    full_name  varchar(200)    NOT NULL COMMENT 'Полное наименование',
    inn        varchar(12)     NOT NULL COMMENT 'ИНН организации',
    kpp        varchar(10)      NOT NULL COMMENT 'КПП организации',
    is_active  integer         NOT NULL COMMENT 'Флаг активности',
    version    integer         NOT NULL COMMENT 'Служебное поле hibernate'
);
COMMENT ON TABLE Organisation IS 'Организация';


CREATE TABLE IF NOT EXISTS Office (
    id         integer                  COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    org_id     integer         NOT NULL COMMENT 'Код организации',
    address    varchar(1000)   NOT NULL COMMENT 'Адрес офиса организации',
    phone      varchar(20)     NOT NULL COMMENT 'Телефон офиса организации',
    is_active  integer         NOT NULL COMMENT 'Флаг активности',
    version    integer         NOT NULL COMMENT 'Служебное поле hibernate'
);
COMMENT ON TABLE Office IS 'Офис';

CREATE INDEX IF NOT EXISTS IX_Office_org_id ON Office (org_id);
ALTER TABLE Office ADD FOREIGN KEY (org_id) REFERENCES Organisation(id);


CREATE TABLE IF NOT EXISTS User (
    id               integer                  COMMENT 'Уникальный идентификатор ' PRIMARY KEY AUTO_INCREMENT,
    first_name       varchar(50)     NOT NULL COMMENT 'Имя клиента',
    second_name      varchar(50)     NOT NULL COMMENT 'Фамилия  клиента',
    middle_name      varchar(50)     NOT NULL COMMENT 'Отчество клиента',
    position         varchar(20)     NOT NULL COMMENT 'Позиция клиента',
    phone            varchar(20)     NOT NULL COMMENT 'Телефон клиента',
    doc_id           varchar(20)     NOT NULL COMMENT 'Наименование документа',
    doc_number       varchar(20)     NOT NULL COMMENT 'Номер документа',
    doc_date         date            NOT NULL COMMENT 'Дата выдачи документа',
    country_id       varchar(20)     NOT NULL COMMENT 'Код страны',
    is_identified    varchar(20)     NOT NULL COMMENT '',
    version          integer         NOT NULL COMMENT 'Служебное поле hibernate'
);
COMMENT ON TABLE User IS 'Клиент';

CREATE TABLE IF NOT EXISTS user_office (
    user_id    integer       NOT NULL COMMENT 'Id клиента',
    office_id  integer       NOT NULL COMMENT 'Id Office',
    version    integer       NOT NULL COMMENT 'Служебное поле hibernate',
);
COMMENT ON TABLE user_office IS 'Таблица для связи многие ко многим';

CREATE PRIMARY KEY IF NOT EXISTS PK_user_office ON user_office (user_id, office_id);


CREATE TABLE IF NOT EXISTS Doc_Type (
    id         integer                  COMMENT 'Идентификатор документа' PRIMARY KEY AUTO_INCREMENT,
    code       varchar(50)     NOT NULL COMMENT 'Уникальный идентификатор документа',
    name       varchar(50)     NOT NULL COMMENT 'Наименование документа'
);
COMMENT ON TABLE Doc_Type IS 'Типы документов';


CREATE TABLE IF NOT EXISTS Country (
    id         integer                  COMMENT 'Идентификатор страны' PRIMARY KEY AUTO_INCREMENT,
    code       integer                  COMMENT 'Уникальный идентификатор страны',
    name       varchar(50)     NOT NULL COMMENT 'Наименование страны'
);
COMMENT ON TABLE Country IS 'Типы документов';


CREATE INDEX IF NOT EXISTS IX_User_doc_id ON User (doc_id);
ALTER TABLE User ADD FOREIGN KEY (doc_id) REFERENCES Doc_Type(id);

CREATE INDEX IF NOT EXISTS IX_User_country_id ON User (country_id);
ALTER TABLE User ADD FOREIGN KEY (country_id) REFERENCES Country(id);

create unique index UX_DOC_TYPE_CODE on Doc_Type(code);
create unique index UX_COUNTRY_CODE on Country(code);	