package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;

import java.util.List;
import java.util.Map;

public interface IOrderDAO extends IGenericDAO<Orders> {
    List<Orders> findAll();
    Long save(Orders orders);
    Long deleteItem(String id);
    Orders getItem(String id);
    Map<String, Orders> getAll();
    Long addItem(Orders orders);
    Long updateItem(Orders orders);
    boolean createOrder(Account account, Cart cart, Orders orders);
    Orders getItemByIdAc(String accId);
    int getAmountOrder();
    double getSumMoney();
}
