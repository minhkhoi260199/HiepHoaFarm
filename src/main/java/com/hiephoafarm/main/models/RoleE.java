package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "role", schema = "hiephoafarm", catalog = "")
public class RoleE {
   private Integer idRole;
   private String roleName;
   private Collection<UserE> usersByIdRole;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_role", nullable = false)
   public Integer getIdRole() {
      return idRole;
   }

   public void setIdRole(Integer idRole) {
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

      if (idRole != null ? !idRole.equals(roleE.idRole) : roleE.idRole != null) return false;
      if (roleName != null ? !roleName.equals(roleE.roleName) : roleE.roleName != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idRole != null ? idRole.hashCode() : 0;
      result = 31 * result + (roleName != null ? roleName.hashCode() : 0);
      return result;
   }

   @JsonBackReference
   @OneToMany(mappedBy = "roleByRoleId")
   public Collection<UserE> getUsersByIdRole() {
      return usersByIdRole;
   }

   public void setUsersByIdRole(Collection<UserE> usersByIdRole) {
      this.usersByIdRole = usersByIdRole;
   }
}
