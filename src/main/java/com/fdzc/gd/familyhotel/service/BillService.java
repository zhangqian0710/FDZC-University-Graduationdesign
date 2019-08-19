package com.fdzc.gd.familyhotel.service;

import com.fdzc.gd.familyhotel.domain.Bill;

import java.util.List;

/**
 * @author Miracle_Q
 * time：2018/11/28 17:45
 */
public interface BillService {

    void addBill(Bill bill);
    List<Bill> findAll();

}
