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
