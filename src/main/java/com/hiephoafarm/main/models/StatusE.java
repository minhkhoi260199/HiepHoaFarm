package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "status", schema = "hiephoafarm", catalog = "")
public class StatusE {
   private Integer idStatus;
   private String statusName;
   private String statusNameVie;
   private Collection<OrdersE> ordersByIdStatus;
   private Collection<ProductE> productsByIdStatus;
   private Collection<UserE> usersByIdStatus;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_status", nullable = false)
   public Integer getIdStatus() {
      return idStatus;
   }

   public void setIdStatus(Integer idStatus) {
      this.idStatus = idStatus;
   }

   @Basic
   @Column(name = "status_name", nullable = true, length = 45)
   public String getStatusName() {
      return statusName;
   }

   public void setStatusName(String statusName) {
      this.statusName = statusName;
   }

   @Basic
   @Column(name = "status_nameVie", nullable = true, length = 45)
   public String getStatusNameVie() {
      return statusNameVie;
   }

   public void setStatusNameVie(String statusNameVie) {
      this.statusNameVie = statusNameVie;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      StatusE statusE = (StatusE) o;

      if (idStatus != null ? !idStatus.equals(statusE.idStatus) : statusE.idStatus != null) return false;
      if (statusName != null ? !statusName.equals(statusE.statusName) : statusE.statusName != null) return false;
      if (statusNameVie != null ? !statusNameVie.equals(statusE.statusNameVie) : statusE.statusNameVie != null)
         return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idStatus != null ? idStatus.hashCode() : 0;
      result = 31 * result + (statusName != null ? statusName.hashCode() : 0);
      result = 31 * result + (statusNameVie != null ? statusNameVie.hashCode() : 0);
      return result;
   }

   @JsonBackReference
   @OneToMany(mappedBy = "statusByStatusId")
   public Collection<OrdersE> getOrdersByIdStatus() {
      return ordersByIdStatus;
   }

   public void setOrdersByIdStatus(Collection<OrdersE> ordersByIdStatus) {
      this.ordersByIdStatus = ordersByIdStatus;
   }

   @JsonBackReference
   @OneToMany(mappedBy = "statusByStatusId")
   public Collection<ProductE> getProductsByIdStatus() {
      return productsByIdStatus;
   }

   public void setProductsByIdStatus(Collection<ProductE> productsByIdStatus) {
      this.productsByIdStatus = productsByIdStatus;
   }

   @JsonBackReference
   @OneToMany(mappedBy = "statusByStatusId")
   public Collection<UserE> getUsersByIdStatus() {
      return usersByIdStatus;
   }

   public void setUsersByIdStatus(Collection<UserE> usersByIdStatus) {
      this.usersByIdStatus = usersByIdStatus;
   }
}
