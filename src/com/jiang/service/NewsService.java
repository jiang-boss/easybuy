package com.jiang.service;

import com.jiang.pojo.News;
import com.jiang.pojo.Page;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-25-23:32
 */
public interface NewsService {
    public void addNews(News news);
    public void deleteNews(Integer id);
    public News findNews(Integer id);
    public List<News> findListNews();
    public Integer findNewsCount();
    Page<News> findPage(Integer pageNum,Integer pageSize);
}
