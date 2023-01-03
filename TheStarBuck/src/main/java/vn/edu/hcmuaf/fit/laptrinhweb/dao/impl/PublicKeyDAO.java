package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IPublicKeyDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.PublicKeyMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.*;

import java.text.SimpleDateFormat;
import java.util.List;

public class PublicKeyDAO extends AbstractDAO<MyCertificate> implements IPublicKeyDAO {
    private static PublicKeyDAO instance;

    private PublicKeyDAO() {
    }

    public static PublicKeyDAO getInstance() {
        if (instance == null) {
            instance = new PublicKeyDAO();
        }
        return instance;
    }


    @Override
    public List<MyCertificate> findAll() {
        return query(QUERIES.CERTIFICATE.GET_LIST,new PublicKeyMapper());
    }

    @Override
    public Long create(MyCertificate publicKey) {
        return insert(QUERIES.CERTIFICATE.CREATE,publicKey.getKeyID(),publicKey.getAccountID(),publicKey.getStartDate(),publicKey.getEndDate(),publicKey.getData(),publicKey.getStatus());
    }

    @Override
    public Long update(MyCertificate publicKey) {
        return insert(QUERIES.CERTIFICATE.UPDATE,publicKey.getAccountID(),publicKey.getStartDate(),publicKey.getEndDate(),publicKey.getData(),publicKey.getStatus(),publicKey.getKeyID());
    }

    @Override
    public Long delete(String id) {
        return delete(QUERIES.CERTIFICATE.DELETE,id);
    }

    @Override
    public MyCertificate getItem(String id) {
        return query(QUERIES.CERTIFICATE.GET_PUBLICKEY_BYID, new PublicKeyMapper(),id).get(0);
    }

    @Override
    public List<MyCertificate> getCertificateByStatus(String accountID, String status) {
        return query(QUERIES.CERTIFICATE.GET_CERTIFICATE_STATUS,new PublicKeyMapper(),status,accountID);
    }

    @Override
    public List<MyCertificate> getPKByAccountID(String accountID) {
        return query(QUERIES.CERTIFICATE.GET_PUBLICKEY_BYACCOUNTID,new PublicKeyMapper(),accountID);
    }
}
