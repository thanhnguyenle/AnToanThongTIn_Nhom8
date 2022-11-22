package vn.edu.hcmuaf.fit.laptrinhweb.mapper.impl;

import vn.edu.hcmuaf.fit.laptrinhweb.mapper.IRowMapper;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Post;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PostMapper implements IRowMapper<Post> {
    @Override
    public Post mapRow(ResultSet resultSet){
       Post post = new Post();
        try {
            post.setId(resultSet.getString("id_po"));
            post.setTitle(resultSet.getString("po_title"));
            post.setDescription(resultSet.getString("po_description"));
            post.setPost_content(resultSet.getString("po_content"));
            post.setAuthor(resultSet.getString("po_author"));
            post.setImage_url(resultSet.getString("po_url_image"));
            post.setPost_url(resultSet.getString("po_url_post"));
            post.setDate(resultSet.getString("date"));
            return post;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }
}
