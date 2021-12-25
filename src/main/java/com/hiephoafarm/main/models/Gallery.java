package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Gallery {
    private int idGallery;
    private String photo;
    private Product productByProductId;

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
    @Column(name = "photo", nullable = true, length = 45)
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
        Gallery gallery = (Gallery) o;
        return idGallery == gallery.idGallery && Objects.equals(photo, gallery.photo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idGallery, photo);
    }

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id_product", nullable = false)
    public Product getProductByProductId() {
        return productByProductId;
    }

    public void setProductByProductId(Product productByProductId) {
        this.productByProductId = productByProductId;
    }
}
