package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "gallery", schema = "hiephoafarm", catalog = "")
public class GalleryObj {
    private Integer idGallery;
    private Integer productId;
    private String photo;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_gallery")
    public Integer getIdGallery() {
        return idGallery;
    }

    public void setIdGallery(Integer idGallery) {
        this.idGallery = idGallery;
    }

    @Basic
    @Column(name = "product_id")
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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
        GalleryObj that = (GalleryObj) o;
        return Objects.equals(idGallery, that.idGallery) && Objects.equals(productId, that.productId) && Objects.equals(photo, that.photo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idGallery, productId, photo);
    }
}
