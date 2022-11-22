package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Contact;

import java.util.List;
import java.util.Map;

public interface IContactDAO extends  IGenericDAO<Contact> {
    List<Contact> findAll();
    Long save(Contact contact);
    Long deleteItem(String id);
    Contact getItem(String id);
    Map<String, Contact> getAll();
    Long addItem(Contact contact);
    Long updateItem(Contact contact);
}
