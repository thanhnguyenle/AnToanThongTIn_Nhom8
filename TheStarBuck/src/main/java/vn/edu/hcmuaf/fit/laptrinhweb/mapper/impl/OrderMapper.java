package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderMapper implements IRowMapper<Orders> {
    @Override
    public Orders mapRow(ResultSet resultSet) {
        try {
            Orders orders = new Orders();
            orders.setId(resultSet.getString("id_od"));
            orders.setIdAccount(resultSet.getString("od_acId"));
            orders.setIdSession(resultSet.getString("od_sessionId"));
            orders.setToken(resultSet.getString("od_token"));
            orders.setStatus(resultSet.getString("od_status"));
            orders.setAddress(resultSet.getString("od_address"));
            orders.setSubTotal(resultSet.getDouble("od_subTotal"));
            orders.setItemDiscount(resultSet.getDouble("od_itemDiscount"));
            orders.setTax(resultSet.getDouble("od_tax"));
            orders.setShipping(resultSet.getDouble("od_shipping"));
            orders.setGrandTotal(resultSet.getDouble("od_grandTotal"));
            orders.setPromo(resultSet.getString("od_promo"));
            orders.setNote(resultSet.getString("od_note"));
            orders.setCreatedDate(resultSet.getDate("createdDate"));
            orders.setModifiedDate(resultSet.getDate("modifiedDate"));
            orders.setCreatedBy(resultSet.getString("createdBy"));
            orders.setModifiedBy(resultSet.getString("modifiedBy"));
            return orders;
        }catch (SQLException e){
            return null;
        }

    }
}
