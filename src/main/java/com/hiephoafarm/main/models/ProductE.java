package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "product", schema = "hiephoafarm", catalog = "")
public class ProductE {
   private Integer idProduct;
   private String productName;
   private String description;
   private Integer productPrice;
   private String saleUnit;
   private Timestamp createdTime;
   private Collection<GalleryE> galleriesByIdProduct;
   private Collection<OrderDetailE> orderDetailsByIdProduct;
   private CategoryE categoryByCategoryId;
   private StatusE statusByStatusId;
   private Collection<ReviewE> reviewsByIdProduct;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_product", nullable = false)
   public Integer getIdProduct() {
      return idProduct;
   }

   public void setIdProduct(Integer idProduct) {
      this.idProduct = idProduct;
   }

   @Basic
   @Column(name = "product_name", nullable = false, length = 150)
   public String getProductName() {
      return productName;
   }

   public void setProductName(String productName) {
      this.productName = productName;
   }

   @Basic
   @Column(name = "description", nullable = true, length = -1)
   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   @Basic
   @Column(name = "product_price", nullable = true)
   public Integer getProductPrice() {
      return productPrice;
   }

   public void setProductPrice(Integer productPrice) {
      this.productPrice = productPrice;
   }

   @Basic
   @Column(name = "sale_unit", nullable = true, length = 45)
   public String getSaleUnit() {
      return saleUnit;
   }

   public void setSaleUnit(String saleUnit) {
      this.saleUnit = saleUnit;
   }

   @Basic
   @Column(name = "created_time", nullable = true)
   public Timestamp getCreatedTime() {
      return createdTime;
   }

   public void setCreatedTime(Timestamp createdTime) {
      this.createdTime = createdTime;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      ProductE productE = (ProductE) o;

      if (idProduct != null ? !idProduct.equals(productE.idProduct) : productE.idProduct != null) return false;
      if (productName != null ? !productName.equals(productE.productName) : productE.productName != null) return false;
      if (description != null ? !description.equals(productE.description) : productE.description != null) return false;
      if (productPrice != null ? !productPrice.equals(productE.productPrice) : productE.productPrice != null)
         return false;
      if (saleUnit != null ? !saleUnit.equals(productE.saleUnit) : productE.saleUnit != null) return false;
      if (createdTime != null ? !createdTime.equals(productE.createdTime) : productE.createdTime != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idProduct != null ? idProduct.hashCode() : 0;
      result = 31 * result + (productName != null ? productName.hashCode() : 0);
      result = 31 * result + (description != null ? description.hashCode() : 0);
      result = 31 * result + (productPrice != null ? productPrice.hashCode() : 0);
      result = 31 * result + (saleUnit != null ? saleUnit.hashCode() : 0);
      result = 31 * result + (createdTime != null ? createdTime.hashCode() : 0);
      return result;
   }

   @JsonManagedReference
   @OneToMany(mappedBy = "productByProductId")
   public Collection<GalleryE> getGalleriesByIdProduct() {
      return galleriesByIdProduct;
   }

   public void setGalleriesByIdProduct(Collection<GalleryE> galleriesByIdProduct) {
      this.galleriesByIdProduct = galleriesByIdProduct;
   }

   @JsonBackReference
   @OneToMany(mappedBy = "productByProductId")
   public Collection<OrderDetailE> getOrderDetailsByIdProduct() {
      return orderDetailsByIdProduct;
   }

   public void setOrderDetailsByIdProduct(Collection<OrderDetailE> orderDetailsByIdProduct) {
      this.orderDetailsByIdProduct = orderDetailsByIdProduct;
   }

   @JsonManagedReference
   @ManyToOne
   @JoinColumn(name = "category_id", referencedColumnName = "id_category")
   public CategoryE getCategoryByCategoryId() {
      return categoryByCategoryId;
   }

   public void setCategoryByCategoryId(CategoryE categoryByCategoryId) {
      this.categoryByCategoryId = categoryByCategoryId;
   }

   @JsonManagedReference
   @ManyToOne
   @JoinColumn(name = "status_id", referencedColumnName = "id_status", nullable = false)
   public StatusE getStatusByStatusId() {
      return statusByStatusId;
   }

   public void setStatusByStatusId(StatusE statusByStatusId) {
      this.statusByStatusId = statusByStatusId;
   }

   @JsonManagedReference
   @OneToMany(mappedBy = "productByProductId")
   public Collection<ReviewE> getReviewsByIdProduct() {
      return reviewsByIdProduct;
   }

   public void setReviewsByIdProduct(Collection<ReviewE> reviewsByIdProduct) {
      this.reviewsByIdProduct = reviewsByIdProduct;
   }
}
