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
