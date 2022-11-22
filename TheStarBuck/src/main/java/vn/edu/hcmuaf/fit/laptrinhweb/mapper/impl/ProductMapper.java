package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;

import java.sql.ResultSet;

public class ProductMapper implements IRowMapper<Product> {
    @Override
    public Product mapRow(ResultSet resultSet) {
        try {
            Product product = new Product();
            product.setId(resultSet.getString("id_pr"));
            product.setName(resultSet.getString("pr_name"));
            product.setIdCategory(resultSet.getString("pr_csId"));
            product.setIngredients(resultSet.getString("pr_ingredients"));
            product.setPrice(resultSet.getFloat("pr_price"));
            product.setDiscount(resultSet.getFloat("pr_discount"));
            product.setQuantity(resultSet.getInt("pr_quantity"));
            product.setActive(resultSet.getBoolean("pr_active"));
            product.setHot(resultSet.getInt("pr_hot"));
            product.setView(resultSet.getInt("pr_view"));
            product.setDescription(resultSet.getString("pr_description"));
            product.setImage(resultSet.getString("pr_image"));
            product.setDescriptionSeo(resultSet.getString("pr_descriptionSeo"));
            product.setKeywordSeo(resultSet.getString("pr_keywordSeo"));
            product.setNote(resultSet.getString("pr_note"));
            product.setCreatedDate(resultSet.getDate("createdDate"));
            product.setModifiedDate(resultSet.getDate("modifiedDate"));
            product.setCreatedBy(resultSet.getString("createdBy"));
            product.setModifiedBy(resultSet.getString("modifiedBy"));
            return product;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        }
}
