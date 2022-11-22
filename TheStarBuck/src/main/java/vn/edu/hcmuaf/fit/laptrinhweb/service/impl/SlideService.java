package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.ISlideDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.AccountDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.SlideDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Slide;
import vn.edu.hcmuaf.fit.laptrinhweb.service.ISlideService;

import java.util.List;

public class SlideService implements ISlideService {
    private final SlideDAO slideDAO = SlideDAO.getInstance();
    private static SlideService instance;
    private SlideService() {
    }

    public static SlideService getInstance(){
        if(instance==null)
            instance = new SlideService();
        return instance;
    }

    @Override
    public List<Slide> findAll() {
        return slideDAO.findAll();
    }

    public Slide getItem(String id){
        return slideDAO.getItem(id);
    }
    @Override
    public Long save(Slide slide) {
        return slideDAO.save(slide);
    }

    @Override
    public List<Slide> printTypeSlide(String type,int num) {
        return slideDAO.printTypeSlide(type,num);
    }

    @Override
    public Long deleteItem(String id) {
        return slideDAO.delete(id);
    }

    @Override
    public Long update(String greetingH2, String greetingSpan, String greetingP, boolean active, String type) {
        return slideDAO.update(greetingH2,greetingSpan,greetingP,active,type);
    }

    @Override
    public Long updateImageByID(String id, String image, String type) {
        return slideDAO.updateImageByID(id,image,type);
    }
}
