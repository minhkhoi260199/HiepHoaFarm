package com.hiephoafarm.main.models;

import javax.persistence.*;

@Entity
@Table(name = "order_detail", schema = "hiephoafarm", catalog = "")
public class OrderDetailObj {
    private int idOrderDetail;
    private int quantity;
    private int productId;
    private int orderId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "Id_order_detail")
    public int getIdOrderDetail() {
        return idOrderDetail;
    }

    public void setIdOrderDetail(int idOrderDetail) {
        this.idOrderDetail = idOrderDetail;
    }

    @Basic
    @Column(name = "quantity")
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Basic
    @Column(name = "product_id")
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "order_id")
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderDetailObj that = (OrderDetailObj) o;

        if (idOrderDetail != that.idOrderDetail) return false;
        if (quantity != that.quantity) return false;
        if (productId != that.productId) return false;
        if (orderId != that.orderId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idOrderDetail;
        result = 31 * result + quantity;
        result = 31 * result + productId;
        result = 31 * result + orderId;
        return result;
    }
}
