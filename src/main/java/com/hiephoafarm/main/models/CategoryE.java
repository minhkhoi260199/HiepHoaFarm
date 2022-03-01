package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "category", schema = "hiephoafarm", catalog = "")
public class CategoryE {
    private int idCategory;
    private String categoryName;
    private Collection<ProductE> productsByIdCategory;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_category")
    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    @Basic
    @Column(name = "category_name")
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

        if (idCategory != categoryE.idCategory) return false;
        if (categoryName != null ? !categoryName.equals(categoryE.categoryName) : categoryE.categoryName != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCategory;
        result = 31 * result + (categoryName != null ? categoryName.hashCode() : 0);
        return result;
    }

    @JsonManagedReference
    @OneToMany(mappedBy = "categoryByCategoryId")
    public Collection<ProductE> getProductsByIdCategory() {
        return productsByIdCategory;
    }

    public void setProductsByIdCategory(Collection<ProductE> productsByIdCategory) {
        this.productsByIdCategory = productsByIdCategory;
    }
}
