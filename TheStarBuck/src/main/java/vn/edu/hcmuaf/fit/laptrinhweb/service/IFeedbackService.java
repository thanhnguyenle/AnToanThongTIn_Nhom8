package vn.edu.hcmuaf.fit.laptrinhweb.service;

import vn.edu.hcmuaf.fit.laptrinhweb.model.FeedBack;

import java.util.List;

public interface IFeedbackService {
    List<FeedBack> findAll();
    Long save(FeedBack feedBack);
    boolean deleteItem(String id);
    FeedBack getItem(String id);
}
