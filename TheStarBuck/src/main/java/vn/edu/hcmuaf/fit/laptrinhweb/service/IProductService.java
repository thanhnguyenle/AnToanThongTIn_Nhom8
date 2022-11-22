package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Slide;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.IPageAble;

import java.util.List;

public interface IProductService {
    List<Product> findAll(IPageAble pageAble,double fromPrice, double toPrice,String categoryID,String sortBy,String orderBy,String text) ;
    Long save(Product product);
    List<Product> printTypeProductLatest(int num);
    List<Product> printTypeProductFeatured(int num);
    List<Product> printTypeProductHot(int num);
    int totalItem();

}
