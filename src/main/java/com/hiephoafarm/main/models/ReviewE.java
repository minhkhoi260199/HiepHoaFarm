package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "review", schema = "hiephoafarm", catalog = "")
public class ReviewE {
   private Integer id;
   private Timestamp createdTime;
   private String content;
   private UserE userByUserId;
   private ProductE productByProductId;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id", nullable = false)
   public Integer getId() {
      return id;
   }

   public void setId(Integer id) {
      this.id = id;
   }

   @Basic
   @Column(name = "created_time", nullable = true)
   public Timestamp getCreatedTime() {
      return createdTime;
   }

   public void setCreatedTime(Timestamp createdTime) {
      this.createdTime = createdTime;
   }

   @Basic
   @Column(name = "content", nullable = true, length = 1000)
   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      ReviewE reviewE = (ReviewE) o;

      if (id != null ? !id.equals(reviewE.id) : reviewE.id != null) return false;
      if (createdTime != null ? !createdTime.equals(reviewE.createdTime) : reviewE.createdTime != null) return false;
      if (content != null ? !content.equals(reviewE.content) : reviewE.content != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = id != null ? id.hashCode() : 0;
      result = 31 * result + (createdTime != null ? createdTime.hashCode() : 0);
      result = 31 * result + (content != null ? content.hashCode() : 0);
      return result;
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

   @JsonBackReference
   @ManyToOne
   @JoinColumn(name = "product_id", referencedColumnName = "id_product")
   public ProductE getProductByProductId() {
      return productByProductId;
   }

   public void setProductByProductId(ProductE productByProductId) {
      this.productByProductId = productByProductId;
   }
}
