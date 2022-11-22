package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Slide;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SlideMapper implements IRowMapper<Slide> {
    @Override
    public Slide mapRow(ResultSet resultSet) {
        try{
            Slide slide = new Slide();
            slide.setId(resultSet.getString("id_sl"));
            slide.setImage(resultSet.getString("sl_image"));
            slide.setNote(resultSet.getString("sl_note"));
            slide.setGreetingH2(resultSet.getString("sl_greeting_h2"));
            slide.setGreetingSpan(resultSet.getString("sl_greeting1_span"));
            slide.setGreetingP(resultSet.getString("sl_greeting2_p"));
            slide.setActive(resultSet.getBoolean("sl_active"));
            slide.setCreatedDate(resultSet.getDate("createdDate"));
            slide.setModifiedDate(resultSet.getDate("modifiedDate"));
            slide.setCreatedBy(resultSet.getString("createdBy"));
            slide.setModifiedBy(resultSet.getString("modifiedBy"));
            return slide;
        }catch(SQLException e){
            return null;
        }
    }
}
