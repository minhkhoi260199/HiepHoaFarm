package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Status {
    private int idStatus;
    private String statusName;
    private String statusColor;
    private Collection<Order> ordersByIdStatus;

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
    @Column(name = "status_name", nullable = true, length = 45)
    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    @Basic
    @Column(name = "status_color", nullable = true, length = 45)
    public String getStatusColor() {
        return statusColor;
    }

    public void setStatusColor(String statusColor) {
        this.statusColor = statusColor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Status status = (Status) o;
        return idStatus == status.idStatus && Objects.equals(statusName, status.statusName) && Objects.equals(statusColor, status.statusColor);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idStatus, statusName, statusColor);
    }

    @OneToMany(mappedBy = "statusByStatusId")
    public Collection<Order> getOrdersByIdStatus() {
        return ordersByIdStatus;
    }

    public void setOrdersByIdStatus(Collection<Order> ordersByIdStatus) {
        this.ordersByIdStatus = ordersByIdStatus;
    }
}
