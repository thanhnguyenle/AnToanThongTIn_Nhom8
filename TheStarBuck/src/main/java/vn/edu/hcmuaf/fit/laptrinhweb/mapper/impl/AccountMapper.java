package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountMapper implements IRowMapper<Account> {
    @Override
    public Account mapRow(ResultSet resultSet) {
       try{
           Account account = new Account();
           account.setId(resultSet.getString("id_ac"));
           account.setUsername(resultSet.getString("ac_username"));
           account.setFullname(resultSet.getString("ac_fullname"));
           account.setActive(resultSet.getBoolean("ac_active"));
           account.setPhoneNumber(resultSet.getString("ac_mobile"));
           account.setEmail(resultSet.getString("ac_email"));
           account.setEmailVerifiedAt(resultSet.getDate("ac_emailVerifiedAt"));
           account.setPassword(resultSet.getString("ac_password"));
           account.setAvatar(resultSet.getString("ac_avatar"));
           account.setAddressId(resultSet.getString("ac_addressId"));
           account.setAboutMe(resultSet.getString("ac_about"));
           account.setRememberToken(resultSet.getString("ac_rememberToken"));
           account.setLastLogin(resultSet.getDate("ac_lastLogin"));
           account.setGroupId(resultSet.getString("ac_groupId"));
           account.setCreatedDate(resultSet.getDate("createdDate"));
           account.setModifiedDate(resultSet.getDate("modifiedDate"));
           account.setCreatedBy(resultSet.getString("createdBy"));
           account.setModifiedBy(resultSet.getString("modifiedBy"));
      return account;
       }catch(SQLException e){
           e.printStackTrace();
        return null;
       }
    }
}
