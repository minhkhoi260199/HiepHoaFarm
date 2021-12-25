package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Role {
    private int idRole;
    private String roleName;
    private Collection<User> usersByIdRole;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_role", nullable = false)
    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    @Basic
    @Column(name = "role_name", nullable = true, length = 45)
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Role role = (Role) o;
        return idRole == role.idRole && Objects.equals(roleName, role.roleName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idRole, roleName);
    }

    @OneToMany(mappedBy = "roleByRoleId")
    public Collection<User> getUsersByIdRole() {
        return usersByIdRole;
    }

    public void setUsersByIdRole(Collection<User> usersByIdRole) {
        this.usersByIdRole = usersByIdRole;
    }
}
