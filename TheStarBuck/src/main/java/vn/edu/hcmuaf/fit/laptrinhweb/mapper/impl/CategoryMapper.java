package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Category;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper implements IRowMapper<Category> {
    @Override
    public Category mapRow(ResultSet resultSet) {
        try {
            Category category = new Category();
            category.setId(resultSet.getString("id_cs"));
            category.setName(resultSet.getString("cs_name"));
            category.setIcon(resultSet.getString("cs_icon"));
            category.setAvatar(resultSet.getString("cs_avatar"));
            category.setActive(resultSet.getBoolean("cs_active"));
            category.setCreatedDate(resultSet.getDate("createdDate"));
            category.setModifiedDate(resultSet.getDate("modifiedDate"));
            category.setCreatedBy(resultSet.getString("createdBy"));
            category.setModifiedBy(resultSet.getString("modifiedBy"));
            return category;

        } catch (SQLException e){
            return null;
        }
    }
}
