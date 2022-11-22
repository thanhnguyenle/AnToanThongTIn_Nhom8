package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Contact;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ContactMapper implements IRowMapper<Contact> {
    @Override
    public Contact mapRow(ResultSet resultSet) {
        try {
            Contact contact = new Contact();
            contact.setId(resultSet.getString("id_co"));
            contact.setIdAccount(resultSet.getString("co_acId"));
            contact.setLocate(resultSet.getString("co_locate"));
            contact.setEmail(resultSet.getString("co_email"));
            contact.setPhone(resultSet.getString("co_mobile"));
            contact.setMessage(resultSet.getString("co_message"));
            contact.setActive(resultSet.getBoolean("co_active"));
            contact.setCreatedDate(resultSet.getDate("createdDate"));
            contact.setModifiedDate(resultSet.getDate("modifiedDate"));
            contact.setCreatedBy(resultSet.getString("createdBy"));
            contact.setModifiedBy(resultSet.getString("modifiedBy"));
            return contact;
        } catch (SQLException e){
            return null;
        }

    }
}
