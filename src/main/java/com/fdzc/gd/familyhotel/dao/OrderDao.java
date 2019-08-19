package com.fdzc.gd.familyhotel.dao;

import com.fdzc.gd.familyhotel.domain.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 16:49
 */
public interface OrderDao {

    void addOrder(Order order);
    void updateOrder(@Param("orderRoomNo")String roomno);
    void deleteOrder(int orderId);
    Order findOrderById(int orderId);
    List<Order> findAll();
    List<Order> findAllOrder(@Param("orderInTime")String indate);
    List<Order> findAllFin(@Param("orderOutTime")String findate);
}
