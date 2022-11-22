package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface IAccountDAO extends IGenericDAO<Account>{
    List<Account> findAll();
    Long save(Account account);
    int getAmountItem();
    Account getItem(String id);
    Account getAccountByEmail(String email);
    boolean verifyAccount(String email);
    public String mdbPassword(String password) throws NoSuchAlgorithmException;
}
