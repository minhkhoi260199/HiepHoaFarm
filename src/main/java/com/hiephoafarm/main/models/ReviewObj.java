package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "review", schema = "hiephoafarm", catalog = "")
public class ReviewObj {
   private Integer id;
   private Timestamp createdTime;
   private Integer userId;
   private Integer productId;
   private String content;

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
   @CreationTimestamp
   @Column(name = "created_time", nullable = true)
   @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "ss:mm:HH dd/MM/yyyy")
   public Timestamp getCreatedTime() {
      return createdTime;
   }

   public void setCreatedTime(Timestamp createdTime) {
      this.createdTime = createdTime;
   }

   @Basic
   @Column(name = "user_id", nullable = true)
   public Integer getUserId() {
      return userId;
   }

   public void setUserId(Integer userId) {
      this.userId = userId;
   }

   @Basic
   @Column(name = "product_id", nullable = true)
   public Integer getProductId() {
      return productId;
   }

   public void setProductId(Integer productId) {
      this.productId = productId;
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

      ReviewObj reviewObj = (ReviewObj) o;

      if (id != null ? !id.equals(reviewObj.id) : reviewObj.id != null) return false;
      if (createdTime != null ? !createdTime.equals(reviewObj.createdTime) : reviewObj.createdTime != null)
         return false;
      if (userId != null ? !userId.equals(reviewObj.userId) : reviewObj.userId != null) return false;
      if (productId != null ? !productId.equals(reviewObj.productId) : reviewObj.productId != null) return false;
      if (content != null ? !content.equals(reviewObj.content) : reviewObj.content != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = id != null ? id.hashCode() : 0;
      result = 31 * result + (createdTime != null ? createdTime.hashCode() : 0);
      result = 31 * result + (userId != null ? userId.hashCode() : 0);
      result = 31 * result + (productId != null ? productId.hashCode() : 0);
      result = 31 * result + (content != null ? content.hashCode() : 0);
      return result;
   }
}
