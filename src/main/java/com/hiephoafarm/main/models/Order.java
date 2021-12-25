package com.hiephoafarm.main.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Order {
    private int idOrder;
    private String customerPhone;
    private String customerName;
    private String address;
    private Integer shippingFee;
    private Integer orderAmouth;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date createdTime;
    private User userByUserId;
    private Status statusByStatusId;
    private Collection<OrderDetail> orderDetailsByIdOrder;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_order", nullable = false)
    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    @Basic
    @Column(name = "customer_phone", nullable = true, length = 45)
    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    @Basic
    @Column(name = "customer_name", nullable = true, length = 45)
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Basic
    @Column(name = "address", nullable = true, length = 45)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "shipping_fee", nullable = true)
    public Integer getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(Integer shippingFee) {
        this.shippingFee = shippingFee;
    }

    @Basic
    @Column(name = "order_amouth", nullable = true)
    public Integer getOrderAmouth() {
        return orderAmouth;
    }

    public void setOrderAmouth(Integer orderAmouth) {
        this.orderAmouth = orderAmouth;
    }

    @Basic
    @Column(name = "created_time", nullable = true)
    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return idOrder == order.idOrder && Objects.equals(customerPhone, order.customerPhone) && Objects.equals(customerName, order.customerName) && Objects.equals(address, order.address) && Objects.equals(shippingFee, order.shippingFee) && Objects.equals(orderAmouth, order.orderAmouth) && Objects.equals(createdTime, order.createdTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOrder, customerPhone, customerName, address, shippingFee, orderAmouth, createdTime);
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id_user", nullable = false)
    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "id_status", nullable = false)
    public Status getStatusByStatusId() {
        return statusByStatusId;
    }

    public void setStatusByStatusId(Status statusByStatusId) {
        this.statusByStatusId = statusByStatusId;
    }

    @OneToMany(mappedBy = "orderByOrderId")
    public Collection<OrderDetail> getOrderDetailsByIdOrder() {
        return orderDetailsByIdOrder;
    }

    public void setOrderDetailsByIdOrder(Collection<OrderDetail> orderDetailsByIdOrder) {
        this.orderDetailsByIdOrder = orderDetailsByIdOrder;
    }
}
