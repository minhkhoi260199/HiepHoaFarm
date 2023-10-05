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
