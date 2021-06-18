package com.jiang.web;

import com.jiang.dao.ProductCategoryDao;
import com.jiang.pojo.*;
import com.jiang.service.Impl.ProductCategoryServiceImpl;
import com.jiang.service.Impl.ProductServiceImpl;
import com.jiang.service.ProductCategoryService;
import com.jiang.service.ProductService;
import com.jiang.utils.webUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author jiangboss
 * @create 2021-05-27-9:55
 */
public class ProductServlet extends BaseServlet{
    ProductService productService=new ProductServiceImpl();
    ProductCategoryService productCategoryService=new ProductCategoryServiceImpl();

    /**
     * 查找所有商品的列表
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     *
     */
    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("请求过来了");
//        List<Product> productList = productService.findProductList();
//        req.setAttribute("products" ,productList);
//        req.getRequestDispatcher("/backend/product/productList.jsp").forward(req,resp);
    }

    /**
     * 分页的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int pageNum = webUtils.parseInt(req.getParameter("pageNum"), 1);
        int pageSize = webUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        Page<Product> productPage = productService.findProductPage(pageNum, pageSize);
        req.setAttribute("pages",productPage);
        productPage.setUri("manager/productServlet?action=page");
        req.getRequestDispatcher("/backend/product/productList.jsp").forward(req,resp);
    }

    /**
     * 删除商品
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = webUtils.parseInt(req.getParameter("id"), 1);
        productService.deleteProductById(id);
        //重定向
        resp.sendRedirect(req.getContextPath()+"/manager/productServlet?action=page&pageNum="+req.getParameter("pageNum"));
    }
    /**
     * 增加商品的信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addproduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("请求过来了！");
        Product product = webUtils.copyParamToBean(req.getParameterMap(), new Product());
        productService.addProduct(product);
        System.out.println("添加成功！");
        resp.sendRedirect(req.getContextPath()+"/manager/productServlet?action=page");
    }

    /**
     * 修改商品信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateproduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Product product = webUtils.copyParamToBean(req.getParameterMap(), new Product());
        productService.updateProduct(product);
        System.out.println("修改成功!");
        resp.sendRedirect(req.getContextPath()+"/manager/productServlet?action=page&pageNum="+req.getParameter("pageNum"));
    }
    /**
     * 查找产品回显
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void findProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productid = webUtils.parseInt(req.getParameter("productid"), 1);
        Product productById = productService.findProductById(productid);
        //将需要修改的商品的 信息回显到界面
        req.setAttribute("product",productById);

        //根据商品的id查出所对应的三个目录
        ThreeCategory threeCategory = productCategoryService.findThreeCategory(productid);
        req.setAttribute("threecate",threeCategory);

        //将一级分类传进修改页面
        List<ProduceCategory> categoryByType = productCategoryService.getCategoryByType(1);
        req.setAttribute("cate1",categoryByType);

        req.getRequestDispatcher("/backend/product/toAddProduct.jsp").forward(req,resp);
    }
}
