package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.ToppingDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IToppingService;

import java.util.List;

public class ToppingService implements IToppingService {
    private static  ToppingService instance;
    private ToppingDAO toppingDAO = ToppingDAO.getInstance();

    private ToppingService(){}

    public static ToppingService getInstance(){
        if(instance == null){
            instance = new ToppingService();
        }
        return instance;
    }

    @Override
    public List<Topping> findAll() {
        return toppingDAO.findAll();
    }

    @Override
    public Long save(Topping topping) {
        return toppingDAO.save(topping);
    }

    @Override
    public Long deleteItem(String id) {
        return toppingDAO.deleteItem(id);
    }


    @Override
    public Topping getItem(String id) {
        return toppingDAO.getItem(id);
    }

}
