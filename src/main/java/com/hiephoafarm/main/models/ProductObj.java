package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "product", schema = "hiephoafarm", catalog = "")
public class ProductObj {
    private Integer idProduct;
    private String productName;
    private String description;
    private Integer productPrice;
    private Integer categoryId;
    private String saleUnit;
    private Integer statusId;
   private Timestamp createdTime;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_product")
    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    @Basic
    @Column(name = "product_name")
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "product_price")
    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    @Basic
    @Column(name = "category_id")
    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "sale_unit")
    public String getSaleUnit() {
        return saleUnit;
    }

    public void setSaleUnit(String saleUnit) {
        this.saleUnit = saleUnit;
    }

    @Basic
    @Column(name = "status_id")
    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductObj that = (ProductObj) o;
        return Objects.equals(idProduct, that.idProduct) && Objects.equals(productName, that.productName) && Objects.equals(description, that.description) && Objects.equals(productPrice, that.productPrice) && Objects.equals(categoryId, that.categoryId) && Objects.equals(saleUnit, that.saleUnit) && Objects.equals(statusId, that.statusId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProduct, productName, description, productPrice, categoryId, saleUnit, statusId);
    }

   @Basic
   @CreationTimestamp
   @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "ss:mm:HH dd/MM/yyyy")
   @Column(name = "created_time")
   public Timestamp getCreatedTime() {
      return createdTime;
   }

   public void setCreatedTime(Timestamp createdTime) {
      this.createdTime = createdTime;
   }
}
