create table user
(
    id_user   int auto_increment
        primary key,
    username  varchar(45)                  not null,
    password  varchar(64)                  not null,
    role_id   int                          not null,
    fullname  varchar(45) charset utf8mb3  null,
    address   varchar(150) charset utf8mb3 null,
    status_id int default 1                null,
    constraint user_username_uindex
        unique (username),
    constraint user_ibfk_1
        foreign key (role_id) references role (id_role),
    constraint user_ibfk_2
        foreign key (status_id) references status (id_status)
)
    charset = utf8mb4;

create index role_id
    on user (role_id);

INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (6, '0969069589', '$2a$10$fPf4IEBF59ZVMKIXC3HQK.EoWF5oJ8Vvynb8Y6af8M791ZCVZqpTK', 1, 'Admin', '22 Thành Thái', 1);
INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (7, '0123456788', '$2a$10$EMJGh0MH6sCZK7K2DBOuyOmBnoTYxaCZJ/THPpBzjDqEW5wS84.nO', 2, 'Nguyen Van A', '10 Thanh thai', 1);
INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (11, '0366057766', '$2a$10$6hG3A2lk5o1Ni5Gg2E7eG.r6eP34I50ya9TonplDZ3WUWTG0Dp/.a', 3, 'Nguyen Vawn B', '22 Than hThais', 1);
INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (12, '0222222222', '$2a$10$xmJjxz.N7/6jW7kTo6JaTuJN0dFt.PMQ2IukmcH2LpB0Gj4KucvFC', 3, 'nguyen van a', '20 thanh thaoi', 1);
INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (13, '0123456777', '$2a$10$ST5yY3c8S3qtxGVGStxjHuv/BDdKkEtyQfmpFZd8yl7aTl6MaMyt6', 3, 'nguyenvbdg', 'sdfhg12', 1);
INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (14, '01234567775', '$2a$10$DAS.1BxS96AGjIXqzMsROeWEIqFvnZ1SQjdrC2qC4C50Yr3TZJpHS', 3, 'nguyenvbdg', 'sdfhg12', 1);
INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (15, '01234567774', '$2a$10$bfI8y.53xzZS0yon.cTBgO4tlxSWCt51FWJ9jS2Bhv33kYhAW8aRW', 3, 'nguyenvbdg', 'sdfhg12', 1);
INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (16, '0969069888', '$2a$10$dKeVJ9Ti7zrJ8eF4Loi4zeDRVBHi2HtVEBS.zdJ5qqsc0lyt9ltGu', 3, 'sdsdv', 'sdvsdv', 1);
INSERT INTO hiephoafarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (17, '0969069587', '$2a$10$a/oaa2D97Dp2oifW17NydOB/kVoZL7Hr/7I7ZQDXR2rTj/SPkvndG', 3, 'sdsdv', 'sdvsdv', 1);
