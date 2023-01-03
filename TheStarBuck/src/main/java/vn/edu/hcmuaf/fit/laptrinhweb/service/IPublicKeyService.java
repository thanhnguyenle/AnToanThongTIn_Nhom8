package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;

import java.util.List;

public interface IPublicKeyService {
    List<MyCertificate> findAll();

    Long create(MyCertificate publicKey);
    Long update(MyCertificate publicKey);
    Long delete(String id);

    MyCertificate getItem(String id);

    List<MyCertificate> getCertificateByStatus(String accountID,String status);
    List<MyCertificate> getPKByAccountID(String accountID);
}
