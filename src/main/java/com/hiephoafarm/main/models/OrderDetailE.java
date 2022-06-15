package com.hiephoafarm.main.models;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
@Table(name = "order_detail", schema = "hiephoafarm", catalog = "")
public class OrderDetailE {
    private int idOrderDetail;
    private int quantity;
    private ProductE productByProductId;
    private OrdersE ordersByOrderId;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderDetailE that = (OrderDetailE) o;

        if (idOrderDetail != that.idOrderDetail) return false;
        if (quantity != that.quantity) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idOrderDetail;
        result = 31 * result + quantity;
        return result;
    }

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id_product", nullable = false)
    public ProductE getProductByProductId() {
        return productByProductId;
    }

    public void setProductByProductId(ProductE productByProductId) {
        this.productByProductId = productByProductId;
    }

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", referencedColumnName = "id_order", nullable = false)
    public OrdersE getOrdersByOrderId() {
        return ordersByOrderId;
    }

    public void setOrdersByOrderId(OrdersE ordersByOrderId) {
        this.ordersByOrderId = ordersByOrderId;
    }
}
