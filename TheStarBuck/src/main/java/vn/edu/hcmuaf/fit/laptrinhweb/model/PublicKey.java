package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.Serializable;
import java.util.Date;

public class PublicKey extends AbsModel implements Serializable {
    private String keyID;
    private String accountID;

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    private String typeCypher;
    private Date startDate;
    private Date endDate;
    private String content;
    private String status;

    public String getKeyID() {
        return keyID;
    }

    public void setKeyID(String keyID) {
        this.keyID = keyID;
    }

    public String getTypeCypher() {
        return typeCypher;
    }

    public void setTypeCypher(String typeCypher) {
        this.typeCypher = typeCypher;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
