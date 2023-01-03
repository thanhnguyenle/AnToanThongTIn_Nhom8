package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface IBillService {
    List<Bill> findAll();

    Long save(Bill account);

    int getAmountItem();

    Bill getItem(String id);
    List<Bill> getItemByAccount(String idAccount);
    Long deleteItem(String id);

    Long updateItem(Bill bill);
}
