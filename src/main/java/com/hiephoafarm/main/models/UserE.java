package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "user", schema = "hiephoafarm")
public class UserE {
    private int idUser;
    private String username;
    private String password;
    private Collection<OrdersE> ordersByIdUser;
    private RoleE roleByRoleId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_user", nullable = false)
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Basic
    @Column(name = "username", nullable = false, length = 45)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 45)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserE userE = (UserE) o;
        return idUser == userE.idUser && Objects.equals(username, userE.username) && Objects.equals(password, userE.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idUser, username, password);
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<OrdersE> getOrdersByIdUser() {
        return ordersByIdUser;
    }

    public void setOrdersByIdUser(Collection<OrdersE> ordersByIdUser) {
        this.ordersByIdUser = ordersByIdUser;
    }

    @ManyToOne
    @JoinColumn(name = "role_id", referencedColumnName = "id_role", nullable = false)
    public RoleE getRoleByRoleId() {
        return roleByRoleId;
    }

    public void setRoleByRoleId(RoleE roleByRoleId) {
        this.roleByRoleId = roleByRoleId;
    }
}
