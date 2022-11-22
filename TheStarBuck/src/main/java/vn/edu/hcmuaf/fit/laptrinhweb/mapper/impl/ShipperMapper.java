package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ShipperMapper implements IRowMapper<Shipper> {
    @Override
    public Shipper mapRow(ResultSet resultSet) {
        try {
            Shipper shipper = new Shipper();
            shipper.setId(resultSet.getString("id_sh"));
            shipper.setName(resultSet.getString("sh_name"));
            shipper.setMobile(resultSet.getString("sh_mobile"));
            shipper.setAddress(resultSet.getString("sh_adress"));
            shipper.setCreatedDate(resultSet.getDate("createdDate"));
            shipper.setModifiedDate(resultSet.getDate("modifiedDate"));
            shipper.setCreatedBy(resultSet.getString("createdBy"));
            shipper.setModifiedBy(resultSet.getString("modifiedBy"));
            return  shipper;

        } catch (SQLException e) {
            return null;
        }

    }
}
