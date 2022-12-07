package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.PublicKey;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface IPublicKeyDAO extends IGenericDAO<PublicKey> {
    List<PublicKey> findAll();

    Long create(PublicKey publicKey);
    Long update(PublicKey publicKey);
    Long delete(String id);

    PublicKey getItem(String id);
    List<PublicKey> getPKByAccountID(String accountID);


}
