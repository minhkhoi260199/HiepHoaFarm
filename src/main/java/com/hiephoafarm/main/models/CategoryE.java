package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "category", schema = "hiephoafarm", catalog = "")
public class CategoryE {
   private Integer idCategory;
   private String categoryName;
   private Collection<ProductE> productsByIdCategory;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_category", nullable = false)
   public Integer getIdCategory() {
      return idCategory;
   }

   public void setIdCategory(Integer idCategory) {
      this.idCategory = idCategory;
   }

   @Basic
   @Column(name = "category_name", nullable = true, length = 150)
   public String getCategoryName() {
      return categoryName;
   }

   public void setCategoryName(String categoryName) {
      this.categoryName = categoryName;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      CategoryE categoryE = (CategoryE) o;

      if (idCategory != null ? !idCategory.equals(categoryE.idCategory) : categoryE.idCategory != null) return false;
      if (categoryName != null ? !categoryName.equals(categoryE.categoryName) : categoryE.categoryName != null)
         return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idCategory != null ? idCategory.hashCode() : 0;
      result = 31 * result + (categoryName != null ? categoryName.hashCode() : 0);
      return result;
   }

   @JsonBackReference
   @OneToMany(mappedBy = "categoryByCategoryId")
   public Collection<ProductE> getProductsByIdCategory() {
      return productsByIdCategory;
   }

   public void setProductsByIdCategory(Collection<ProductE> productsByIdCategory) {
      this.productsByIdCategory = productsByIdCategory;
   }
}
