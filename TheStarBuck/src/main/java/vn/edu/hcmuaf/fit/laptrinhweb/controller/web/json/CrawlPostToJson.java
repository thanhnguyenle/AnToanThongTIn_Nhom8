package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.json;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Post;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPostService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PostService;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class CrawlPostToJson {
    private IPostService iPostService ;
    private static CrawlPostToJson instance = null;
    private CrawlPostToJson(){
        iPostService = PostService.getInstance();
    }
    public static CrawlPostToJson getInstance(){
        if(instance==null) instance = new CrawlPostToJson();
        return instance;
    }
    public static void main(String[] args) {
        CrawlPostToJson crawlObj = CrawlPostToJson.getInstance();
        String str = crawlObj.crawlPostAt("https://punchdrink.com/articles/most-popular-best-cocktail-recipes/");
        System.out.println(str);

        for(int i = 1;i<10;i++){
            List<Post> list = crawlObj.crawlDataAt(i);
            for(Post pos:list){
               //pos.setPost_content(crawlObj.crawlPostAt(pos.getPost_url()));
               // System.out.println(pos);
                crawlObj.iPostService.add(pos);
            }
        }
    }

    public List<Post> crawlDataAt(int page) {
        List<Post> posts = new LinkedList<>();
        String url = "https://punchdrink.com/articles/page";
        Document document = connectToWebsite(url + "/" + page);
        if (document != null) {
            Element content = document.getElementById("content");
            Elements blockElement = content.getElementsByClass("tease-grid--archive feature-excerpt clearfix");
            Element blockElementFirst = blockElement.first();
            Elements nodes = blockElementFirst.getElementsByClass("tease  ");
            for (Element element : nodes) {
                // new post
                Post post = new Post();
                post.setId("");
                post.setPost_url(element.getElementsByClass("tease__figure").first()
                        .getElementsByClass("tease__image-link").first().attr("href"));
                post.setImage_url(element.getElementsByClass("tease__figure").first().getElementsByTag("img").first()
                        .attr("src"));
                post.setTitle(element.getElementsByClass("tease__text-card-wrapper").first()
                        .getElementsByClass("tease__title").first().text());
                post.setDescription(element.getElementsByClass("tease__text-card-wrapper").first()
                        .getElementsByClass("tease__dek").first().text());
                post.setAuthor(element.getElementsByClass("tease__credit").first()
                        .getElementsByClass("tease__credit--name").first().getElementsByTag("a").text());
                post.setDate("unknown!");
                post.setPost_content("");
                posts.add(post);
            }

            return posts;
        }
        return null;
    }

    public String crawlPostAt(String url) {
        String result="";
        Document document = connectToWebsite(url);
        if (document != null) {
            Element content = document.getElementById("content");
            Elements entryContent = content.getElementsByClass("entry-content");
            Element entryContentFirst = entryContent.first();
            Elements contentBlock = entryContentFirst.getElementsByClass("new_article_block");
            for (Element element : contentBlock) {
                if(element.hasClass("tags")) break;
                result+=element.html();
                System.out.println(result);
            }
        }
        return result;
    }

    public Document connectToWebsite(String url) {
        try {
            Document document = Jsoup.connect(url).get();
            if (!document.hasClass("page-404")) {
                return document;
            }
        } catch (IOException e) {
            System.err.println(e.getMessage());
            return null;
        }
        return null;
    }
}
