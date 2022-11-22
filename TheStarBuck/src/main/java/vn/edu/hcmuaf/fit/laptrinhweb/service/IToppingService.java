package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Category;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;

import java.util.List;

public interface IToppingService {
    List<Topping> findAll();
    Long save(Topping topping);
    Long deleteItem(String id);
    Topping getItem(String id);
}
