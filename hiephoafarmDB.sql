create table role
(
    id_role   int auto_increment
        primary key,
    role_name varchar(45) not null
)
    charset = utf8mb4;

INSERT INTO linhfarm.role (id_role, role_name) VALUES (1, 'ROLE_ADMIN');
INSERT INTO linhfarm.role (id_role, role_name) VALUES (2, 'ROLE_EMPLOYEE');
INSERT INTO linhfarm.role (id_role, role_name) VALUES (3, 'ROLE_CUSTOMER');


create table status
(
    id_status      int auto_increment
        primary key,
    status_name    varchar(45) null,
    status_nameVie varchar(45) null
)
    charset = utf8mb4;

INSERT INTO linhfarm.status (id_status, status_name, status_nameVie) VALUES (1, 'enable', 'kích hoạt');
INSERT INTO linhfarm.status (id_status, status_name, status_nameVie) VALUES (2, 'disable', 'vô hiệu');
INSERT INTO linhfarm.status (id_status, status_name, status_nameVie) VALUES (3, 'pending', 'đang chờ');
INSERT INTO linhfarm.status (id_status, status_name, status_nameVie) VALUES (4, 'processing', 'đang xử lí');
INSERT INTO linhfarm.status (id_status, status_name, status_nameVie) VALUES (5, 'shipping', 'đang vận chuyển');
INSERT INTO linhfarm.status (id_status, status_name, status_nameVie) VALUES (6, 'complete', 'hoàn thành');
INSERT INTO linhfarm.status (id_status, status_name, status_nameVie) VALUES (7, 'canceled', 'đã hủy');
INSERT INTO linhfarm.status (id_status, status_name, status_nameVie) VALUES (8, 'deleted', 'đã xóa');
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

INSERT INTO linhfarm.user (id_user, username, password, role_id, fullname, address, status_id) VALUES (6, '0969069589', '$2a$10$fPf4IEBF59ZVMKIXC3HQK.EoWF5oJ8Vvynb8Y6af8M791ZCVZqpTK', 1, 'Admin', '22 Thành Thái', 1);

create table category
(
    id_category   int auto_increment
        primary key,
    category_name varchar(150) not null
)
    charset = utf8mb4;

INSERT INTO linhfarm.category (id_category, category_name) VALUES (1, 'Trái cây theo mùa ');
INSERT INTO linhfarm.category (id_category, category_name) VALUES (2, 'Mật Ong ');
INSERT INTO linhfarm.category (id_category, category_name) VALUES (20, 'Trà ');
INSERT INTO linhfarm.category (id_category, category_name) VALUES (21, 'Nấm');
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

INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (1, 'Bưởi da xanh', '👉 Bưởi da xanh Bến Tre thanh ngọt, giàu vitamin', 39000, 21, 'KG', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (2, 'Xoài Cát HL - Cao Lãnh', '👉 Tuyệt vời ông mặt trời <br> 👉 Xoài xanh chấm muối ớt hết xảy <br> 👉 Xoài trái siêu to khổng lồ', 39000, 1, 'KG', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (3, 'Cam Sành', 'Cam sành Vĩnh Long mọng nước', 29000, 1, 'KG', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (8, 'Dưa lưới hữu cơ', 'Dưa lưới thanh mát', 49000, 1, 'KG', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (23, 'Sầu riêng Ri6', 'Sầu riêng Ri6 Tiền Giang. Thơm bùi ngọt thanh', 109000, 20, 'Kg', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (32, 'Mận Hà Nội', 'Mận Hà Nội', 99000, 1, 'Kg', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (33, 'Chôm chôm Thái', 'Chôm chôm ngọt thanh', 39000, 1, 'KG', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (34, 'Nhãn Xuồng', 'Nhãn xuồng cơm vàng ngọt thanh', 49000, 1, 'KG', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (35, 'Nấm Mỡ', 'Sản phẩm độc quyền. Nấm Mỡ đặc biệt sản xuất theo công nghệ Nhật Bản duy nhất tại Lâm Đồng - Việt Nam.', 70000, 21, 'Hộp 300g', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (37, 'Mật ong rừng', 'Mật ong rừng vùng núi Việt Nam. Vị thuốc dân gian từ ngàn xưa.', 400000, 2, 'chai 5l', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (38, 'Quả óc chó', 'Thơm ngon, tăng cường trí tuệ', 70000, 2, 'Hộp', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (39, 'Trà quế thảo mộc', 'Sản phẩm trà quế túi lọc được chọn lọc từ những vỏ quế tốt nhất từ rừng Trà Bồng Quảng Ngãi, kết hợp hài hòa với các thảo mộc tự nhiên sẽ mang đến cho Bạn một tách trà thơm ngon, giúp thư giãn tinh thần vào tốt cho sức khỏe.', 172000, 20, 'Hộp', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (40, 'Trà Quế Cam Mật ', 'Sản phẩm Trà Quế Cam Mật Ong được chọn lọc từ những vỏ quế tốt nhất từ rừng Trà Bồng Quảng Ngãi, kết hợp hài hòa với các nguyên liệu thiên nhiên sẽ mang đến cho Bạn một tách trà thơm ngon, giúp thư giãn tinh thần vào tốt cho sức khỏe.<br> Sản phẩm đầu tiên và duy nhất trên thị trường kết hợp cả 3 trong 1 vô cùng tiện lợi (Trà quế - Cam - Mật ong).', 240000, 20, 'Hộp', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (41, 'Trà Nụ Vối', 'Trà nụ vối từ lâu đã được nhiều thế hệ dùng để nấu nước uống hằng ngày. Hãm trà uống hằng ngày có thể thay thế trà xanh, giúp ngon miệng hơn trong bữa cơm hằng ngày. <br>Thời gian gần đây, trà nụ vối ngày càng được nhiều người biết đến với những công dụng dành cho sức khỏe và hỗ trợ trị bệnh thần kỳ. ', 140000, 20, 'Gói 500g', 1);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (51, 'Mật ong ruồi ', 'ngon', 150000, 2, 'Lít', 8);
INSERT INTO linhfarm.product (id_product, product_name, description, product_price, category_id, sale_unit, status_id) VALUES (52, 'Dưa lưới vàng', 'dấdasds', 72000, 1, 'Kg', 8);

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

INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (71, 8, 'DuaLuoi.jpeg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (109, 40, 'zxcas.JPG');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (110, 40, 'zxcasd.JPG');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (111, 40, 'zxcs.JPG');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (112, 39, 'zxcm.jpeg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (113, 39, 'zxca.jpeg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (114, 41, 'zxcvasd.JPG');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (115, 41, 'zxcvbn.JPG');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (116, 41, 'zxcvbnm.JPG');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (117, 1, 'zxm.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (118, 1, 'zxn.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (119, 2, 'zc.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (120, 2, 'zx.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (121, 2, 'zv.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (122, 3, 'zo.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (123, 3, 'zxb.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (124, 3, 'zxv.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (125, 23, 'qwe.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (126, 23, 'qw.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (131, 33, 'zi.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (132, 33, 'zu.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (133, 33, 'zy.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (134, 34, 'zm.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (135, 34, 'zb.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (136, 34, 'zn.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (137, 35, 'zj.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (138, 35, 'zg.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (139, 35, 'zs.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (140, 37, 'zl.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (141, 37, 'zk.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (142, 38, 'zxcv.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (147, 32, 'zq.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (148, 32, 'zr.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (149, 32, 'zt.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (150, 32, 'zw.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (155, 51, 'MatOng.jpg');
INSERT INTO linhfarm.gallery (id_gallery, product_id, photo) VALUES (157, 52, 'Screen Shot 2022-06-11 at 22.43.22.png');

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
