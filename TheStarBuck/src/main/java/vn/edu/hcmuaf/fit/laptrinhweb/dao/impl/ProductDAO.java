package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IProductDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.db.impl.DBConnection;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.ProductMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.IPageAble;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ProductDAO extends AbstractDAO<Product> implements IProductDAO {
    private static ProductDAO instance;

    private ProductDAO() {
    }

    public static ProductDAO getInstance(){
        if(instance == null){
            instance = new ProductDAO();
        }
        return instance;
    }

    public List<Product> findAll(IPageAble pageAble,double fromPrice, double toPrice,String categoryID,String sortBy,String orderBy,String text) {
        StringBuilder sql = new StringBuilder(QUERIES.PRODUCT.GET_LIST);
        if(pageAble.getOffset()!=null && pageAble.getLimit() !=null){
//            WHERE pr_price >=5 AND pr_price <=8 AND pr_csId = "cs0004" ORDER BY pr_price
            if(categoryID!=null&&!categoryID.equals("")){
                sql.append(" WHERE pr_price >=? AND pr_price <=? AND pr_csId ='" +categoryID+ "'");
            }else{
                sql.append(" WHERE pr_price >=? AND pr_price <=?");
            }
//            AND LOWER(pr_name) LIKE LOWER("%w%")
            if(text!=null&&!text.equals("")){
                sql.append(" AND LOWER(pr_name) LIKE LOWER('%"+text+"%')");
            }
            if(sortBy!=null&&!sortBy.equals("")){
                sql.append(" ORDER BY "+sortBy +" "+orderBy);
            }
            sql.append(" LIMIT "+pageAble.getOffset()+", "+pageAble.getLimit());
        }
        return query(sql.toString(),new ProductMapper(),fromPrice,toPrice);
    }


    @Override
    public List<Product> findAll() {
        List<Product> list = query(QUERIES.PRODUCT.GET_LIST, new ProductMapper());
        return list;
    }

    @Override
    public Long save(Product product) {
        if(product.getId().equals("")){
            return addItem(product);
        }
        return updateItem(product);
    }

    @Override
    public List<Product> printTypeProductLatest(int num) {
        return query(QUERIES.PRODUCT.GET_LIST_LATEST,new ProductMapper(),num);
    }

    @Override
    public List<Product> printTypeProductFeatured(int num) {
        return query(QUERIES.PRODUCT.GET_LIST_FEATURED,new ProductMapper(),num);
    }

    @Override
    public List<Product> printTypeProductHot(int num) {
        return query(QUERIES.PRODUCT.GET_LIST_HOT,new ProductMapper(),num);
    }

    @Override
    public int totalItem() {
        return count(QUERIES.PRODUCT.TOTAL_ITEM);
    }

    public Long addItem(Product product){
        int active = product.isActive() ? 1 : 0;
        int hot = product.getHot() ;
        long output = insert(QUERIES.PRODUCT.CREATE, product.getId(), product.getName(), product.getIdCategory(), product.getIngredients(), product.getPrice(), product.getDiscount(), product.getQuantity(), active, hot, product.getView(), product.getDescription(), product.getImage(), product.getDescriptionSeo(), product.getKeywordSeo(), product.getTitleSeo(), product.getNote(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), product.getCreatedBy(), product.getCreatedBy());
        return output;
    }

    public Long updateItem(Product product){
        int active = product.isActive() ? 1 : 0;
        int hot = product.getHot();
        long output = insert(QUERIES.PRODUCT.UPDATE, product.getName(), product.getIdCategory(), product.getIngredients(), product.getPrice(), product.getDiscount(), product.getQuantity(), active, hot, product.getView(), product.getDescription(), product.getImage(), product.getDescriptionSeo(), product.getKeywordSeo(), product.getTitleSeo(), product.getNote(),  new SimpleDateFormat("yyyy-MM-dd").format(new Date()), product.getModifiedBy(), product.getId());
        return output;
    }

    public Map<String, Product> getAll(){
        List<Product> list = query(QUERIES.PRODUCT.GET_LIST, new ProductMapper());
        Map<String, Product> output = new HashMap<>();
        for (Product pro: list) {
            output.put(pro.getId(), pro);
        }
        return output;
    }

    public Product getItem(String id){
        List<Product> products = query(QUERIES.PRODUCT.GET_ITEM_BYID, new ProductMapper(), id);
        Product product = products.get(0);
        return product;
    }

    public Long deleteItem(String id){
        long output = delete(QUERIES.PRODUCT.DELETE, id);
        return output;
    }

    public List<Product> searchByName(String txt){
        List<Product> output = new ArrayList<Product>();
        output = query(QUERIES.PRODUCT.SEARCH_BY_NAME, new ProductMapper(), txt);
        return output;
    }

}
