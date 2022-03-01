package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "status", schema = "hiephoafarm", catalog = "")
public class StatusE {
    private int idStatus;
    private String statusName;
    private String statusNamevie;
    private Collection<OrdersE> ordersByIdStatus;
    private Collection<ProductE> productsByIdStatus;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_status")
    public int getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    @Basic
    @Column(name = "status_name")
    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    @Basic
    @Column(name = "status_nameVie")
    public String getStatusNamevie() {
        return statusNamevie;
    }

    public void setStatusNamevie(String statusNamevie) {
        this.statusNamevie = statusNamevie;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StatusE statusE = (StatusE) o;

        if (idStatus != statusE.idStatus) return false;
        if (statusName != null ? !statusName.equals(statusE.statusName) : statusE.statusName != null) return false;
        if (statusNamevie != null ? !statusNamevie.equals(statusE.statusNamevie) : statusE.statusNamevie != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idStatus;
        result = 31 * result + (statusName != null ? statusName.hashCode() : 0);
        result = 31 * result + (statusNamevie != null ? statusNamevie.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "statusByStatusId")
    public Collection<OrdersE> getOrdersByIdStatus() {
        return ordersByIdStatus;
    }

    public void setOrdersByIdStatus(Collection<OrdersE> ordersByIdStatus) {
        this.ordersByIdStatus = ordersByIdStatus;
    }

    @JsonManagedReference
    @OneToMany(mappedBy = "statusByStatusId")
    public Collection<ProductE> getProductsByIdStatus() {
        return productsByIdStatus;
    }

    public void setProductsByIdStatus(Collection<ProductE> productsByIdStatus) {
        this.productsByIdStatus = productsByIdStatus;
    }
}
