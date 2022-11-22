package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;

import java.util.List;

public interface IOrderService {
    List<Orders> findAll();
    boolean save(Orders orders);
    boolean deleteItem(String id);
    Orders getItem(String id);
    boolean createOrder(Account account, Cart cart, Orders orders);
    Orders getItemByIdAc(String accId);
    int getAmountItem();
    double getSumMoney();
}
