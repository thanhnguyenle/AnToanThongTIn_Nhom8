package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Contact;

import java.util.List;

public interface IContactService {
    List<Contact> findAll();
    boolean save(Contact contact);
    boolean deleteItem(String id);
    Contact getItem(String id);
}
