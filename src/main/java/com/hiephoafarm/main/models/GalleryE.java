package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
@Table(name = "gallery", schema = "hiephoafarm", catalog = "")
public class GalleryE {
   private Integer idGallery;
   private String photo;
   private ProductE productByProductId;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_gallery", nullable = false)
   public Integer getIdGallery() {
      return idGallery;
   }

   public void setIdGallery(Integer idGallery) {
      this.idGallery = idGallery;
   }

   @Basic
   @Column(name = "photo", nullable = true, length = 150)
   public String getPhoto() {
      return photo;
   }

   public void setPhoto(String photo) {
      this.photo = photo;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      GalleryE galleryE = (GalleryE) o;

      if (idGallery != null ? !idGallery.equals(galleryE.idGallery) : galleryE.idGallery != null) return false;
      if (photo != null ? !photo.equals(galleryE.photo) : galleryE.photo != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idGallery != null ? idGallery.hashCode() : 0;
      result = 31 * result + (photo != null ? photo.hashCode() : 0);
      return result;
   }
   @JsonBackReference
   @ManyToOne
   @JoinColumn(name = "product_id", referencedColumnName = "id_product", nullable = false)
   public ProductE getProductByProductId() {
      return productByProductId;
   }

   public void setProductByProductId(ProductE productByProductId) {
      this.productByProductId = productByProductId;
   }
}
