package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.model.PublicKey;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PublicKeyMapper implements IRowMapper<PublicKey> {
    @Override
    public PublicKey mapRow(ResultSet resultSet) {
        try {
           PublicKey publicKey = new PublicKey();
           publicKey.setKeyID(resultSet.getString("keyID"));
           publicKey.setAccountID(resultSet.getString("accountID"));
           publicKey.setTypeCypher(resultSet.getString("typeCypher"));
           publicKey.setStartDate(resultSet.getDate("startDate"));
           publicKey.setEndDate(resultSet.getDate("endDate"));
           publicKey.setContent(resultSet.getString("content"));
            publicKey.setStatus(resultSet.getString("status"));
           return publicKey;
        } catch (SQLException e) {
            return null;
        }

    }
}
