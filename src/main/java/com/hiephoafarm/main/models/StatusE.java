package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "status", schema = "hiephoafarm")
public class StatusE {
    private int idStatus;
    private String statusName;
    private Collection<OrdersE> ordersByIdStatus;

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
    @Column(name = "status_name", nullable = false, length = 45)
    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

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
}
