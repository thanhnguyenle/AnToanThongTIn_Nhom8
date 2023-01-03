package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BillMapper implements IRowMapper<Bill> {
    @Override
    public Bill mapRow(ResultSet resultSet) {
        try {
           Bill bill = new Bill();
           bill.setBillID(resultSet.getString("billID"));
           bill.setAccountID(resultSet.getString("accountID"));
            Blob blob = resultSet.getBlob("data");
            if(blob!=null){
                bill.setData(blob.getBinaryStream());
            }
            bill.setTimestamp(resultSet.getLong("timestamp"));
           return bill;
        } catch (SQLException e) {
            return null;
        }

    }
}
