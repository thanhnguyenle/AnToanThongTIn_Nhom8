package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IFeedbackDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.FeedbackMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.FeedBack;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class FeedbackDAO extends  AbstractDAO<FeedBack> implements IFeedbackDAO {
    private static FeedbackDAO instance;
    private FeedbackDAO(){}
    public static FeedbackDAO getInstance(){
        if(instance == null){
            instance = new FeedbackDAO();
        }
        return instance;
    }
    @Override
    public List<FeedBack> findAll() {
        List<FeedBack> output = query(QUERIES.FEEDBACK.GET_LIST, new FeedbackMapper());
        return output;
    }

    @Override
    public Long save(FeedBack feedBack) {
        if(feedBack.getId().equals("")){
            return addItem(feedBack);
        } else {
            return updateItem(feedBack);
        }
    }

    @Override
    public Long deleteItem(String id) {
        long output = delete(QUERIES.FEEDBACK.DELETE, id);
        return output;
    }

    @Override
    public FeedBack getItem(String id) {
        List<FeedBack> list = query(QUERIES.FEEDBACK.GET_ITEM_BYID, new FeedbackMapper(), id);
        FeedBack output = list.get(0);
        return output;
    }

    @Override
    public Map<String, FeedBack> getAll() {
        return null;
    }

    @Override
    public Long addItem(FeedBack feedBack) {
        long output = insert(QUERIES.FEEDBACK.CREATE, feedBack.getId(), feedBack.getIdAccount(), feedBack.getIdProduct(), feedBack.getContent(), feedBack.getRate(), feedBack.getStatus(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), feedBack.getCreatedBy(), feedBack.getCreatedBy());
        return output;
    }

    @Override
    public Long updateItem(FeedBack feedBack) {
        long output = update(QUERIES.FEEDBACK.UPDATE, feedBack.getStatus(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), feedBack.getModifiedBy(), feedBack.getId());
        return output;
    }
}
