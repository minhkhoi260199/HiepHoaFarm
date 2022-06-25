package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;

@Entity
@Table(name = "order_detail", schema = "hiephoafarm", catalog = "")
public class OrderDetailE {
   private Integer idOrderDetail;
   private Integer quantity;
   private ProductE productByProductId;
   private OrdersE ordersByOrderId;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "Id_order_detail", nullable = false)
   public Integer getIdOrderDetail() {
      return idOrderDetail;
   }

   public void setIdOrderDetail(Integer idOrderDetail) {
      this.idOrderDetail = idOrderDetail;
   }

   @Basic
   @Column(name = "quantity", nullable = true)
   public Integer getQuantity() {
      return quantity;
   }

   public void setQuantity(Integer quantity) {
      this.quantity = quantity;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      OrderDetailE that = (OrderDetailE) o;

      if (idOrderDetail != null ? !idOrderDetail.equals(that.idOrderDetail) : that.idOrderDetail != null) return false;
      if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idOrderDetail != null ? idOrderDetail.hashCode() : 0;
      result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
      return result;
   }

   @JsonManagedReference
   @ManyToOne
   @JoinColumn(name = "product_id", referencedColumnName = "id_product", nullable = false)
   public ProductE getProductByProductId() {
      return productByProductId;
   }

   public void setProductByProductId(ProductE productByProductId) {
      this.productByProductId = productByProductId;
   }

   @JsonBackReference
   @ManyToOne
   @JoinColumn(name = "order_id", referencedColumnName = "id_order", nullable = false)
   public OrdersE getOrdersByOrderId() {
      return ordersByOrderId;
   }

   public void setOrdersByOrderId(OrdersE ordersByOrderId) {
      this.ordersByOrderId = ordersByOrderId;
   }
}
