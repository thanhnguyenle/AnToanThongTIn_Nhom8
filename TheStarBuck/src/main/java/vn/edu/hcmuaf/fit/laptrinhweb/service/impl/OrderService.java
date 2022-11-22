package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.OrderDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IOrderService;

import java.util.List;

public class OrderService implements IOrderService {
    private  static  OrderService instance;
    private OrderDAO orderDAO = OrderDAO.getInstance();
    private OrderService(){}
    public static OrderService getInstance(){
        if(instance == null){
            instance = new OrderService();
        }
        return instance;
    }
    @Override
    public List<Orders> findAll() {
        return orderDAO.findAll();
    }

    @Override
    public boolean save(Orders orders) {
        return orderDAO.save(orders) == 1;
    }

    @Override
    public boolean deleteItem(String id) {
        return orderDAO.deleteItem(id) == 1;
    }

    @Override
    public Orders getItem(String id) {
        return orderDAO.getItem(id);
    }

    @Override
    public boolean createOrder(Account account, Cart cart, Orders orders) {
        return orderDAO.createOrder(account, cart, orders);
    }

    @Override
    public Orders getItemByIdAc(String accId) {
        return orderDAO.getItemByIdAc(accId);
    }

    @Override
    public int getAmountItem() {
        return orderDAO.getAmountOrder();
    }

    @Override
    public double getSumMoney() {
        return orderDAO.getSumMoney();
    }
}
