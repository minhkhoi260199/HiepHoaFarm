package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "category", schema = "hiephoafarm")
public class CategoryE {
    private int idCategory;
    private String categoryName;
    private Collection<ProductE> productsByIdCategory;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_category", nullable = false)
    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    @Basic
    @Column(name = "category_name", nullable = false, length = 150)
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
        return idCategory == categoryE.idCategory && Objects.equals(categoryName, categoryE.categoryName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCategory, categoryName);
    }

    @OneToMany(mappedBy = "categoryByCategoryId")
    public Collection<ProductE> getProductsByIdCategory() {
        return productsByIdCategory;
    }

    public void setProductsByIdCategory(Collection<ProductE> productsByIdCategory) {
        this.productsByIdCategory = productsByIdCategory;
    }
}
