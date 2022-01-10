package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

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
    @Column(name = "id_status", nullable = false)
    public int getIdStatus() {
        return idStatus;
    }
    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    @Basic
    @Column(name = "status_name", length = 45)
    public String getStatusName() {
        return statusName;
    }
    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    @Basic
    @Column(name = "status_nameVie", length = 45)
    public String getStatusNamevie() {return statusNamevie; }
    public void setStatusNamevie(String statusNamevie) {this.statusNamevie = statusNamevie;}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StatusE statusE = (StatusE) o;
        return idStatus == statusE.idStatus && Objects.equals(statusName, statusE.statusName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idStatus, statusName);
    }

    @OneToMany(mappedBy = "statusByStatusId")
    public Collection<OrdersE> getOrdersByIdStatus() {
        return ordersByIdStatus;
    }

    public void setOrdersByIdStatus(Collection<OrdersE> ordersByIdStatus) {
        this.ordersByIdStatus = ordersByIdStatus;
    }

    @OneToMany(mappedBy = "statusByStatusId")
    public Collection<ProductE> getProductsByIdStatus() {
        return productsByIdStatus;
    }

    public void setProductsByIdStatus(Collection<ProductE> productsByIdStatus) {
        this.productsByIdStatus = productsByIdStatus;
    }
}
