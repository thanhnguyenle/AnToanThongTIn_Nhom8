package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;

import java.util.List;
import java.util.Map;

public interface IToppingDAO extends IGenericDAO<Topping> {
    List<Topping> findAll();
    Long save(Topping topping);
    Long deleteItem(String id);
    Topping getItem(String id);
    Map<String, Topping> getAll();
    Long addItem(Topping topping);
    Long updateItem(Topping topping);
}
