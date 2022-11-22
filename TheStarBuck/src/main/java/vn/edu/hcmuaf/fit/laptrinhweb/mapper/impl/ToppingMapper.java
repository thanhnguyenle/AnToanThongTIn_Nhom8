package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ToppingMapper implements IRowMapper<Topping> {
    @Override
    public Topping mapRow(ResultSet resultSet) {
        try{
            Topping topping = new Topping();
            topping.setId(resultSet.getString("id_tp"));
            topping.setName(resultSet.getString("tp_name"));
            topping.setQuantity(resultSet.getInt("tp_quantity"));
            topping.setPrice(resultSet.getDouble("tp_price"));
            topping.setCreatedDate(resultSet.getDate("createdDate"));
            topping.setModifiedDate(resultSet.getDate("modifiedDate"));
            topping.setCreatedBy(resultSet.getString("createdBy"));
            topping.setModifiedBy(resultSet.getString("modifiedBy"));

            return topping;
        } catch (SQLException e){
            return null;
        }

    }
}
