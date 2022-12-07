package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.AccountDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.PublicKeyDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.PublicKey;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IAccountService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPublicKeyService;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PublicKeyService implements IPublicKeyService {
    private PublicKeyDAO publicKeyDAO = PublicKeyDAO.getInstance();
    private static PublicKeyService instance;

    private PublicKeyService() {
    }

    public static PublicKeyService getInstance() {
        if (instance == null)
            instance = new PublicKeyService();
        return instance;
    }

    @Override
    public List<PublicKey> findAll() {
        return publicKeyDAO.findAll();
    }

    @Override
    public Long create(PublicKey publicKey) {
        return publicKeyDAO.create(publicKey);
    }

    @Override
    public Long update(PublicKey publicKey) {
        return publicKeyDAO.update(publicKey);
    }

    @Override
    public Long delete(String id) {
        return publicKeyDAO.delete(id);
    }

    @Override
    public PublicKey getItem(String id) {
        return publicKeyDAO.getItem(id);
    }

    @Override
    public List<PublicKey> getPKByAccountID(String accountID) {
        return publicKeyDAO.getPKByAccountID(accountID);
    }
}
