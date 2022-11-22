package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IContactDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.ContactMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.ShipperMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Contact;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ContactDAO extends AbstractDAO<Contact> implements IContactDAO {
    private static ContactDAO instance;
    private ContactDAO(){}
    public static ContactDAO getInstance(){
        if(instance == null){
            instance = new ContactDAO();
        }
        return instance;
    }
    @Override
    public List<Contact> findAll() {
        List<Contact> output = query(QUERIES.CONTACT.GET_LIST, new ContactMapper());
        return output;
    }

    @Override
    public Long save(Contact contact) {
        if(contact.getId().equals("")){
            return addItem(contact);
        } else {
            return updateItem(contact);
        }
    }

    @Override
    public Long deleteItem(String id) {
        long output = delete(QUERIES.CONTACT.DELETE, id);
        return output;
    }

    @Override
    public Contact getItem(String id) {
        List<Contact> list = query(QUERIES.CONTACT.GET_ITEM_BYID, new ContactMapper(), id);
        Contact contact = list.get(0);
        return contact;
    }

    @Override
    public Map<String, Contact> getAll() {
        return null;
    }

    @Override
    public Long addItem(Contact contact) {
        return null;
    }

    @Override
    public Long updateItem(Contact contact) {
        return null;
    }

    public boolean addContact(String name,String email,String messges){
        System.out.println(name+" - "+email+" - "+messges);
        long number = insert(QUERIES.CONTACT.CREATE,"","ac0001",name,email,"",messges,1, new SimpleDateFormat("yyyy-MM-dd").format(new Date()), new SimpleDateFormat("yyyy-MM-dd").format(new Date()),"NONE","NONE");
   return number == 1;
    }
}
