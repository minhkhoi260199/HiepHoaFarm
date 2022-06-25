package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "user", schema = "hiephoafarm", catalog = "")
public class UserE {
   private Integer idUser;
   private String username;
   private String password;
   private String fullname;
   private String address;
   private String email;
   private Collection<OrdersE> ordersByIdUser;
   private Collection<ReviewE> reviewsByIdUser;
   private RoleE roleByRoleId;
   private StatusE statusByStatusId;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_user", nullable = false)
   public Integer getIdUser() {
      return idUser;
   }

   public void setIdUser(Integer idUser) {
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

      UserE userE = (UserE) o;

      if (idUser != null ? !idUser.equals(userE.idUser) : userE.idUser != null) return false;
      if (username != null ? !username.equals(userE.username) : userE.username != null) return false;
      if (password != null ? !password.equals(userE.password) : userE.password != null) return false;
      if (fullname != null ? !fullname.equals(userE.fullname) : userE.fullname != null) return false;
      if (address != null ? !address.equals(userE.address) : userE.address != null) return false;
      if (email != null ? !email.equals(userE.email) : userE.email != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idUser != null ? idUser.hashCode() : 0;
      result = 31 * result + (username != null ? username.hashCode() : 0);
      result = 31 * result + (password != null ? password.hashCode() : 0);
      result = 31 * result + (fullname != null ? fullname.hashCode() : 0);
      result = 31 * result + (address != null ? address.hashCode() : 0);
      result = 31 * result + (email != null ? email.hashCode() : 0);
      return result;
   }

   @JsonBackReference
   @OneToMany(mappedBy = "userByUserId")
   public Collection<OrdersE> getOrdersByIdUser() {
      return ordersByIdUser;
   }

   public void setOrdersByIdUser(Collection<OrdersE> ordersByIdUser) {
      this.ordersByIdUser = ordersByIdUser;
   }

   @JsonBackReference
   @OneToMany(mappedBy = "userByUserId")
   public Collection<ReviewE> getReviewsByIdUser() {
      return reviewsByIdUser;
   }

   public void setReviewsByIdUser(Collection<ReviewE> reviewsByIdUser) {
      this.reviewsByIdUser = reviewsByIdUser;
   }

   @JsonManagedReference
   @ManyToOne
   @JoinColumn(name = "role_id", referencedColumnName = "id_role", nullable = false)
   public RoleE getRoleByRoleId() {
      return roleByRoleId;
   }

   public void setRoleByRoleId(RoleE roleByRoleId) {
      this.roleByRoleId = roleByRoleId;
   }

   @JsonManagedReference
   @ManyToOne
   @JoinColumn(name = "status_id", referencedColumnName = "id_status")
   public StatusE getStatusByStatusId() {
      return statusByStatusId;
   }

   public void setStatusByStatusId(StatusE statusByStatusId) {
      this.statusByStatusId = statusByStatusId;
   }
}
