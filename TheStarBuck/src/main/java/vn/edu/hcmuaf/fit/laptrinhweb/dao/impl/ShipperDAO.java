package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IShipperDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.ShipperMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ShipperDAO extends  AbstractDAO<Shipper> implements IShipperDAO {
    private static ShipperDAO instance;
    private ShipperDAO(){}
    public static ShipperDAO getInstance(){
        if(instance == null){
            instance = new ShipperDAO();
        }
        return instance;
    }
    @Override
    public List<Shipper> findAll() {
        List<Shipper> output = query(QUERIES.SHIPPER.GET_LIST, new ShipperMapper());
        return output;
    }

    @Override
    public Long save(Shipper shipper) {
        if(shipper.getId().equals("")){
            return addItem(shipper);
        }
        return updateItem(shipper);
    }

    @Override
    public Long deleteItem(String id) {
        long output = delete(QUERIES.SHIPPER.DELETE, id);
        return output;
    }

    @Override
    public Shipper getItem(String id) {
        List<Shipper> list = query(QUERIES.SHIPPER.GET_ITEM_BYID, new ShipperMapper(), id);
        Shipper shipper = list.get(0);
        return shipper;
    }

    @Override
    public Map<String, Shipper> getAll() {
        return null;
    }

    @Override
    public Long addItem(Shipper shipper) {
        long output = insert(QUERIES.SHIPPER.CREATE, shipper.getId(), shipper.getName(), shipper.getMobile(), shipper.getAddress(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), shipper.getCreatedBy(), shipper.getCreatedBy());
        return output;
    }

    @Override
    public Long updateItem(Shipper shipper) {
        long output  = update(QUERIES.SHIPPER.UPDATE, shipper.getName(), shipper.getMobile(), shipper.getAddress(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), shipper.getModifiedBy(), shipper.getId());
        return output;
    }
}
