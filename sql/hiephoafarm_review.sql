create table review
(
    id           int auto_increment
        primary key,
    created_time datetime default current_timestamp() null,
    user_id      int                                  null,
    product_id   int                                  null,
    content      varchar(1000) charset utf8mb3        null,
    constraint review_ibfk_1
        foreign key (user_id) references user (id_user),
    constraint review_ibfk_2
        foreign key (product_id) references product (id_product)
);

INSERT INTO hiephoafarm.review (id, created_time, user_id, product_id, content) VALUES (1, null, 22, 41, 'Test 01');
INSERT INTO hiephoafarm.review (id, created_time, user_id, product_id, content) VALUES (2, '2022-06-25 08:48:00', 22, 41, 'Linh chó điên');
INSERT INTO hiephoafarm.review (id, created_time, user_id, product_id, content) VALUES (3, '2022-06-25 08:54:43', 22, 41, 'Linh chó điên');
