package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IToppingDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.ToppingMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ToppingDAO extends  AbstractDAO<Topping> implements IToppingDAO {
    private static ToppingDAO instance;

    private  ToppingDAO(){}

    public static ToppingDAO getInstance(){
        if(instance == null){
            instance = new ToppingDAO();
        }
        return instance;
    }

    @Override
    public List<Topping> findAll() {
        List<Topping> toppings = query(QUERIES.TOPPING.GET_LIST, new ToppingMapper());
        return toppings;
    }

    @Override
    public Long save(Topping topping) {
        if(topping.getId().equals("")){
            return addItem(topping);
        } else
        return updateItem(topping);
    }

    @Override
    public Long deleteItem(String id) {
        long output = delete(QUERIES.TOPPING.DELETE, id);
        return output;
    }

    @Override
    public Topping getItem(String id) {
        List<Topping> list = query(QUERIES.TOPPING.GET_ITEM_BYID, new ToppingMapper(), id);
        Topping output = list.get(0);
        return output;
    }

    @Override
    public Map<String, Topping> getAll() {
        return null;
    }

    @Override
    public Long addItem(Topping topping) {
        long output = insert(QUERIES.TOPPING.CREATE, topping.getId(), topping.getName(), topping.getQuantity(), topping.getPrice(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), topping.getCreatedBy(), topping.getCreatedBy());
        return output;
    }

    @Override
    public Long updateItem(Topping topping) {
        long output = update(QUERIES.TOPPING.UPDATE, topping.getName(), topping.getQuantity(), topping.getPrice(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), topping.getModifiedBy(), topping.getId());
        return output;
    }
}
