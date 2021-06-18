package com.jiang.dao;

import com.jiang.pojo.News;
import com.jiang.pojo.Page;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-25-21:52
 */
public interface NewsDao {
    public int addNews(News news);
    public int deleteNews(Integer id);
    public News queryForNews(Integer id);
    public int updateNews(News news);

    public List<News> queryForNewsList();
    public Integer queryForNewsCount();
    List<News> queryForPage(int begin, Integer pageSize);
}
