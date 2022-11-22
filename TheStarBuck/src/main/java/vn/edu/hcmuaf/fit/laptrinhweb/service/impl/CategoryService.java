package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.CategoryDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Category;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    private static CategoryService instance;
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();

    private CategoryService(){}

    public static CategoryService getInstance(){
        if(instance == null){
            instance = new CategoryService();
        }
        return instance;
    }


    @Override
    public List<Category> findAll() {
        return categoryDAO.findAll();
    }

    @Override
    public Long save(Category category) {
        return categoryDAO.save(category);
    }

    @Override
    public Long deleteItem(String id) {
        return categoryDAO.deleteItem(id) ;
    }

    @Override
    public Long updateItem(String id) {
        return null;
    }

    @Override
    public Category getItem(String id) {
        return categoryDAO.getItem(id);
    }
}
