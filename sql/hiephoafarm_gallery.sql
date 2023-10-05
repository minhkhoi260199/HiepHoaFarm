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
