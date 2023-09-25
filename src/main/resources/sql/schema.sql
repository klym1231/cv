DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
create table USERS
(
    USERNAME     VARCHAR(255) PRIMARY KEY,
    EMAIL        VARCHAR(255),
    PASSWORD     VARCHAR(255),
    PHONE_NUMBER VARCHAR(255),
    DESCRIPTION VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS user_roles (
                                          user_role_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                          username VARCHAR(50) NOT NULL,
                                          role VARCHAR(50) NOT NULL,
                                          FOREIGN KEY (username) REFERENCES USERS(USERNAME)
);

create table IF NOT EXISTS PHOTO
(
    ID          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    DESCRIPTION VARCHAR(255),
    NAME        VARCHAR(255),
    DATE        TIMESTAMP
);

create table IF NOT EXISTS COMMENT
(
    ID          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    DATE        TIMESTAMP,
    DESCRIPTION VARCHAR(255),
    PHOTO_ID    INTEGER,
    USERNAME    VARCHAR(255)
);

create table IF NOT EXISTS ATTACHMENT
(
    ID           UUID default RANDOM_UUID() not null
        primary key,
    CONTENT      BINARY LARGE OBJECT,
    CONTENT_TYPE CHARACTER VARYING(255),
    FILENAME     CHARACTER VARYING(255),
    PHOTO_ID     INTEGER,
    constraint FK1UOO2THQFC77LK0CB77WU6ND5
        foreign key (PHOTO_ID) references PHOTO
);

