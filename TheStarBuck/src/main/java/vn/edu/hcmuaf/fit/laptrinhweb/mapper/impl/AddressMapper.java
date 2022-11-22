package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AddressMapper implements IRowMapper<Address> {

    @Override
    public Address mapRow(ResultSet resultSet) {
        try {
            Address address = new Address();
            address.setId(resultSet.getString("id_ad"));
            address.setIdAccount(resultSet.getString("ad_userId"));
            address.setProvinceCode(resultSet.getString("ad_provinceCode"));
            address.setDistrictCode(resultSet.getString("ad_districtCode"));
            address.setWardCode(resultSet.getString("ad_wardCode"));
            address.setAddressDetails(resultSet.getString("ad_addressDetail"));
            address.setCreatedDate(resultSet.getDate("createdDate"));
            address.setModifiedDate(resultSet.getDate("modifiedDate"));
            address.setCreatedBy(resultSet.getString("createdBy"));
            address.setModifiedBy(resultSet.getString("modifiedBy"));
            return address;
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }
}
