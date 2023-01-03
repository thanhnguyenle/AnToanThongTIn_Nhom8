package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IAddressDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.IBillDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.AddressMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.BillMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BillDAO extends AbstractDAO<Bill> implements IBillDAO {
    private static BillDAO instance;

    private BillDAO() {
    }

    public static BillDAO getInstance() {
        if (instance == null)
            instance = new BillDAO();
        return instance;
    }

    @Override
    public List<Bill> findAll() {
        return query(QUERIES.BILL.GET_LIST,new BillMapper());
    }

    @Override
    public Long save(Bill account) {
        return insert(QUERIES.BILL.CREATE,account.getBillID(),account.getAccountID(),account.getData(),account.getTimestamp());
    }

    @Override
    public int getAmountItem() {
        return count(QUERIES.BILL.TOTAL);
    }

    @Override
    public Bill getItem(String id) {
        return query(QUERIES.BILL.GET_BILL_BYID,new BillMapper(),id).get(0);
    }

    @Override
    public List<Bill> getItemByAccount(String idAccount) {
        return query(QUERIES.BILL.GET_BILL_BYACCOUNTID,new BillMapper(),idAccount);
    }

    @Override
    public Long deleteItem(String id) {
        return delete(QUERIES.BILL.DELETE,id);
    }

    @Override
    public Long updateItem(Bill bill) {
        return update(QUERIES.BILL.UPDATE,bill.getAccountID(),bill.getData(),bill.getTimestamp(),bill.getBillID());
    }

}
