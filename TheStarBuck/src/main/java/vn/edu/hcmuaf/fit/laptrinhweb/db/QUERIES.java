package vn.edu.hcmuaf.fit.laptrinhweb.db;

public class QUERIES {
//    ACCOUNT
    public static class ACCOUNT {
        public static final String GET_LIST = "select * from account";
        public static final String CREATE = "insert into Account values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        public static final String DELETE = "delete from Account where id_ac = ?";
        public static final String GET_ITEM_BYID = "select * from Account where id_ac = ?";
        public static final String GET_ITEM_BYNAME = "select * from Account where ac_name = ?";
        public static final String LOGIN = "select * from Account where ac_username = ? and ac_password = ?";
        public static final String GET_ITEM_BYUSERNAME = "select * from Account where ac_username = ?";
        public static final String GET_ITEM_BYEMAIL = "select * from Account where ac_email = ?";
        public static final String UPDATE = "update Account set ac_active = ?, ac_lastLogin = ?, ac_groupId = ?, ac_avatar = ?,modifiedDate = ?, modifiedBy = ?  where id_ac = ?";
        public static final String UPDATE_PROFILE = "update Account set ac_fullname = ?, ac_mobile = ?, ac_email = ?, ac_avatar = ?, ac_addressId = ?, ac_lastLogin = ?, modifiedDate = ?, modifiedBy = ? where id_ac = ?";
        public static final String COUNT_ITEM = "select COUNT(*) from account";
        public static final String VERIFY_ACCOUNT = "update Account set ac_emailVerifiedAt = ? WHERE id_ac = ?";
        public static final String CHANGEPASS = "update Account ac_password = ? where id_ac=?";

    }

//    Product
public static class PRODUCT {
    public static final String GET_LIST = "select * from Product";
    public static final String GET_LIST_LATEST = "SELECT * FROM `Product` ORDER BY createdDate DESC  LIMIT ?";
    public static final String GET_LIST_FEATURED = "SELECT * FROM `Product` ORDER BY pr_view DESC  LIMIT ?";
    public static final String GET_LIST_HOT = "SELECT * FROM `Product` ORDER BY pr_hot DESC  LIMIT ?";
    public static final String CREATE = "insert into Product values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    public static final String DELETE = "delete from Product where id_pr = ?";
    public static final String GET_ITEM_BYID = "select * from Product where id_pr = ?";
    public static final String GET_ITEM_BYNAME = "select * from Product where pr_name = ?";
    public static final String UPDATE = "update Product set pr_name = ?, pr_csId = ?, pr_ingredients = ?, pr_price = ?, pr_discount = ?, pr_quantity = ?, pr_active = ?, pr_hot = ?, pr_view = ?, pr_description = ?, pr_image = ?, pr_descriptionSeo = ?, pr_keywordSeo = ?, pr_titleSeo = ?, pr_note = ?, modifiedDate = ?, modifiedBy = ? where id_pr = ?";
    public static final String TOTAL_ITEM = "select count(*) from Product";
    public static final String SEARCH_BY_NAME = "select * from Product where pr_name like ?";
    }

//CATEGORY
public static class CATEGORY{
        public static  final String GET_LIST = "select * from Category";
        public static  final String CREATE = "insert into Category values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        public static  final String DELETE = "delete from Category where id_cs = ?";
        public static  final String UPDATE = "update Category set cs_name = ?, cs_icon = ?, cs_avatar = ?, cs_active = ?, modifiedDate = ?, modifiedBy = ? where id_cs = ?";
        public static  final String GET_ITEM_BYID = "select * from Category where id_cs = ?";
}

// Slider
public static class SLIDER {
    public static  final String GET_LIST = "select * from Slide";
    public static  final String GET_ITEM_BYID = "select * from Slide where id_sl = ?";
    public static final String CREATE = "insert into Slide values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    public static final String UPDATE = "update Slide set sl_greeting_h2 = ?, sl_greeting1_span = ?, sl_greeting2_p = ?, sl_active = ?,modifiedDate = ?, modifiedBy = ? where sl_note = ?";
    public static final String UPDATE_IMAGE_TITLE_BYID = "update  Slide set sl_image = ?,modifiedDate = ?, modifiedBy = ? where sl_note = ? and id_sl = ?";
    public static final String DELETE = "delete from Product where id_sl = ?";
    public static final String GETBANNER = "SELECT * FROM Slide WHERE sl_note=? ORDER BY createdDate DESC  LIMIT ?";
}

//TOPPING
public static class TOPPING{
    public static  final String GET_LIST = "select * from Topping";
    public static  final String CREATE = "insert into Topping values (?, ?, ?, ?, ?, ?, ?, ?)";
    public static  final String DELETE = "delete from Topping where id_tp = ?";
    public static  final String UPDATE = "update Topping set tp_name = ?, tp_quantity = ?, tp_price = ?, modifiedDate = ?, modifiedBy = ? where id_tp = ?";
    public static  final String GET_ITEM_BYID = "select * from Topping where id_tp = ?";
}

//SHIPPER
public static class SHIPPER{
    public static  final String GET_LIST = "select * from Shipper";
    public static  final String CREATE = "insert into Shipper values (?, ?, ?, ?, ?, ?, ?, ?)";
    public static  final String DELETE = "delete from Shipper where id_sh = ?";
    public static  final String UPDATE = "update Shipper set sh_name = ?, sh_mobile = ?, sh_adress = ?, modifiedDate = ?, modifiedBy = ? where id_sh = ?";
    public static  final String GET_ITEM_BYID = "select * from Shipper where id_sh = ?";
}

    //CONTACT
    public static class CONTACT{
        public static  final String GET_LIST = "select * from Contact";
        public static  final String CREATE = "insert into contact values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        public static  final String DELETE = "delete from Contact where id_co = ?";
        public static  final String UPDATE = "update Contact set co_active = ?, modifiedDate = ?, modifiedBy = ? where id_co = ?";
        public static  final String GET_ITEM_BYID = "select * from Contact where id_co = ?";
    }
    //FEEDBACK
    public static class FEEDBACK{
        public static  final String GET_LIST = "select * from Feedback";
        public static  final String CREATE = "insert into Feedback values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        public static  final String DELETE = "delete from Feedback where id_fe = ?";
        public static  final String UPDATE = "update Feedback set fe_status = ?, modifiedDate = ?, modifiedBy = ? where id_fe = ?";
        public static  final String GET_ITEM_BYID = "select * from Feedback where id_fe = ?";
    }

    //ORDER
    public static class ORDER{
        public static  final String GET_LIST = "select * from orders";
        public static  final String CREATE = "insert into orders values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        public static  final String DELETE = "delete from orders where id_od = ?";
        public static  final String UPDATE = "update orders set od_status = ?, modifiedDate = ?, modifiedBy = ? where id_od = ?";
        public static  final String GET_ITEM_BYID = "select * from orders where id_od = ?";
        public static  final String GET_LAST_BYACCID = "select * from orders where od_acId = ? order by id_od DESC";
        public static  final String COUNT_ITEM = "select COUNT(*) from orders";
        public static  final String SUM_MONEY = "select sum(od_grandTotal) from orders";
    }

    //ADDRESS
    public static  class  ADDRESS {
        public static final String GET_LIST = "select * from address";
        public static final String CREATE = "insert into address values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        public static final String DELETE = "delete from address where id_ad = ?";
        public static final String UPDATE = "update address set modifiedDate = ?, modifiedBy = ? where id_ar = ?";
        public static final String GET_ITEM_BYID = "select * from address where id_ar = ?";
        public static final String GET_BY_ACCID = "select * from address where ad_userId = ?";
    }

    //ORDERITEM
    public static class ORDERITEM{
        public static  final String GET_LIST = "select * from orderitem";
        public static  final String CREATE = "insert into orderitem values (?, ?, ?, ?, ?, ?, ?, ?)";
        public static  final String DELETE = "delete from orderitem where oi_prId = ? and oi_orId = ?";
        public static  final String UPDATE = "update orderitem set od_status = ?, modifiedDate = ?, modifiedBy = ? where oi_prId = ? and oi_orId = ?";
        public static  final String GET_ITEM_BYID = "select * from orderitem where oi_prId = ? and oi_orId = ?";
    }

    public static class POST{
        public static  final String GET_LIST = "select * from Post";
        public static  final String CREATE = "insert into Post(id_po,po_title, po_description, po_content, po_author,po_url_image,po_url_post,date) values (?, ?, ?, ?, ?, ?, ?,?)";
        public static  final String DELETE = "delete from Post where id_po = ?";
        public static  final String UPDATE = "update Post set po_title=?, po_description=?, po_content=?, po_author=?,	po_url_image=?,	po_url_post=?,date=? where id_po=?";
        public static  final String GET_POST_BYID = "select * from Post where id_po=?";
        public static final String TOTAL = "select COUNT(*) from Post";
    }

}
