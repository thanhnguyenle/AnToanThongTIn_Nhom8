package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IOrderDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.IPublicKeyDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.OrderMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.PublicKeyMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class PublicKeyDAO extends AbstractDAO<PublicKey> implements IPublicKeyDAO {
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
    public List<PublicKey> findAll() {
        return query(QUERIES.PUBLICKEY.GET_LIST,new PublicKeyMapper());
    }

    @Override
    public Long create(PublicKey publicKey) {
        return insert(QUERIES.PUBLICKEY.CREATE,publicKey.getKeyID(),publicKey.getAccountID(),publicKey.getTypeCypher(),new SimpleDateFormat("yyyy-MM-dd").format(publicKey.getStartDate()),new SimpleDateFormat("yyyy-MM-dd").format(publicKey.getEndDate()),publicKey.getContent(),publicKey.getStatus());
    }

    @Override
    public Long update(PublicKey publicKey) {
        return insert(QUERIES.PUBLICKEY.UPDATE,publicKey.getAccountID(),publicKey.getTypeCypher(),new SimpleDateFormat("yyyy-MM-dd").format(publicKey.getStartDate()),new SimpleDateFormat("yyyy-MM-dd").format(publicKey.getEndDate()),publicKey.getContent(),publicKey.getStatus(),publicKey.getKeyID());
    }

    @Override
    public Long delete(String id) {
        return delete(QUERIES.PUBLICKEY.DELETE,id);
    }

    @Override
    public PublicKey getItem(String id) {
        return query(QUERIES.PUBLICKEY.GET_PUBLICKEY_BYID, new PublicKeyMapper(),id).get(0);
    }

    @Override
    public List<PublicKey> getPKByAccountID(String accountID) {
        return query(QUERIES.PUBLICKEY.GET_PUBLICKEY_BYACCOUNTID,new PublicKeyMapper(),accountID);
    }
}
