package com.jiang.test;

import com.jiang.dao.Impl.NewsDaoImpl;
import com.jiang.dao.NewsDao;
import com.jiang.pojo.News;
import org.junit.Test;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-25-22:05
 */
public class NewsDaoTest {
    NewsDao newsDao=new NewsDaoImpl();
    @Test
    public void addNews() {
        newsDao.addNews(new News(null,"dsad","dsnmds","1999,2,26"));
    }

    @Test
    public void deleteNews() {
        int i = newsDao.deleteNews(704);
        System.out.println(i);
    }
    @Test
    public void queryForNews() {
        News news = newsDao.queryForNews(693);
        System.out.println(news);
    }

    @Test
    public void updateNews() {
        System.out.println(newsDao.updateNews(new News(703, "就爱那个春雨", "hahh", null)));
    }

    @Test
    public void queryForNewsList() {
        List<News> news = newsDao.queryForNewsList();
        System.out.println(news);
    }

    @Test
    public void queryForNewsCount() {
        Integer integer = newsDao.queryForNewsCount();
        System.out.println(integer);
    }
}