package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.InputStream;
import java.io.Serializable;

public class Bill extends AbsModel implements Serializable {
    private String billID;
    private String accountID;
    private InputStream data;
    private long timestamp;

    public Bill() {
    }

    public String getBillID() {
        return billID;
    }

    public void setBillID(String billID) {
        this.billID = billID;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public InputStream getData() {
        return data;
    }

    public void setData(InputStream data) {
        this.data = data;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }
}
