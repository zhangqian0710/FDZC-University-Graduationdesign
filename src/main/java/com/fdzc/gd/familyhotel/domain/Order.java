package com.fdzc.gd.familyhotel.domain;

import java.util.Date;

/**
 * @author Miracle_Q
 * time：2018/11/28 11:09
 */
public class Order extends ValueObject {

    private Integer orderId; //订单号
    private String orderMembName; //订单人账号
    private String orderRoomNo; //订单房间号
    private String orderRoomType; //订单房间类型
    private Date orderInTime; //入住时间
    private Date orderOutTime; //退房时间
    private String orderPrice; //订单价格
    private String orderPayment; //订单支付方式
    private String orderStatus; // 订单状态

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderMembName() {
        return orderMembName;
    }

    public void setOrderMembName(String orderMembName) {
        this.orderMembName = orderMembName;
    }

    public String getOrderRoomNo() {
        return orderRoomNo;
    }

    public void setOrderRoomNo(String orderRoomNo) {
        this.orderRoomNo = orderRoomNo;
    }

    public String getOrderRoomType() {
        return orderRoomType;
    }

    public void setOrderRoomType(String orderType) {
        this.orderRoomType = orderType;
    }

    public Date getOrderInTime() {
        return orderInTime;
    }

    public void setOrderInTime(Date orderInTime) {
        this.orderInTime = orderInTime;
    }

    public Date getOrderOutTime() {
        return orderOutTime;
    }

    public void setOrderOutTime(Date orderOutTime) {
        this.orderOutTime = orderOutTime;
    }

    public String getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(String orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getOrderPayment() {
        return orderPayment;
    }

    public void setOrderPayment(String orderPayment) {
        this.orderPayment = orderPayment;
    }
}
