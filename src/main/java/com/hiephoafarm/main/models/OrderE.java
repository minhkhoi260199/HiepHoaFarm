package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "order", schema = "hiephoafarm", catalog = "hiephoafarm")
public class OrderE {
    private int idOrder;
    private String customerPhone;
    private String customerName;
    private String address;
    private Integer shippingFee;
    private Integer orderAmouth;
    private Date createdTime;
    private UserE userByUserId;
    private StatusE statusByStatusId;
    private Collection<OrderDetailE> orderDetailsByIdOrder;

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
        OrderE orderE = (OrderE) o;
        return idOrder == orderE.idOrder && Objects.equals(customerPhone, orderE.customerPhone) && Objects.equals(customerName, orderE.customerName) && Objects.equals(address, orderE.address) && Objects.equals(shippingFee, orderE.shippingFee) && Objects.equals(orderAmouth, orderE.orderAmouth) && Objects.equals(createdTime, orderE.createdTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOrder, customerPhone, customerName, address, shippingFee, orderAmouth, createdTime);
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

    @OneToMany(mappedBy = "orderByOrderId")
    public Collection<OrderDetailE> getOrderDetailsByIdOrder() {
        return orderDetailsByIdOrder;
    }

    public void setOrderDetailsByIdOrder(Collection<OrderDetailE> orderDetailsByIdOrder) {
        this.orderDetailsByIdOrder = orderDetailsByIdOrder;
    }
}
