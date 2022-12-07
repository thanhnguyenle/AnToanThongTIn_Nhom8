package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.PublicKey;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface IPublicKeyService {
    List<PublicKey> findAll();

    Long create(PublicKey publicKey);
    Long update(PublicKey publicKey);
    Long delete(String id);

    PublicKey getItem(String id);
    List<PublicKey> getPKByAccountID(String accountID);
}
