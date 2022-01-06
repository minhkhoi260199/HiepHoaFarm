package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "product", schema = "hiephoafarm")
public class ProductE {
    private int idProduct;
    private String productName;
    private String description;
    private int productPrice;
    private Collection<GalleryE> galleriesByIdProduct;
    private Collection<OrderDetailE> orderDetailsByIdProduct;
    private CategoryE categoryByCategoryId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_product", nullable = false)
    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    @Basic
    @Column(name = "product_name", nullable = false, length = 120)
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Basic
    @Column(name = "description", nullable = false, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "product_price", nullable = false)
    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductE productE = (ProductE) o;
        return idProduct == productE.idProduct && productPrice == productE.productPrice && Objects.equals(productName, productE.productName) && Objects.equals(description, productE.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProduct, productName, description, productPrice);
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<GalleryE> getGalleriesByIdProduct() {
        return galleriesByIdProduct;
    }

    public void setGalleriesByIdProduct(Collection<GalleryE> galleriesByIdProduct) {
        this.galleriesByIdProduct = galleriesByIdProduct;
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<OrderDetailE> getOrderDetailsByIdProduct() {
        return orderDetailsByIdProduct;
    }

    public void setOrderDetailsByIdProduct(Collection<OrderDetailE> orderDetailsByIdProduct) {
        this.orderDetailsByIdProduct = orderDetailsByIdProduct;
    }

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "id_category", nullable = false)
    public CategoryE getCategoryByCategoryId() {
        return categoryByCategoryId;
    }

    public void setCategoryByCategoryId(CategoryE categoryByCategoryId) {
        this.categoryByCategoryId = categoryByCategoryId;
    }
}
