package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
@Table(name = "gallery", schema = "hiephoafarm", catalog = "")
public class GalleryE {
    private int idGallery;
    private String photo;
    private ProductE productByProductId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_gallery")
    public int getIdGallery() {
        return idGallery;
    }

    public void setIdGallery(int idGallery) {
        this.idGallery = idGallery;
    }

    @Basic
    @Column(name = "photo")
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

        if (idGallery != galleryE.idGallery) return false;
        if (photo != null ? !photo.equals(galleryE.photo) : galleryE.photo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idGallery;
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
