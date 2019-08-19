package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.dao.BillDao;
import com.fdzc.gd.familyhotel.domain.Bill;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:46
 */
public class BillServiceImpl implements BillService {

    @Autowired
    private BillDao billDao;

    @Override
    public void addBill(Bill bill) {
        billDao.addBill(bill);
    }

    @Override
    public List<Bill> findAll() {
        return billDao.findAll();
    }
}
