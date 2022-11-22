package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.FeedBack;

import java.sql.ResultSet;
import java.sql.SQLException;

public class FeedbackMapper implements IRowMapper<FeedBack> {
    @Override
    public FeedBack mapRow(ResultSet resultSet) {
        try {
            FeedBack feedBack = new FeedBack();
            feedBack.setId(resultSet.getString("id_fe"));
            feedBack.setIdAccount(resultSet.getString("fe_acId"));
            feedBack.setIdProduct(resultSet.getString("fe_prId"));
            feedBack.setContent(resultSet.getString("fe_content"));
            feedBack.setRate(resultSet.getInt("fe_rate"));
            feedBack.setStatus(resultSet.getString("fe_status"));
            feedBack.setCreatedDate(resultSet.getDate("createdDate"));
            feedBack.setModifiedDate(resultSet.getDate("modifiedDate"));
            feedBack.setCreatedBy(resultSet.getString("createdBy"));
            feedBack.setModifiedBy(resultSet.getString("modifiedBy"));
            return  feedBack;
        } catch (SQLException e){
            return null;
        }
    }
}
