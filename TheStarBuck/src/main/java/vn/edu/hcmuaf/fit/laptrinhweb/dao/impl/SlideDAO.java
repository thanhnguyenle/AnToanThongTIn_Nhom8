package vn.edu.hcmuaf.fit.laptrinhweb.dao.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.ISlideDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.db.QUERIES;
import vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl.SlideMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Slide;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class SlideDAO extends  AbstractDAO<Slide> implements ISlideDAO {
    private static SlideDAO instance;
    private SlideDAO(){}

    public static SlideDAO getInstance() {
        if(instance == null)
            instance = new SlideDAO();
        return instance;
    }

    @Override
    public List<Slide> findAll() {
        return query(QUERIES.SLIDER.GET_LIST,new SlideMapper());
    }

    @Override
    public Long save(Slide slide) {
        return null;
    }

    @Override
    public List<Slide> printTypeSlide(String type,int num) {
        return query(QUERIES.SLIDER.GETBANNER,new SlideMapper(),type,num);
    }

    @Override
    public Long deleteItem(String id) {
        long output = delete(QUERIES.SLIDER.DELETE, id);
        return output;
    }

    public Slide getItem(String id) {
        return query(QUERIES.SLIDER.GET_ITEM_BYID,new SlideMapper(),id).get(0);
    }

    @Override
    public Long update(String greetingH2, String greetingSpan, String greetingP, boolean active, String type) {
        return update(QUERIES.SLIDER.UPDATE, greetingH2,greetingSpan,greetingP,active, new SimpleDateFormat("yyyy-MM-dd").format(new Date()), "hello",type);
    }

    @Override
    public Long updateImageByID(String id, String image, String type) {
        return update(QUERIES.SLIDER.UPDATE_IMAGE_TITLE_BYID,image,new SimpleDateFormat("yyyy-MM-dd").format(new Date()), "hello",type,id);
    }
}
