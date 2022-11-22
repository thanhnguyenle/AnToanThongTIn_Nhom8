package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;

import java.util.List;

public interface INavigationDAO extends IGenericDAO<Topping>{
    List<Topping> findAll();

}
