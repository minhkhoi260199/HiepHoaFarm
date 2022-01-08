package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "category", schema = "hiephoafarm")
public class CategoryView {
    private Integer idCategory;
    private String categoryName;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_category")
    public Integer getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(Integer idCategory) {
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
        CategoryView that = (CategoryView) o;
        return Objects.equals(idCategory, that.idCategory) && Objects.equals(categoryName, that.categoryName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCategory, categoryName);
    }
}
