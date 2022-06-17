package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "orders", schema = "hiephoafarm", catalog = "")
public class OrdersObj {
    private int idOrder;
    private String customerPhone;
    private String customerName;
    private String address;
    private int shippingFee;
    private int orderAmount;
    private Timestamp createdTime;
    private Integer userId;
    private int statusId;
    private String customerEmail;

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
    @Column(name = "customer_email")
    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
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
    @CreationTimestamp
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "ss:mm:HH dd/MM/yyyy")
    @Column(name = "created_time")
    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    @Basic
    @Column(name = "user_id", nullable = true)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "status_id")
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrdersObj ordersObj = (OrdersObj) o;

        if (idOrder != ordersObj.idOrder) return false;
        if (shippingFee != ordersObj.shippingFee) return false;
        if (orderAmount != ordersObj.orderAmount) return false;
        if (statusId != ordersObj.statusId) return false;
        if (customerPhone != null ? !customerPhone.equals(ordersObj.customerPhone) : ordersObj.customerPhone != null)
            return false;
        if (customerName != null ? !customerName.equals(ordersObj.customerName) : ordersObj.customerName != null)
            return false;
        if (address != null ? !address.equals(ordersObj.address) : ordersObj.address != null) return false;
        if (createdTime != null ? !createdTime.equals(ordersObj.createdTime) : ordersObj.createdTime != null)
            return false;
        if (userId != null ? !userId.equals(ordersObj.userId) : ordersObj.userId != null) return false;

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
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + statusId;
        return result;
    }
}
