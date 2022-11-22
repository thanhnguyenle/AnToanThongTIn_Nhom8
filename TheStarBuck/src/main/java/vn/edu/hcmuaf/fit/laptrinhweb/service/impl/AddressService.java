package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IAddressDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.AddressDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IAddressService;

import java.util.List;

public class AddressService implements IAddressService {
    private AddressDAO addressDAO = AddressDAO.getInstance();
    private static AddressService instance;
    private AddressService() {
    }

    public static AddressService getInstance(){
        if(instance==null)
            instance = new AddressService();
        return instance;
    }
    @Override
    public List<Address> findAll() {
        return addressDAO.findAll();
    }

    @Override
    public Long save(Address address) {
        return addressDAO.save(address);
    }

    @Override
    public List<Address> getByAccountID(String id) {
        return addressDAO.getByAccountID(id);
    }
}
