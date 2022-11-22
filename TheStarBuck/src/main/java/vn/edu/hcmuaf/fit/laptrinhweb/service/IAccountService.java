package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface IAccountService {
    List<Account> findAll();
    Long save(Account account);
    int getAmountItem();
    Account getAccount(String id);
    Account getAccountByEmail(String email);
    boolean verifyAccount(String email);
    String mdbPassword(String password) throws NoSuchAlgorithmException;
    boolean updatePass(String pass,String id);
}
