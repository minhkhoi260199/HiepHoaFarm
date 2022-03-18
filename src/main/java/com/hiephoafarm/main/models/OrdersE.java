package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "orders", schema = "hiephoafarm", catalog = "")
public class OrdersE {
    private int idOrder;
    private String customerPhone;
    private String customerName;
    private String address;
    private int shippingFee;
    private int orderAmount;
    private Timestamp createdTime;
    private Collection<OrderDetailE> orderDetailsByIdOrder;
    private UserE userByUserId;
    private StatusE statusByStatusId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_order")
    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    @Basic
    @Column(name = "customer_phone")
    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    @Basic
    @Column(name = "customer_name")
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "shipping_fee")
    public int getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(int shippingFee) {
        this.shippingFee = shippingFee;
    }

    @Basic
    @Column(name = "order_amount")
    public int getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(int orderAmount) {
        this.orderAmount = orderAmount;
    }

    @Basic
    @Column(name = "created_time")
    @JsonFormat(pattern = "ss:mm:HH dd/MM/yyyy")
    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrdersE ordersE = (OrdersE) o;

        if (idOrder != ordersE.idOrder) return false;
        if (shippingFee != ordersE.shippingFee) return false;
        if (orderAmount != ordersE.orderAmount) return false;
        if (customerPhone != null ? !customerPhone.equals(ordersE.customerPhone) : ordersE.customerPhone != null)
            return false;
        if (customerName != null ? !customerName.equals(ordersE.customerName) : ordersE.customerName != null)
            return false;
        if (address != null ? !address.equals(ordersE.address) : ordersE.address != null) return false;
        if (createdTime != null ? !createdTime.equals(ordersE.createdTime) : ordersE.createdTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idOrder;
        result = 31 * result + (customerPhone != null ? customerPhone.hashCode() : 0);
        result = 31 * result + (customerName != null ? customerName.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + shippingFee;
        result = 31 * result + orderAmount;
        result = 31 * result + (createdTime != null ? createdTime.hashCode() : 0);
        return result;
    }

    @JsonManagedReference
    @OneToMany(mappedBy = "ordersByOrderId")
    public Collection<OrderDetailE> getOrderDetailsByIdOrder() {
        return orderDetailsByIdOrder;
    }

    public void setOrderDetailsByIdOrder(Collection<OrderDetailE> orderDetailsByIdOrder) {
        this.orderDetailsByIdOrder = orderDetailsByIdOrder;
    }

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id_user", nullable = false)
    public UserE getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserE userByUserId) {
        this.userByUserId = userByUserId;
    }

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "id_status", nullable = false)
    public StatusE getStatusByStatusId() {
        return statusByStatusId;
    }

    public void setStatusByStatusId(StatusE statusByStatusId) {
        this.statusByStatusId = statusByStatusId;
    }
}
