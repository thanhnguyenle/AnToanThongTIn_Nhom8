package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Category;

import java.util.List;
import java.util.Map;

public interface ICategoryDAO extends  IGenericDAO<Category>{
    List<Category> findAll();
    Long save(Category category);
    Long deleteItem(String id);
    Category getItem(String id);
    Map<String, Category> getAll();
    Long addItem(Category category);
    Long updateItem(Category category);
}
