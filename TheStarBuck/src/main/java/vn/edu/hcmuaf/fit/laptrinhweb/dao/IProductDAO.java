package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Slide;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.IPageAble;

import java.util.List;

public interface IProductDAO extends IGenericDAO<Product> {
    List<Product> findAll();
    Long save(Product product);
    List<Product> printTypeProductLatest(int num);
    List<Product> printTypeProductFeatured(int num);
    List<Product> printTypeProductHot(int num);
    int totalItem();
    List<Product> findAll(IPageAble pageAble, double fromPrice, double toPrice, String categoryID, String sortBy,String orderBy,String text);
}
