package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "orders", schema = "hiephoafarm", catalog = "")
public class OrdersE {
   private Integer idOrder;
   private String customerPhone;
   private String customerName;
   private String address;
   private Integer shippingFee;
   private Integer orderAmount;
   private Timestamp createdTime;
   private String customerEmail;
   private Collection<OrderDetailE> orderDetailsByIdOrder;
   private UserE userByUserId;
   private StatusE statusByStatusId;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_order", nullable = false)
   public Integer getIdOrder() {
      return idOrder;
   }

   public void setIdOrder(Integer idOrder) {
      this.idOrder = idOrder;
   }

   @Basic
   @Column(name = "customer_phone", nullable = true, length = 11)
   public String getCustomerPhone() {
      return customerPhone;
   }

   public void setCustomerPhone(String customerPhone) {
      this.customerPhone = customerPhone;
   }

   @Basic
   @Column(name = "customer_name", nullable = true, length = 45)
   public String getCustomerName() {
      return customerName;
   }

   public void setCustomerName(String customerName) {
      this.customerName = customerName;
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
   @Column(name = "shipping_fee", nullable = false)
   public Integer getShippingFee() {
      return shippingFee;
   }

   public void setShippingFee(Integer shippingFee) {
      this.shippingFee = shippingFee;
   }

   @Basic
   @Column(name = "order_amount", nullable = true)
   public Integer getOrderAmount() {
      return orderAmount;
   }

   public void setOrderAmount(Integer orderAmount) {
      this.orderAmount = orderAmount;
   }

   @Basic
   @Column(name = "created_time", nullable = false)
   public Timestamp getCreatedTime() {
      return createdTime;
   }

   public void setCreatedTime(Timestamp createdTime) {
      this.createdTime = createdTime;
   }

   @Basic
   @Column(name = "customer_email", nullable = true, length = 50)
   public String getCustomerEmail() {
      return customerEmail;
   }

   public void setCustomerEmail(String customerEmail) {
      this.customerEmail = customerEmail;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      OrdersE ordersE = (OrdersE) o;

      if (idOrder != null ? !idOrder.equals(ordersE.idOrder) : ordersE.idOrder != null) return false;
      if (customerPhone != null ? !customerPhone.equals(ordersE.customerPhone) : ordersE.customerPhone != null)
         return false;
      if (customerName != null ? !customerName.equals(ordersE.customerName) : ordersE.customerName != null)
         return false;
      if (address != null ? !address.equals(ordersE.address) : ordersE.address != null) return false;
      if (shippingFee != null ? !shippingFee.equals(ordersE.shippingFee) : ordersE.shippingFee != null) return false;
      if (orderAmount != null ? !orderAmount.equals(ordersE.orderAmount) : ordersE.orderAmount != null) return false;
      if (createdTime != null ? !createdTime.equals(ordersE.createdTime) : ordersE.createdTime != null) return false;
      if (customerEmail != null ? !customerEmail.equals(ordersE.customerEmail) : ordersE.customerEmail != null)
         return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idOrder != null ? idOrder.hashCode() : 0;
      result = 31 * result + (customerPhone != null ? customerPhone.hashCode() : 0);
      result = 31 * result + (customerName != null ? customerName.hashCode() : 0);
      result = 31 * result + (address != null ? address.hashCode() : 0);
      result = 31 * result + (shippingFee != null ? shippingFee.hashCode() : 0);
      result = 31 * result + (orderAmount != null ? orderAmount.hashCode() : 0);
      result = 31 * result + (createdTime != null ? createdTime.hashCode() : 0);
      result = 31 * result + (customerEmail != null ? customerEmail.hashCode() : 0);
      return result;
   }

   @JsonManagedReference
   @OneToMany(mappedBy = "ordersByOrderId")
   public Collection<OrderDetailE> getOrderDetailsByIdOrder() {
      return orderDetailsByIdOrder;
   }

   public void setOrderDetailsByIdOrder(Collection<OrderDetailE> orderDetailsByIdOrder) {
      this.orderDetailsByIdOrder = orderDetailsByIdOrder;
   }

   @JsonManagedReference
   @ManyToOne
   @JoinColumn(name = "user_id", referencedColumnName = "id_user")
   public UserE getUserByUserId() {
      return userByUserId;
   }

   public void setUserByUserId(UserE userByUserId) {
      this.userByUserId = userByUserId;
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
