package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.dao.OrderDao;
import com.fdzc.gd.familyhotel.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:39
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public void addOrder(Order order) {
        orderDao.addOrder(order);
    }

    @Override
    public void updateOrder(String roomno) {
        orderDao.updateOrder(roomno);
    }

    @Override
    public void deleteOrder(int orderId) {
        orderDao.deleteOrder(orderId);
    }

    @Override
    public Order findOrderById(int orderId) {
        return orderDao.findOrderById(orderId);
    }

    @Override
    public List<Order> findAll() {
        return orderDao.findAll();
    }

    @Override
    public List<Order> findAllOrder(String indate) {
        return orderDao.findAllOrder(indate);
    }

    @Override
    public List<Order> findAllFin(String findate) {
        return orderDao.findAllFin(findate);
    }
}
