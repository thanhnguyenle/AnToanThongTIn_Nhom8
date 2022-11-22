package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.ShipperDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IShipperService;

import java.util.List;

public class ShipperService implements IShipperService {
    private ShipperDAO shipperDAO = ShipperDAO.getInstance();
    private static ShipperService instance;
    private ShipperService(){}
    public static ShipperService getInstance(){
        if(instance == null){
            instance = new ShipperService();
        }
        return instance;
    }
    @Override
    public List<Shipper> findAll() {
        return shipperDAO.findAll();
    }

    @Override
    public boolean save(Shipper shipper) {
        return shipperDAO.save(shipper) == 1;
    }

    @Override
    public boolean deleteItem(String id) {
        return shipperDAO.deleteItem(id) == 1;
    }

    @Override
    public Shipper getItem(String id) {
        return shipperDAO.getItem(id);
    }
}
