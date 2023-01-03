package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;

import java.util.List;

public interface IBillDAO extends IGenericDAO<Bill> {
    List<Bill> findAll();

    Long save(Bill account);

    int getAmountItem();

    Bill getItem(String id);
    List<Bill> getItemByAccount(String idAccount);
    Long deleteItem(String id);

    Long updateItem(Bill bill);
}
