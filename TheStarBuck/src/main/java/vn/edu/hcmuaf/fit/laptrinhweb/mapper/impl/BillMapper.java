package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PublicKeyMapper implements IRowMapper<MyCertificate> {
    @Override
    public MyCertificate mapRow(ResultSet resultSet) {
        try {
           MyCertificate publicKey = new MyCertificate();
           publicKey.setKeyID(resultSet.getString("keyID"));
           publicKey.setAccountID(resultSet.getString("accountID"));
           publicKey.setStartDate(resultSet.getLong("startDate"));
           publicKey.setEndDate(resultSet.getLong("endDate"));
            Blob blob = resultSet.getBlob("data");
            if(blob!=null){
                publicKey.setData(blob.getBinaryStream());
            }
            publicKey.setStatus(resultSet.getString("status"));
           return publicKey;
        } catch (SQLException e) {
            return null;
        }

    }
}
