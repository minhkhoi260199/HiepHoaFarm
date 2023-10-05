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
