package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "orders", schema = "hiephoafarm")
public class OrdersE {
    private int idOrder;
    private String customerPhone;
    private String customerName;
    private String address;
    private int shippingFee;
    private int orderAmouth;
    private Date createdTime;
    private Collection<OrderDetailE> orderDetailsByIdOrder;
    private UserE userByUserId;
    private StatusE statusByStatusId;

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
    @Column(name = "customer_phone", nullable = false, length = 10)
    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    @Basic
    @Column(name = "customer_name", nullable = false, length = 45)
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Basic
    @Column(name = "address", nullable = false, length = 45)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "shipping_fee", nullable = false)
    public int getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(int shippingFee) {
        this.shippingFee = shippingFee;
    }

    @Basic
    @Column(name = "order_amouth", nullable = false)
    public int getOrderAmouth() {
        return orderAmouth;
    }

    public void setOrderAmouth(int orderAmouth) {
        this.orderAmouth = orderAmouth;
    }

    @Basic
    @Column(name = "created_time", nullable = false)
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
        OrdersE ordersE = (OrdersE) o;
        return idOrder == ordersE.idOrder && shippingFee == ordersE.shippingFee && orderAmouth == ordersE.orderAmouth && Objects.equals(customerPhone, ordersE.customerPhone) && Objects.equals(customerName, ordersE.customerName) && Objects.equals(address, ordersE.address) && Objects.equals(createdTime, ordersE.createdTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOrder, customerPhone, customerName, address, shippingFee, orderAmouth, createdTime);
    }

    @OneToMany(mappedBy = "ordersByOrderId")
    public Collection<OrderDetailE> getOrderDetailsByIdOrder() {
        return orderDetailsByIdOrder;
    }

    public void setOrderDetailsByIdOrder(Collection<OrderDetailE> orderDetailsByIdOrder) {
        this.orderDetailsByIdOrder = orderDetailsByIdOrder;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id_user", nullable = false)
    public UserE getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserE userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "id_status", nullable = false)
    public StatusE getStatusByStatusId() {
        return statusByStatusId;
    }

    public void setStatusByStatusId(StatusE statusByStatusId) {
        this.statusByStatusId = statusByStatusId;
    }
}
