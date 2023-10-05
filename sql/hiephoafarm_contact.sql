create table contact
(
    id_contact int auto_increment
        primary key,
    fullname   varchar(151) charset utf8mb3  null,
    email      varchar(150)                  null,
    title      varchar(150) charset utf8mb3  null,
    content    varchar(6000) charset utf8mb3 null,
    phone      int                           null
);
