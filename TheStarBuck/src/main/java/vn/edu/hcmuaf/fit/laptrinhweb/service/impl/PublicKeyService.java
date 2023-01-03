package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.PublicKeyDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPublicKeyService;

import java.util.List;

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
    public List<MyCertificate> findAll() {
        return publicKeyDAO.findAll();
    }

    @Override
    public Long create(MyCertificate publicKey) {
        return publicKeyDAO.create(publicKey);
    }

    @Override
    public Long update(MyCertificate publicKey) {
        return publicKeyDAO.update(publicKey);
    }

    @Override
    public Long delete(String id) {
        return publicKeyDAO.delete(id);
    }

    @Override
    public MyCertificate getItem(String id) {
        return publicKeyDAO.getItem(id);
    }

    @Override
    public List<MyCertificate> getCertificateByStatus(String accountID, String status) {
        return publicKeyDAO.getCertificateByStatus(accountID,status);
    }

    @Override
    public List<MyCertificate> getPKByAccountID(String accountID) {
        return publicKeyDAO.getPKByAccountID(accountID);
    }
}
