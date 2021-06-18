package com.jiang.service.Impl;

import com.jiang.dao.Impl.NewsDaoImpl;
import com.jiang.dao.NewsDao;
import com.jiang.pojo.News;
import com.jiang.pojo.Page;
import com.jiang.service.NewsService;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-25-23:32
 */
public class NewsServiceImpl implements NewsService {
    NewsDao newsDao=new NewsDaoImpl();
    @Override
    public void addNews(News news) {
        newsDao.addNews(news);
    }
    @Override
    public void deleteNews(Integer id) {
        newsDao.deleteNews(id);
    }

    @Override
    public News findNews(Integer id) {
        return newsDao.queryForNews(id);
    }

    @Override
    public List<News> findListNews() {
        return  newsDao.queryForNewsList();
    }

    @Override
    public Integer findNewsCount() {
       return newsDao.queryForNewsCount();

    }

    /**
     * 新闻的分页
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    public Page<News> findPage(Integer pageNum,Integer pageSize) {
        Page<News> page = new Page<>();
        //设置每页最大显示数
        page.setPageSize(pageSize);
        //设置总的记录数
        Integer pageTotalCount = newsDao.queryForNewsCount();
        page.setPageTotalCount(pageTotalCount);
        //求总页码
        Integer pageTotal=pageTotalCount/Page.PAGE_SIZE;
        if (pageTotalCount % Page.PAGE_SIZE > 0) {
            pageTotal += 1;
        }
        //设置总页码
        page.setPageTotal(pageTotal);
        //给当前的页码赋值
        page.setPageNum(pageNum);
        //求出当前页面的索引
        int begin = (page.getPageNum() - 1) * pageSize;
        List<News> newsList =newsDao.queryForPage(begin, pageSize);
        //当前页面数据
        page.setItems(newsList);
        //返回数据
        return page;
    }
}
