package com.jiang.dao.Impl;

import com.jiang.dao.NewsDao;
import com.jiang.pojo.News;

import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-25-21:58
 */
public class NewsDaoImpl extends BaseDao implements NewsDao {
    /**
     * 添加新闻
     * @param news
     * @return  返回的删除的数量
     */
    @Override
    public int addNews(News news) {
        String sql="Insert into easybuy_news(`id`,`title`,`content`,`createTime`) values(?,?,?,?)";
       return update(sql,news.getId(),news.getTitle(),news.getContent(),news.getCreateTime());
    }

    /**
     * 根据id删除新闻
     * @param id
     * @return 返回的是删除数据的个数
     */
    @Override
    public int deleteNews(Integer id) {
        String sql="delete from easybuy_news where id=?";
        return update(sql,id);
    }
    /**
     * 根据id查找新闻
     * @param id
     * @return
     */
    @Override
    public News queryForNews(Integer id) {
        String sql="select id,title,content,createTime from easybuy_news where id=?";
       return queryForOne(News.class, sql, id);
    }
    /**
     * 修改新闻
     * @param news
     * @return
     */
    @Override
    public int updateNews(News news) {
        String sql="update easybuy_news set `title`=?,`content`=? where id=?";
        return update(sql,news.getTitle(),news.getContent(),news.getId());
    }

    /**
     * 查找新闻的列表
     * @return
     */
    @Override
    public List<News> queryForNewsList() {
        String sql="select `id`,`title`,`content`,`createTime` from easybuy_news";
        List<News> news = qureyForList(News.class, sql);
        return news;
    }

    /**
     * 查找新闻的数量
     * @return
     */
    @Override
    public Integer queryForNewsCount() {
        String sql="select count(*) from easybuy_news";
        Number o = (Number)queryForSingleValue(sql);
        return o.intValue();
    }

    /**
     * 分页的查询
     * @param begin
     * @param pageSize
     * @return
     */
    @Override
    public List<News> queryForPage(int begin, Integer pageSize) {
        String sql="select `id`,`title`,`content`,`createTime` from easybuy_news limit ?,?";
       return qureyForList(News.class, sql, begin, pageSize);
    }
}
