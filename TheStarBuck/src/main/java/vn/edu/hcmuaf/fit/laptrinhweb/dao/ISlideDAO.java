package vn.edu.hcmuaf.fit.laptrinhweb.dao;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Slide;

import java.util.List;

public interface ISlideDAO extends IGenericDAO<Slide> {
    List<Slide> findAll();
    Long save(Slide slide);
    List<Slide> printTypeSlide(String type,int num);
    Long deleteItem(String id);
    Slide getItem(String id);
    Long update(String greetingH2,String greetingSpan,String greetingP,boolean active,String type);
    Long updateImageByID(String id,String image,String type);
}
