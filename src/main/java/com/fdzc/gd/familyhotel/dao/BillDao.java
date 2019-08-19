package com.fdzc.gd.familyhotel.dao;



import com.fdzc.gd.familyhotel.domain.Bill;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:05
 */
public interface BillDao {

    void addBill(Bill bill);
    List<Bill> findAll();

}
