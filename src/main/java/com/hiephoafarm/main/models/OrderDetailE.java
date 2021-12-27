package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "order_detail", schema = "hiephoafarm", catalog = "hiephoafarm")
public class OrderDetailE {
    private int idOrderDetail;
    private Integer quantity;
    private OrderE orderByOrderId;
    private ProductE productByProductId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_order_detail", nullable = false)
    public int getIdOrderDetail() {
        return idOrderDetail;
    }

    public void setIdOrderDetail(int idOrderDetail) {
        this.idOrderDetail = idOrderDetail;
    }

    @Basic
    @Column(name = "quantity", nullable = true)
    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderDetailE that = (OrderDetailE) o;
        return idOrderDetail == that.idOrderDetail && Objects.equals(quantity, that.quantity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOrderDetail, quantity);
    }

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "id_order", nullable = false)
    public OrderE getOrderByOrderId() {
        return orderByOrderId;
    }

    public void setOrderByOrderId(OrderE orderByOrderId) {
        this.orderByOrderId = orderByOrderId;
    }

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id_product", nullable = false)
    public ProductE getProductByProductId() {
        return productByProductId;
    }

    public void setProductByProductId(ProductE productByProductId) {
        this.productByProductId = productByProductId;
    }
}
