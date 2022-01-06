package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "gallery", schema = "hiephoafarm")
public class GalleryE {
    private int idGallery;
    private String photo;
    private ProductE productByProductId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_gallery", nullable = false)
    public int getIdGallery() {
        return idGallery;
    }

    public void setIdGallery(int idGallery) {
        this.idGallery = idGallery;
    }

    @Basic
    @Column(name = "photo", nullable = false, length = 45)
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
        return idGallery == galleryE.idGallery && Objects.equals(photo, galleryE.photo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idGallery, photo);
    }

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id_product", nullable = false)
    public ProductE getProductByProductId() {
        return productByProductId;
    }

    public void setProductByProductId(ProductE productByProductId) {
        this.productByProductId = productByProductId;
    }
}
