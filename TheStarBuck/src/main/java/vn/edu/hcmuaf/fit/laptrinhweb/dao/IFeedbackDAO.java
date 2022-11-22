package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.FeedBack;

import java.util.List;
import java.util.Map;

public interface IFeedbackDAO extends IGenericDAO<FeedBack> {
    List<FeedBack> findAll();
    Long save(FeedBack feedBack);
    Long deleteItem(String id);
    FeedBack getItem(String id);
    Map<String, FeedBack> getAll();
    Long addItem(FeedBack feedBack);
    Long updateItem(FeedBack feedBack);
}
