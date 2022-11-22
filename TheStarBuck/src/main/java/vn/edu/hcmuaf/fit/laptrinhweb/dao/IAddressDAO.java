package vn.edu.hcmuaf.fit.laptrinhweb.dao;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;

import java.util.List;

public interface IAddressDAO extends IGenericDAO<Address>{
    List<Address> findAll();
    Long save(Address address);
    Long addItem(Address address);
    Long updateItem(Address address);
    List<Address> getByAccountID(String id);
}
