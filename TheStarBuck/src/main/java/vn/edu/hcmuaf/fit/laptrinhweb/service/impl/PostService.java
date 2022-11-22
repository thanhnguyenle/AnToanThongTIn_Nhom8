package vn.edu.hcmuaf.fit.laptrinhweb.service.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.dao.IPostDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.OrderDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.dao.impl.PostDAO;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Post;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.IPageAble;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPostService;

import java.util.List;

public class PostService implements IPostService {
    private IPostDAO postDAO;
    private static PostService instance;
    private PostService(){
        this.postDAO =PostDAO.getInstance();
    }
    public static PostService getInstance(){
        if(instance == null){
            instance = new PostService();
        }
        return instance;
    }


    @Override
    public List<Post> findAll() {
        return postDAO.findAll();
    }

    @Override
    public Long delete(String id) {
        return postDAO.delete(id);
    }

    @Override
    public Long add(Post post) {
        return postDAO.add(post);
    }

    @Override
    public Long update(String id, Post post) {
        return postDAO.update(id,post);
    }

    @Override
    public List<Post> findAll(IPageAble pageAble,String text) {
        return postDAO.findAll(pageAble,text);
    }

    @Override
    public Post findById(String id) {
        return postDAO.findById(id);
    }

    @Override
    public int total() {
        return postDAO.total();
    }
}
