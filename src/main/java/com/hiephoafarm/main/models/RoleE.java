package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "role", schema = "hiephoafarm", catalog = "")
public class RoleE {
    private int idRole;
    private String roleName;
    private Collection<UserE> usersByIdRole;

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
    @Column(name = "role_name", nullable = false, length = 45)
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
        RoleE roleE = (RoleE) o;
        return idRole == roleE.idRole && Objects.equals(roleName, roleE.roleName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idRole, roleName);
    }

    @OneToMany(mappedBy = "roleByRoleId")
    public Collection<UserE> getUsersByIdRole() {
        return usersByIdRole;
    }

    public void setUsersByIdRole(Collection<UserE> usersByIdRole) {
        this.usersByIdRole = usersByIdRole;
    }
}
