package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Product {
    private int idProduct;
    private String productName;
    private String description;
    private Integer productPrice;
    private Collection<Gallery> galleriesByIdProduct;
    private Collection<OrderDetail> orderDetailsByIdProduct;
    private Category categoryByCategoryId;

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
    @Column(name = "product_name", nullable = true, length = 45)
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Basic
    @Column(name = "description", nullable = true, length = 45)
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return idProduct == product.idProduct && Objects.equals(productName, product.productName) && Objects.equals(description, product.description) && Objects.equals(productPrice, product.productPrice);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProduct, productName, description, productPrice);
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<Gallery> getGalleriesByIdProduct() {
        return galleriesByIdProduct;
    }

    public void setGalleriesByIdProduct(Collection<Gallery> galleriesByIdProduct) {
        this.galleriesByIdProduct = galleriesByIdProduct;
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<OrderDetail> getOrderDetailsByIdProduct() {
        return orderDetailsByIdProduct;
    }

    public void setOrderDetailsByIdProduct(Collection<OrderDetail> orderDetailsByIdProduct) {
        this.orderDetailsByIdProduct = orderDetailsByIdProduct;
    }

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "id_category", nullable = false)
    public Category getCategoryByCategoryId() {
        return categoryByCategoryId;
    }

    public void setCategoryByCategoryId(Category categoryByCategoryId) {
        this.categoryByCategoryId = categoryByCategoryId;
    }
}
