package com.jiang.web.pre;

import com.jiang.dao.Impl.ProductCategoryImpl;
import com.jiang.dao.Impl.ProductDaoImpl;
import com.jiang.dao.ProductCategoryDao;
import com.jiang.dao.ProductDao;
import com.jiang.pojo.*;
import com.jiang.service.*;
import com.jiang.service.Impl.*;
import com.jiang.utils.TreeUtils;
import com.jiang.utils.webUtils;
import com.jiang.web.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.peer.LightweightPeer;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-16:20
 */
public class ClientServlet extends BaseServlet{
    NewsService newsService=new NewsServiceImpl();
    ProductCategoryService productCategoryService=new ProductCategoryServiceImpl();
    ProductService productService=new ProductServiceImpl();
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理新闻的显示
        List<News> listNews = newsService.findListNews();
        //得到所有的产品
        List<Product> productList = productService.findProductList();
        System.out.println(productList);
        req.getSession().setAttribute("newsList",listNews);
        //处理三级分类的显示
        List<TreeObject> type1 = productCategoryService.findTree(1);
        List<TreeObject> type2=productCategoryService.findTree(2);
        List<TreeObject> type3=productCategoryService.findTree(3);
        type3.addAll(type2);
        TreeUtils treeUtils=new TreeUtils(type1,type3);
        List<TreeObject> treeObjectList = treeUtils.getTreeObjectList();
        treeObjectList.forEach(System.out::println);
        req.getSession().setAttribute("treeCategory",treeObjectList);
        req.setAttribute("productList",productList);
        req.getRequestDispatcher("/client/index.jsp").forward(req,resp);
    }
//    /**
//     * 前台的界面显示新闻
//     * @param req
//     * @param resp
//     * @throws ServletException
//     * @throws IOException
//     */
//    protected void ListNews(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<News> listNews = newsService.findListNews();
//        req.getSession().setAttribute("newsList",listNews);
//        req.getRequestDispatcher("/client/index.jsp").forward(req,resp);
//    }
    /**
     *产品信息的回显
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void productDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("商品信息");
        req.getRequestDispatcher("/frontdesk/categoryList/categoryList.jsp").forward(req,resp);
    }
    /**
     * 找到分类下面的商品
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void pagecategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("请求过来了");
        //得到商品的三级id 通过这个id找商品
        int id = webUtils.parseInt(req.getParameter("id"), 1);
        int pageNum = webUtils.parseInt(req.getParameter("pageNum"), 1);
        int pageSize = webUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
//        System.out.println(id);
//        System.out.println(pageNum);
//        System.out.println(pageSize);
        Page<Product> products=productService.findProductPageByLevel3Id(pageNum,pageSize,id);
        System.out.println( "总页数是："+products.getPageTotal());
        System.out.println("总数量是："+products.getPageTotalCount());//总共的数量
        //得到分级下面的商品
        products.setUri("client/clientServlet?action=pagecategory");
        req.setAttribute("pages",products);
        req.setAttribute("id",id);
        req.getRequestDispatcher("/frontdesk/category/categoryList.jsp").forward(req,resp);
    }

    protected void pagecategoryLike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("请求过来了");
        //得到商品的三级id 通过这个id找商品
//        int id = webUtils.parseInt(req.getParameter("id"), 1);
        String likePro = req.getParameter("LikePro");
        int pageNum = webUtils.parseInt(req.getParameter("pageNum"), 1);
        int pageSize = webUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
//        System.out.println(id);
//        System.out.println(pageNum);
//        System.out.println(pageSize);
        Page<Product> products=productService.findProductPageByLike(pageNum,pageSize,likePro);
        System.out.println( "总页数是："+products.getPageTotal());
        System.out.println("总数量是："+products.getPageTotalCount());//总共的数量
        //得到分级下面的商品
        products.setUri("client/clientServlet?action=pagecategory");
        req.setAttribute("pages",products);
        req.setAttribute("likePro",likePro);
        req.getRequestDispatcher("/frontdesk/category/categoryList.jsp").forward(req,resp);
    }


    /**
     * 这里处理模糊搜索回显得数据
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
    
    /**
     * 查找商品的详情 转到商品详情
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void findProductDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("查看商品的详情请求过来了");
        int id = webUtils.parseInt(req.getParameter("id"), 0);//得到 商品的id
        //找到商品的详情
        Product productById = productService.findProductById(id);
        System.out.println(productById);
        req.setAttribute("productDetail",productById);
        req.getRequestDispatcher("/frontdesk/product/Product.jsp").forward(req,resp);
    }
}
