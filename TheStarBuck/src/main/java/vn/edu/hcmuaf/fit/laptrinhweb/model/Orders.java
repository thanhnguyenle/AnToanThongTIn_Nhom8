package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Orders extends AbsModel implements Serializable {
    private String id;
    private String idAccount;
    private String idSession;
    private String token;
    private String status;
    private String address;
    private double subTotal;
    private double itemDiscount;
    private double tax;
    private double shipping;
    private double grandTotal;
    private String promo;
    private String note;
    private List<OrderItem> orderItemList;
    private Map<String, Product> productList = new HashMap<>();

    public Orders() {
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id='" + id + '\'' +
                ", idAccount='" + idAccount + '\'' +
                ", idSession='" + idSession + '\'' +
                ", token='" + token + '\'' +
                ", status='" + status + '\'' +
                ", address='" + address + '\'' +
                ", subTotal=" + subTotal +
                ", itemDiscount=" + itemDiscount +
                ", tax=" + tax +
                ", shipping=" + shipping +
                ", grandTotal=" + grandTotal +
                ", promo='" + promo + '\'' +
                ", note='" + note + '\'' +
                ", orderItemList=" + orderItemList +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(String idAccount) {
        this.idAccount = idAccount;
    }

    public String getIdSession() {
        return idSession;
    }

    public void setIdSession(String idSession) {
        this.idSession = idSession;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public double getItemDiscount() {
        return itemDiscount;
    }

    public void setItemDiscount(double itemDiscount) {
        this.itemDiscount = itemDiscount;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public double getShipping() {
        return shipping;
    }

    public void setShipping(double shipping) {
        this.shipping = shipping;
    }

    public double getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(double grandTotal) {
        this.grandTotal = grandTotal;
    }

    public String getPromo() {
        return promo;
    }

    public void setPromo(String promo) {
        this.promo = promo;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setProductList(Map<String, Product> productList) {
        this.productList = productList;
    }

    public Map<String, Product> getProductList() {
        return productList;
    }
}
