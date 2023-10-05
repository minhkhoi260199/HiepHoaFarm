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
