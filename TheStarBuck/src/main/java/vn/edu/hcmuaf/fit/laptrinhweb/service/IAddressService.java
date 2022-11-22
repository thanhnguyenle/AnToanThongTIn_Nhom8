package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;

import java.util.List;

public interface IAddressService {
    List<Address> findAll();
    Long save(Address address);
    List<Address> getByAccountID(String id);
}
