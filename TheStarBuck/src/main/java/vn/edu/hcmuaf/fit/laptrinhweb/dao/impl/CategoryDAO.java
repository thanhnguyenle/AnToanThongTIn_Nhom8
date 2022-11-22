package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.ICategoryDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.CategoryMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Category;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class CategoryDAO extends AbstractDAO<Category> implements ICategoryDAO {
    private static  CategoryDAO instance;

    private CategoryDAO(){

    }

    public static CategoryDAO getInstance(){
        if(instance == null){
            instance = new CategoryDAO();
        }
        return  instance;
    }

    @Override
    public List<Category> findAll() {
        List<Category> output = query(QUERIES.CATEGORY.GET_LIST, new CategoryMapper());
        return output;
    }

    @Override
    public Long save(Category category) {
        if(category.getId().equals("")){
            return addItem(category);
        }
        return updateItem(category);
    }

    @Override
    public Long deleteItem(String id) {
        long output = delete(QUERIES.CATEGORY.DELETE, id);
        return output;
    }

    @Override
    public Category getItem(String id) {
        List<Category> list = query(QUERIES.CATEGORY.GET_ITEM_BYID, new CategoryMapper(), id);
        Category output = list.get(0);
        return output;
    }

    @Override
    public Map<String, Category> getAll() {
        return null;
    }

    @Override
    public Long addItem(Category category) {
        int active = category.isActive() ? 1 : 0;
        long output = insert(QUERIES.CATEGORY.CREATE, category.getId(), category.getName(), category.getIcon(), category.getAvatar(), active, new SimpleDateFormat("yyyy-MM-dd").format(new Date()), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), category.getCreatedBy(), category.getCreatedBy());
        return output;
    }

    @Override
    public Long updateItem(Category category) {
        int active = category.isActive() ? 1 : 0;
        long output = update(QUERIES.CATEGORY.UPDATE, category.getName(), category.getIcon(), category.getAvatar(), active, new SimpleDateFormat("yyyy-MM-dd").format(new Date()), category.getModifiedBy(), category.getId());
        return null;
    }
}
