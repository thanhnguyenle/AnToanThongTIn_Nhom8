package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

public class MyCertificate extends AbsModel implements Serializable {
    public final static String AVAILABLE = "AVAILABLE";
    public final static String EXPIRED = "EXPIRED";
    public final static String UNSAFE = "UNSAFE";
    public final static String DELETED = "DELETED";
    public static final String SELECTED = "SELECTED";
    private String keyID;
    private String accountID;

    private Long startDate;
    private Long endDate;
    private InputStream data;
    private String status;

    public MyCertificate() {
    }

    public String getKeyID() {
        return keyID;
    }

    public void setKeyID(String keyID) {
        this.keyID = keyID;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public Long getStartDate() {
        return startDate;
    }

    public void setStartDate(Long startDate) {
        this.startDate = startDate;
    }

    public Long getEndDate() {
        return endDate;
    }

    public void setEndDate(Long endDate) {
        this.endDate = endDate;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public InputStream getData() {
        return data;
    }

    public void setData(InputStream data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "MyCertificate{" +
                "keyID='" + keyID + '\'' +
                ", accountID='" + accountID + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", data=" + data +
                ", status='" + status + '\'' +
                '}';
    }
}
