package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper;

import java.util.List;

public interface IShipperService {
    List<Shipper> findAll();
    boolean save(Shipper shipper);
    boolean deleteItem(String id);
    Shipper getItem(String id);
}
