package com.hiephoafarm.main.models;

import javax.persistence.*;

@Entity
@Table(name = "user", schema = "hiephoafarm", catalog = "")
public class UserObj {
   private int idUser;
   private String username;
   private String password;
   private int roleId;
   private String fullname;
   private String address;
   private Integer statusId;
   private String email;

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
   @Column(name = "role_id", nullable = false)
   public int getRoleId() {
      return roleId;
   }

   public void setRoleId(int roleId) {
      this.roleId = roleId;
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

   @Basic
   @Column(name = "status_id", nullable = true)
   public Integer getStatusId() {
      return statusId;
   }

   public void setStatusId(Integer statusId) {
      this.statusId = statusId;
   }

   @Basic
   @Column(name = "email", nullable = true, length = 50)
   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      UserObj userObj = (UserObj) o;

      if (idUser != userObj.idUser) return false;
      if (roleId != userObj.roleId) return false;
      if (username != null ? !username.equals(userObj.username) : userObj.username != null) return false;
      if (password != null ? !password.equals(userObj.password) : userObj.password != null) return false;
      if (fullname != null ? !fullname.equals(userObj.fullname) : userObj.fullname != null) return false;
      if (address != null ? !address.equals(userObj.address) : userObj.address != null) return false;
      if (statusId != null ? !statusId.equals(userObj.statusId) : userObj.statusId != null) return false;
      if (email != null ? !email.equals(userObj.email) : userObj.email != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idUser;
      result = 31 * result + (username != null ? username.hashCode() : 0);
      result = 31 * result + (password != null ? password.hashCode() : 0);
      result = 31 * result + roleId;
      result = 31 * result + (fullname != null ? fullname.hashCode() : 0);
      result = 31 * result + (address != null ? address.hashCode() : 0);
      result = 31 * result + (statusId != null ? statusId.hashCode() : 0);
      result = 31 * result + (email != null ? email.hashCode() : 0);
      return result;
   }
}
