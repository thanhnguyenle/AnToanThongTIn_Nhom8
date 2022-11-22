package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.Serializable;

public class Address extends AbsModel  implements Serializable {
    private String id;
    private String idAccount;

    public String getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(String idAccount) {
        this.idAccount = idAccount;
    }

    private String provinceCode;
    private String districtCode;
    private String wardCode;
    private String addressDetails;

    public Address() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getWardCode() {
        return wardCode;
    }

    public void setWardCode(String wardCode) {
        this.wardCode = wardCode;
    }

    public String getAddressDetails() {
        return addressDetails;
    }

    public void setAddressDetails(String addressDetails) {
        this.addressDetails = addressDetails;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id='" + id + '\'' +
                ", idAccount='" + idAccount + '\'' +
                ", provinceCode='" + provinceCode + '\'' +
                ", districtCode='" + districtCode + '\'' +
                ", wardCode='" + wardCode + '\'' +
                ", addressDetails='" + addressDetails + '\'' +
                '}';
    }
}
