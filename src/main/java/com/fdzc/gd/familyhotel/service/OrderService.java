package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.domain.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:39
 */
public interface OrderService {

    void addOrder(Order order);
    void updateOrder(String roomno);
    void deleteOrder(int orderId);
    Order findOrderById(int orderId);
    List<Order> findAll();
    List<Order> findAllOrder(String indate);
    List<Order> findAllFin(String findate);
}
