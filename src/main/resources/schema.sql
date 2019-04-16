drop all objects;

CREATE TABLE IF NOT EXISTS Organisation (
    id         integer                  COMMENT '���������� �������������' PRIMARY KEY AUTO_INCREMENT,
    name       varchar(50)     NOT NULL COMMENT '������������',
    full_name  varchar(200)    NOT NULL COMMENT '������ ������������',
    inn        varchar(12)     NOT NULL COMMENT '��� �����������',
    kpp        varchar(10)      NOT NULL COMMENT '��� �����������',
    is_active  integer         NOT NULL COMMENT '���� ����������',
    version    integer         NOT NULL COMMENT '��������� ���� hibernate'
);
COMMENT ON TABLE Organisation IS '�����������';


CREATE TABLE IF NOT EXISTS Office (
    id         integer                  COMMENT '���������� �������������' PRIMARY KEY AUTO_INCREMENT,
    org_id     integer         NOT NULL COMMENT '��� �����������',
    address    varchar(1000)   NOT NULL COMMENT '����� ����� �����������',
    phone      varchar(20)     NOT NULL COMMENT '������� ����� �����������',
    is_active  integer         NOT NULL COMMENT '���� ����������',
    version    integer         NOT NULL COMMENT '��������� ���� hibernate'
);
COMMENT ON TABLE Office IS '����';

CREATE INDEX IF NOT EXISTS IX_Office_org_id ON Office (org_id);
ALTER TABLE Office ADD FOREIGN KEY (org_id) REFERENCES Organisation(id);


CREATE TABLE IF NOT EXISTS User (
    id               integer                  COMMENT '���������� ������������� ' PRIMARY KEY AUTO_INCREMENT,
    first_name       varchar(50)     NOT NULL COMMENT '��� �������',
    second_name      varchar(50)     NOT NULL COMMENT '�������  �������',
    middle_name      varchar(50)     NOT NULL COMMENT '�������� �������',
    position         varchar(20)     NOT NULL COMMENT '������� �������',
    phone            varchar(20)     NOT NULL COMMENT '������� �������',
    doc_id           varchar(20)     NOT NULL COMMENT '������������ ���������',
    doc_number       varchar(20)     NOT NULL COMMENT '����� ���������',
    doc_date         date            NOT NULL COMMENT '���� ������ ���������',
    country_id       varchar(20)     NOT NULL COMMENT '��� ������',
    is_identified    varchar(20)     NOT NULL COMMENT '',
    version          integer         NOT NULL COMMENT '��������� ���� hibernate'
);
COMMENT ON TABLE User IS '������';

CREATE TABLE IF NOT EXISTS user_office (
    user_id    integer       NOT NULL COMMENT 'Id �������',
    office_id  integer       NOT NULL COMMENT 'Id Office',
    version    integer       NOT NULL COMMENT '��������� ���� hibernate',
);
COMMENT ON TABLE user_office IS '������� ��� ����� ������ �� ������';

CREATE PRIMARY KEY IF NOT EXISTS PK_user_office ON user_office (user_id, office_id);


CREATE TABLE IF NOT EXISTS Doc_Type (
    id         integer                  COMMENT '������������� ���������' PRIMARY KEY AUTO_INCREMENT,
    code       varchar(50)     NOT NULL COMMENT '���������� ������������� ���������',
    name       varchar(50)     NOT NULL COMMENT '������������ ���������'
);
COMMENT ON TABLE Doc_Type IS '���� ����������';


CREATE TABLE IF NOT EXISTS Country (
    id         integer                  COMMENT '������������� ������' PRIMARY KEY AUTO_INCREMENT,
    code       integer                  COMMENT '���������� ������������� ������',
    name       varchar(50)     NOT NULL COMMENT '������������ ������'
);
COMMENT ON TABLE Country IS '���� ����������';


CREATE INDEX IF NOT EXISTS IX_User_doc_id ON User (doc_id);
ALTER TABLE User ADD FOREIGN KEY (doc_id) REFERENCES Doc_Type(id);

CREATE INDEX IF NOT EXISTS IX_User_country_id ON User (country_id);
ALTER TABLE User ADD FOREIGN KEY (country_id) REFERENCES Country(id);

create unique index UX_DOC_TYPE_CODE on Doc_Type(code);
create unique index UX_COUNTRY_CODE on Country(code);	