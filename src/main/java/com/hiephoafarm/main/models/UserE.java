package com.hiephoafarm.main.models;

import javax.persistence.*;

@Entity
@Table(name = "user", schema = "hiephoafarm", catalog = "")
public class UserE {
   private int idUser;
   private String username;
   private String password;
   private String fullname;
   private String address;
   private RoleE roleByRoleId;
   private StatusE statusByStatusId;

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
   @Column(name = "password", nullable = false, length = 64)
   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   @Basic
   @Column(name = "fullname", nullable = true, length = 45)
   public String getFullname() {
      return fullname;
   }

   public void setFullname(String fullname) {
      this.fullname = fullname;
   }

   @Basic
   @Column(name = "address", nullable = true, length = 150)
   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      UserE userE = (UserE) o;

      if (idUser != userE.idUser) return false;
      if (username != null ? !username.equals(userE.username) : userE.username != null) return false;
      if (password != null ? !password.equals(userE.password) : userE.password != null) return false;
      if (fullname != null ? !fullname.equals(userE.fullname) : userE.fullname != null) return false;
      if (address != null ? !address.equals(userE.address) : userE.address != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idUser;
      result = 31 * result + (username != null ? username.hashCode() : 0);
      result = 31 * result + (password != null ? password.hashCode() : 0);
      result = 31 * result + (fullname != null ? fullname.hashCode() : 0);
      result = 31 * result + (address != null ? address.hashCode() : 0);
      return result;
   }

   @ManyToOne
   @JoinColumn(name = "role_id", referencedColumnName = "id_role", nullable = false)
   public RoleE getRoleByRoleId() {
      return roleByRoleId;
   }

   public void setRoleByRoleId(RoleE roleByRoleId) {
      this.roleByRoleId = roleByRoleId;
   }

   @ManyToOne
   @JoinColumn(name = "status_id", referencedColumnName = "id_status")
   public StatusE getStatusByStatusId() {
      return statusByStatusId;
   }

   public void setStatusByStatusId(StatusE statusByStatusId) {
      this.statusByStatusId = statusByStatusId;
   }
}
