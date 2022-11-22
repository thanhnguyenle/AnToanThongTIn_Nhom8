package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.AccountDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IAccountService;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AccountService implements IAccountService {
    private AccountDAO accountDAO = AccountDAO.getInstance();
    private static AccountService instance;
    private AccountService() {
    }

    public static AccountService getInstance(){
        if(instance==null)
            instance = new AccountService();
        return instance;
    }

    @Override
    public List<Account> findAll() {
        return accountDAO.findAll();
    }

    @Override
    public Long save(Account account) {
        return accountDAO.save(account);
    }

    @Override
    public int getAmountItem() {
        return accountDAO.getAmountItem();
    }

    @Override
    public Account getAccount(String id) {
        return accountDAO.getItem(id);
    }

    @Override
    public Account getAccountByEmail(String email) {
        return accountDAO.getAccountByEmail(email);
    }

    @Override
    public boolean verifyAccount(String email) {
        return accountDAO.verifyAccount(email);
    }

    public Map<String, Account> getAll(){
        return  AccountDAO.getInstance().getAll();
    }

    public Account login(String username, String password){
        return accountDAO.login(username, password);
    }

    public boolean checkUsername(String username){
        return accountDAO.checkUsername(username);
    }
    public boolean checkUserEmail(String email){
        return accountDAO.checkUserEmail(email);
    }
    public boolean registerByGoogle(String username, String email, String avatar,String fullname)  {
        Account account = new Account();
        account.setUsername(username);
        account.setEmail(email);
        account.setAvatar(avatar);
        account.setFullname(fullname);
        account.setActive(true);
        account.setGroupId("MEMBER");
        account.setAddressId("");
        account.setPhoneNumber("");
        account.setAboutMe("");
        account.setCreatedBy(fullname);
        account.setModifiedBy(fullname);
        account.setEmailVerifiedAt(null);
        account.setId("");
        accountDAO.registerAd(account);
        return true;
    }
    public Map<String, Object> register(String username, String email, String password,String retypepassword) throws NoSuchAlgorithmException {
        Map<String, Object> output = new HashMap<>();
        if(username.isEmpty() || email.isEmpty() || password.isEmpty() || retypepassword.isEmpty()){
            output.put("pleaseFill", "Please fill");
        }
        if(!accountDAO.register(username, email, password)){
            if(checkUsername(username)){
                output.put("errorUsername", "Username is exist");
            }
            if(accountDAO.checkUserEmail(email)){
                output.put("errorEmail", "Email is used");
            }
            if(!retypepassword.equals(password)){
                output.put("errorPassword", "Retyped password is wrong");
            }
        }
        return output;
    }
    public boolean checkChangePass(String passwordOld,String passwordNew) throws NoSuchAlgorithmException {
       return accountDAO.checkChangePass(passwordOld,passwordNew);
    }
    public String mdbPassword(String password) throws NoSuchAlgorithmException {
        return accountDAO.mdbPassword(password);
    }
    public Account getAcc(String id){
        return AccountDAO.getInstance().getItem(id);
    }

    public boolean deleteItem(String id){
        return accountDAO.deleteItem(id) == 1;
    }

    public boolean updateAuth(Account account){
        return accountDAO.editAuth(account);
    }
    public boolean updatePass(String pass,String id){
        return accountDAO.editPassword(pass,id);
    }


}
