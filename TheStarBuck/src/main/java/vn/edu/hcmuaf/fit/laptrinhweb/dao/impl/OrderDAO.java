package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IOrderDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.OrderMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class OrderDAO extends AbstractDAO<Orders> implements IOrderDAO {
    private static OrderDAO instance;
    private OrderDAO(){}
    public static OrderDAO getInstance(){
        if (instance == null){
            instance = new OrderDAO();
        }
        return instance;
    }
    @Override
    public List<Orders> findAll() {
        List<Orders> output = query(QUERIES.ORDER.GET_LIST, new OrderMapper());
        return output;
    }

    @Override
    public Long save(Orders orders) {
        if(orders.getId().equals("")){
            return addItem(orders);
        }
        return updateItem(orders);
    }

    @Override
    public Long deleteItem(String id) {
        return null;
    }

    @Override
    public Orders getItem(String id) {
        List<Orders> list = query(QUERIES.ORDER.GET_ITEM_BYID, new OrderMapper(), id);
        Orders output = list.get(0);
        return output;
    }

    @Override
    public Map<String, Orders> getAll() {
        return null;
    }

    @Override
    public Long addItem(Orders orders) {
        long output = insert(QUERIES.ORDER.CREATE, orders.getId(), orders.getIdAccount(), orders.getIdSession(), orders.getToken(),
                orders.getStatus(), orders.getAddress(), orders.getSubTotal(), orders.getItemDiscount(), orders.getTax(),
                orders.getShipping(), orders.getGrandTotal(), orders.getPromo(), orders.getNote(),
                new SimpleDateFormat("yyyy-MM-dd").format(new Date()),new SimpleDateFormat("yyyy-MM-dd").format(new Date()),
                orders.getIdAccount(), orders.getIdAccount());
        return output;
    }

    @Override
    public Long updateItem(Orders orders) {
        long output = update(QUERIES.ORDER.UPDATE, orders.getStatus(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), orders.getModifiedBy(), orders.getId());
        return output;
    }

    @Override
    public boolean createOrder(Account account, Cart cart, Orders orders) {
        long checkTotalProduct = 0;
        long checkProItem = 0;
        long output = insert(QUERIES.ORDER.CREATE, orders.getId(), orders.getIdAccount(),
               orders.getIdSession(), orders.getToken(),
                orders.getStatus(), orders.getAddress(), orders.getSubTotal(), orders.getItemDiscount(),
                orders.getTax(),
                orders.getShipping(), orders.getGrandTotal(), orders.getPromo(), orders.getNote(),
                new SimpleDateFormat("yyyy-MM-dd").format(new Date()),new SimpleDateFormat("yyyy-MM-dd").format(new Date()),
                orders.getIdAccount(), orders.getIdAccount());
        Orders orders1 = getItemByIdAc(account.getId());
        for (Product pro: cart.getProductList()
             ) {
            pro.setNote("");
            checkProItem = insert(QUERIES.ORDERITEM.CREATE, pro.getId(), orders1.getId(), pro.getQuantitySold(), pro.getNote(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()),new SimpleDateFormat("yyyy-MM-dd").format(new Date()),
                    orders.getIdAccount(), orders.getIdAccount());
            System.out.println(pro.getId() + " " + pro.getQuantitySold()+ " "+ pro.getNote() + " ------");
            checkTotalProduct+= checkProItem;
        }
        System.out.println("check : " + (output  ) + " check2: " + ( checkTotalProduct + " " + cart.getProductList().size()));
        return output == 1 && checkTotalProduct == cart.getProductList().size();
    }

    @Override
    public Orders getItemByIdAc(String accId) {
        List<Orders> list = query(QUERIES.ORDER.GET_LAST_BYACCID, new OrderMapper(), accId);
        Orders output = list.get(0);
        return output;
    }

    @Override
    public int getAmountOrder() {
        return count(QUERIES.ORDER.COUNT_ITEM);
    }

    @Override
    public double getSumMoney() {
        return count(QUERIES.ORDER.SUM_MONEY);
    }
}
