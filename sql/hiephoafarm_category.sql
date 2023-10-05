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

create table status
(
    id_status      int auto_increment
        primary key,
    status_name    varchar(45) null,
    status_nameVie varchar(45) null
)
    charset = utf8mb4;

INSERT INTO hiephoafarm.status (id_status, status_name, status_nameVie) VALUES (1, 'enable', 'kích hoạt');
INSERT INTO hiephoafarm.status (id_status, status_name, status_nameVie) VALUES (2, 'disable', 'vô hiệu');
INSERT INTO hiephoafarm.status (id_status, status_name, status_nameVie) VALUES (3, 'pending', 'đang chờ');
INSERT INTO hiephoafarm.status (id_status, status_name, status_nameVie) VALUES (4, 'processing', 'đang xử lí');
INSERT INTO hiephoafarm.status (id_status, status_name, status_nameVie) VALUES (5, 'shipping', 'đang vận chuyển');
INSERT INTO hiephoafarm.status (id_status, status_name, status_nameVie) VALUES (6, 'complete', 'hoàn thành');
INSERT INTO hiephoafarm.status (id_status, status_name, status_nameVie) VALUES (7, 'canceled', 'đã hủy');
INSERT INTO hiephoafarm.status (id_status, status_name, status_nameVie) VALUES (8, 'deleted', 'đã xóa');

create table category
(
    id_category   int auto_increment
        primary key,
    category_name varchar(150) not null
)
    charset = utf8mb4;

INSERT INTO hiephoafarm.category (id_category, category_name) VALUES (1, 'Trái cây theo mùa ');
INSERT INTO hiephoafarm.category (id_category, category_name) VALUES (2, 'Mật Ong ');
INSERT INTO hiephoafarm.category (id_category, category_name) VALUES (20, 'Trà ');
INSERT INTO hiephoafarm.category (id_category, category_name) VALUES (21, 'Nấm');

create table gallery
(
    id_gallery int auto_increment
        primary key,
    product_id int          not null,
    photo      varchar(150) not null,
    constraint gallery_ibfk_1
        foreign key (product_id) references product (id_product)
            on delete cascade
)
    charset = utf8mb4;

create index product_id
    on gallery (product_id);

INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (71, 8, 'DuaLuoi.jpeg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (109, 40, 'zxcas.JPG');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (110, 40, 'zxcasd.JPG');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (111, 40, 'zxcs.JPG');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (112, 39, 'zxcm.jpeg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (113, 39, 'zxca.jpeg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (114, 41, 'zxcvasd.JPG');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (115, 41, 'zxcvbn.JPG');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (116, 41, 'zxcvbnm.JPG');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (117, 1, 'zxm.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (118, 1, 'zxn.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (119, 2, 'zc.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (120, 2, 'zx.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (121, 2, 'zv.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (122, 3, 'zo.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (123, 3, 'zxb.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (124, 3, 'zxv.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (125, 23, 'qwe.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (126, 23, 'qw.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (131, 33, 'zi.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (132, 33, 'zu.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (133, 33, 'zy.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (134, 34, 'zm.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (135, 34, 'zb.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (136, 34, 'zn.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (137, 35, 'zj.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (138, 35, 'zg.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (139, 35, 'zs.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (140, 37, 'zl.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (141, 37, 'zk.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (142, 38, 'zxcv.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (147, 32, 'zq.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (148, 32, 'zr.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (149, 32, 'zt.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (150, 32, 'zw.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (155, 51, 'MatOng.jpg');
INSERT INTO hiephoafarm.gallery (id_gallery, product_id, photo) VALUES (157, 52, 'Screen Shot 2022-06-11 at 22.43.22.png');
create table order_detail
(
    Id_order_detail int auto_increment
        primary key,
    quantity        int not null,
    product_id      int not null,
    order_id        int not null,
    constraint order_detail_ibfk_1
        foreign key (product_id) references product (id_product),
    constraint order_detail_ibfk_2
        foreign key (order_id) references orders (id_order)
)
    charset = utf8mb4;

create index order_id
    on order_detail (order_id);

create index product_id
    on order_detail (product_id);

INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (1, 1, 1, 1);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (2, 1, 1, 2);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (3, 1, 3, 2);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (4, 1, 3, 4);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (5, 1, 35, 5);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (6, 1, 35, 6);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (7, 1, 2, 6);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (8, 1, 8, 7);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (9, 1, 23, 7);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (10, 1, 8, 8);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (11, 1, 2, 9);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (12, 1, 1, 10);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (13, 1, 2, 10);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (14, 1, 1, 11);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (15, 1, 2, 11);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (16, 1, 1, 12);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (17, 1, 2, 12);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (18, 1, 1, 13);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (19, 1, 1, 14);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (20, 1, 1, 15);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (21, 1, 1, 16);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (22, 1, 3, 17);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (23, 1, 2, 17);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (24, 1, 1, 18);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (25, 1, 2, 18);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (26, 1, 3, 18);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (27, 1, 1, 19);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (28, 2, 8, 19);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (29, 1, 1, 20);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (30, 1, 2, 20);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (31, 1, 3, 20);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (32, 1, 8, 20);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (33, 1, 23, 20);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (34, 1, 32, 20);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (35, 1, 33, 20);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (36, 1, 34, 20);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (37, 1, 1, 21);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (38, 1, 1, 22);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (39, 1, 2, 22);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (40, 2, 8, 22);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (41, 1, 1, 23);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (42, 1, 1, 24);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (43, 1, 1, 25);
INSERT INTO hiephoafarm.order_detail (Id_order_detail, quantity, product_id, order_id) VALUES (44, 1, 2, 25);
create table orders
(
    id_order       int auto_increment
        primary key,
    customer_phone varchar(10)                          not null,
    customer_name  varchar(45)                          not null,
    address        varchar(150)                         not null,
    shipping_fee   int                                  not null,
    order_amount   int                                  not null,
    created_time   datetime default current_timestamp() not null,
    user_id        int                                  null,
    status_id      int                                  not null,
    constraint orders_ibfk_1
        foreign key (user_id) references user (id_user),
    constraint orders_ibfk_2
        foreign key (status_id) references status (id_status)
)
    charset = utf8mb4;

create index status_id
    on orders (status_id);

create index user_id
    on orders (user_id);

INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (1, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 11141111, '2022-03-17 00:00:00', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (2, '123456789', 'Petter Pan', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 11241111, '2022-03-18 00:00:00', null, 6);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (3, 'dfv', 'dfv', 'dfv', 222, 111, '2022-03-17 21:30:19', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (4, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 130000, '2022-03-17 22:18:23', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (5, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 40000, '2022-03-17 22:40:01', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (6, '123456789', 'Petter Pan', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 33373333, '2022-03-17 22:42:08', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (7, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 276246, '2022-03-17 22:43:36', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (8, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 153123, '2022-03-17 22:48:13', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (9, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 70000, '2022-03-18 16:55:05', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (10, '123456789', 'Petter Pan', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 110000, '2022-03-18 16:56:01', null, 7);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (11, '123456789', 'Petter Pan', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 110000, '2022-03-18 16:56:03', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (12, '123456789', 'Petter Pan', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 110000, '2022-03-18 17:00:15', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (13, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 70000, '2022-03-18 17:16:05', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (14, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 70000, '2022-03-18 17:17:20', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (15, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 70000, '2022-03-18 17:18:07', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (16, '0865791056', 'Người anh Khoi iu', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 70000, '2022-03-18 17:56:54', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (17, '0865791056', 'Bé chang ', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 110000, '2022-03-19 15:06:55', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (18, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 150000, '2022-03-21 09:02:24', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (19, '0376674647', 'Tùng Nguyễn', '78/8 Nguyễn Thị Tú, Bình Tân, HCM , phường 12, Quận 10, Hồ Chí Minh', 30000, 148000, '2022-03-31 09:26:47', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (20, '3645646', 'khoi.nm203@aptechlearning.edu.vn', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 500111, '2022-04-13 06:50:13', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (21, '0399945680', 'Đỗ Đình Hiệp', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 70000, '2022-04-24 08:29:33', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (22, '0969069589', 'Nguyen Minh Khoi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 206000, '2022-04-30 03:16:48', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (23, '0376052775', 'Đoàn Trí Linh ', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 30000, 69000, '2022-05-22 09:44:56', null, 4);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (24, '0376052775', 'Đoàn Trí Linh', '39B Nguyễn Văn Linh , phường Tân Thuận Tây, Quận 7, Hồ Chí Minh', 30000, 69000, '2022-06-08 15:34:40', null, 3);
INSERT INTO hiephoafarm.orders (id_order, customer_phone, customer_name, address, shipping_fee, order_amount, created_time, user_id, status_id) VALUES (25, '0376052775', 'Dung Yeu Nua Em Met Roi', '135 Thành Thái, phường 12, Quận 10, Hồ Chí Minh', 15000, 93000, '2022-06-08 16:34:06', null, 3);
create table product
(
    id_product    int auto_increment
        primary key,
    product_name  varchar(150)             not null,
    description   longtext                 not null,
    product_price int                      not null,
    category_id   int                      not null,
    sale_unit     varchar(45) default 'KG' null,
    status_id     int         default 1    not null,
    constraint product_ibfk_1
        foreign key (category_id) references category (id_category),
    constraint product_ibfk_2
        foreign key (status_id) references status (id_status)
)
    charset = utf8mb4;

create index category_id
    on product (category_id);

create index status_id
    on product (status_id);

INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (1, 'Bưởi da xanh', '👉 Bưởi da xanh Bến Tre thanh ngọt, giàu vitamin', 39000, 21, 'KG', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (2, 'Xoài Cát HL - Cao Lãnh', '👉 Tuyệt vời ông mặt trời <br> 👉 Xoài xanh chấm muối ớt hết xảy <br> 👉 Xoài trái siêu to khổng lồ', 39000, 1, 'KG', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (3, 'Cam Sành', 'Cam sành Vĩnh Long mọng nước', 29000, 1, 'KG', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (8, 'Dưa lưới hữu cơ', 'Dưa lưới thanh mát', 49000, 1, 'KG', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (23, 'Sầu riêng Ri6', 'Sầu riêng Ri6 Tiền Giang. Thơm bùi ngọt thanh', 109000, 20, 'Kg', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (32, 'Mận Hà Nội', 'Mận Hà Nội', 99000, 1, 'Kg', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (33, 'Chôm chôm Thái', 'Chôm chôm ngọt thanh', 39000, 1, 'KG', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (34, 'Nhãn Xuồng', 'Nhãn xuồng cơm vàng ngọt thanh', 49000, 1, 'KG', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (35, 'Nấm Mỡ', 'Sản phẩm độc quyền. Nấm Mỡ đặc biệt sản xuất theo công nghệ Nhật Bản duy nhất tại Lâm Đồng - Việt Nam.', 70000, 21, 'Hộp 300g', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (37, 'Mật ong rừng', 'Mật ong rừng vùng núi Việt Nam. Vị thuốc dân gian từ ngàn xưa.', 400000, 2, 'chai 5l', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (38, 'Quả óc chó', 'Thơm ngon, tăng cường trí tuệ', 70000, 2, 'Hộp', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (39, 'Trà quế thảo mộc', 'Sản phẩm trà quế túi lọc được chọn lọc từ những vỏ quế tốt nhất từ rừng Trà Bồng Quảng Ngãi, kết hợp hài hòa với các thảo mộc tự nhiên sẽ mang đến cho Bạn một tách trà thơm ngon, giúp thư giãn tinh thần vào tốt cho sức khỏe.', 172000, 20, 'Hộp', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (40, 'Trà Quế Cam Mật ', 'Sản phẩm Trà Quế Cam Mật Ong được chọn lọc từ những vỏ quế tốt nhất từ rừng Trà Bồng Quảng Ngãi, kết hợp hài hòa với các nguyên liệu thiên nhiên sẽ mang đến cho Bạn một tách trà thơm ngon, giúp thư giãn tinh thần vào tốt cho sức khỏe.<br> Sản phẩm đầu tiên và duy nhất trên thị trường kết hợp cả 3 trong 1 vô cùng tiện lợi (Trà quế - Cam - Mật ong).', 240000, 20, 'Hộp', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (41, 'Trà Nụ Vối', 'Trà nụ vối từ lâu đã được nhiều thế hệ dùng để nấu nước uống hằng ngày. Hãm trà uống hằng ngày có thể thay thế trà xanh, giúp ngon miệng hơn trong bữa cơm hằng ngày. <br>Thời gian gần đây, trà nụ vối ngày càng được nhiều người biết đến với những công dụng dành cho sức khỏe và hỗ trợ trị bệnh thần kỳ. ', 140000, 20, 'Gói 500g', 1);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (51, 'Mật ong ruồi ', 'ngon', 150000, 2, 'Lít', 8);
INSERT INTO hiephoafarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (52, 'Dưa lưới vàng', 'dấdasds', 72000, 1, 'Kg', 8);
create table role
(
    id_role   int auto_increment
        primary key,
    role_name varchar(45) not null
)
    charset = utf8mb4;

INSERT INTO hiephoafarm.role (id_role, role_name) VALUES (1, 'ROLE_ADMIN');
INSERT INTO hiephoafarm.role (id_role, role_name) VALUES (2, 'ROLE_EMPLOYEE');
INSERT INTO hiephoafarm.role (id_role, role_name) VALUES (3, 'ROLE_CUSTOMER');
