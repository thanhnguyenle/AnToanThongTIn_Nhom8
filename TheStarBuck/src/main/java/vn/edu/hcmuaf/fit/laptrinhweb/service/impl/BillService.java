package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.AccountDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.BillDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IAccountService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IBillService;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BillService implements IBillService {
    private BillDAO billDAO = BillDAO.getInstance();
    private static BillService instance;

    private BillService() {
    }

    public static BillService getInstance() {
        if (instance == null)
            instance = new BillService();
        return instance;
    }


    @Override
    public List<Bill> findAll() {
        return billDAO.findAll();
    }

    @Override
    public Long save(Bill account) {
        return billDAO.save(account);
    }

    @Override
    public int getAmountItem() {
        return billDAO.getAmountItem();
    }

    @Override
    public Bill getItem(String id) {
        return billDAO.getItem(id);
    }

    @Override
    public List<Bill> getItemByAccount(String idAccount) {
        return billDAO.getItemByAccount(idAccount);
    }

    @Override
    public Long deleteItem(String id) {
        return billDAO.deleteItem(id);
    }

    @Override
    public Long updateItem(Bill bill) {
        return billDAO.updateItem(bill);
    }
}
