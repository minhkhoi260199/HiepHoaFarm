package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "user", schema = "hiephoafarm", catalog = "")
public class UserE {
    private int idUser;
    private String username;
    private String password;
    private Collection<OrdersE> ordersByIdUser;
    private RoleE roleByRoleId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_user")
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password")
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

        if (idUser != userE.idUser) return false;
        if (username != null ? !username.equals(userE.username) : userE.username != null) return false;
        if (password != null ? !password.equals(userE.password) : userE.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idUser;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }

    @JsonManagedReference
    @OneToMany(mappedBy = "userByUserId")
    public Collection<OrdersE> getOrdersByIdUser() {
        return ordersByIdUser;
    }

    public void setOrdersByIdUser(Collection<OrdersE> ordersByIdUser) {
        this.ordersByIdUser = ordersByIdUser;
    }

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "role_id", referencedColumnName = "id_role", nullable = false)
    public RoleE getRoleByRoleId() {
        return roleByRoleId;
    }

    public void setRoleByRoleId(RoleE roleByRoleId) {
        this.roleByRoleId = roleByRoleId;
    }
}
