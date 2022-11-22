package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.ContactDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Contact;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IContactService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContactService implements IContactService {
    private ContactDAO contactDAO = ContactDAO.getInstance();
    private static ContactService instance;
    private ContactService(){}
    public static  ContactService getInstance(){
        if(instance == null){
            instance = new ContactService();
        }
        return instance;
    }
    @Override
    public List<Contact> findAll() {
        return contactDAO.findAll();
    }

    @Override
    public boolean save(Contact contact) {
        return contactDAO.save(contact) == 1;
    }

    @Override
    public boolean deleteItem(String id) {
        return contactDAO.deleteItem(id) == 1;
    }

    @Override
    public Contact getItem(String id) {
        return null;
    }

    public boolean addContact(String name,String email,String message){
        return contactDAO.addContact(name, email, message);
    }
}
