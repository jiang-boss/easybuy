package com.jiang.web;

import com.jiang.pojo.News;
import com.jiang.pojo.Page;
import com.jiang.service.Impl.NewsServiceImpl;
import com.jiang.service.NewsService;
import com.jiang.utils.webUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * @author jiangboss
 * @create 2021-05-25-23:43
 */
public class newsServlet extends BaseServlet {
    NewsService newsService=new NewsServiceImpl();
    /**
     * 分页操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNum = webUtils.parseInt(req.getParameter("pageNum"), 1);
        int pageSize = webUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        Page<News> page = newsService.findPage(pageNum, pageSize);
        page.setUri("manager/newsservlet?action=page");
        req.setAttribute("pages",page);
        req.getRequestDispatcher("/backend/news/newsList.jsp").forward(req,resp);
    }
    /**
     * 得到所有的新闻
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void getListNews(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<News> listNews = newsService.findListNews();
        req.setAttribute("news",listNews);
        req.getRequestDispatcher("/backend/news/newsList.jsp").forward(req,resp);
    }
    /**
     * 查找一条新闻
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void getOneNews(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = webUtils.parseInt(req.getParameter("id"), 0);
        News news = newsService.findNews(id);
        req.setAttribute("newsOne",news);
        req.getRequestDispatcher("/backend/news/newsDetail.jsp").forward(req,resp);
    }
}
