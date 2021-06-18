package com.jiang.web;

import com.google.gson.Gson;
import com.jiang.pojo.*;
import com.jiang.service.Impl.ProductCategoryServiceImpl;
import com.jiang.service.ProductCategoryService;
import com.jiang.utils.webUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Keymap;
import java.io.IOException;
import java.util.*;

/**
 * @author jiangboss
 * @create 2021-05-26-21:41
 */

public class CategoryServlet extends BaseServlet{

    ProductCategoryService productCategoryService=new ProductCategoryServiceImpl();

    /**
     * 全部分类列表  后面不用
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProduceCategory> categoryList = productCategoryService.getCategoryList();
        req.setAttribute("category",categoryList);
        req.getRequestDispatcher("/backend/productCategory/productCategoryList.jsp").forward(req,resp);
    }

    /**
     * 分类列表的分页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNum = webUtils.parseInt(req.getParameter("pageNum"), 1);
        int pageSize = webUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        Page<ProduceCategory> pageCategoryList = productCategoryService.getPageCategoryList(pageNum, pageSize);

        List<CategoryTypeParent> parentType = productCategoryService.findParentType();
        //同一路径
        pageCategoryList.setUri("manager/categoryServlet?action=page");
        req.setAttribute("pages",pageCategoryList);

        req.setAttribute("parentType",parentType);
        req.getRequestDispatcher("/backend/productCategory/productCategoryList.jsp").forward(req,resp);
    }

    /**
     * 删除商品分类的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deletecategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = webUtils.parseInt(req.getParameter("id"), 1);
        System.out.println("请求过来了"+id);
        productCategoryService.deleteCategoryById(id);
        resp.sendRedirect(req.getContextPath()+"/manager/categoryServlet?action=page&pageNum="+req.getParameter("pageNum"));
    }

    /**
     * 处理三级的回显
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void getThreeCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    /**
     * 得到一级分类
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void findCategory1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("请求过来了");
        //找到所有的一级目录
        List<ProduceCategory> categoryByType = productCategoryService.getCategoryByType(1);
        req.setAttribute("cate1",categoryByType);
        req.getRequestDispatcher("/backend/product/toAddProduct.jsp").forward(req,resp);
    }
    /**
     * 查询二级分类
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxCategory2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ajax请求过来了");
        //这里获得被选择的分类的一级菜单的名称
        int categoryid = webUtils.parseInt(req.getParameter("categoryid"), 1);
        //根据得到的参数的一级分类查找二级分类
        List<ProduceCategory> categoryByid = productCategoryService.getCategoryByName( categoryid,2);
        System.out.println(categoryid);
        Map<String,Object> cate2Map=new HashMap<>();
        cate2Map.put("cate2",categoryByid);
        Gson gson=new Gson();
        String s = gson.toJson(cate2Map);
        resp.getWriter().write(s);
    }

    /**
     * 查询三级分类
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxCategory3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ajax请求过来了三级目录");
        //这里获得被选择的分类的一级菜单的名称
        int categoryid = webUtils.parseInt(req.getParameter("categoryid"), 1);
//        //根据得到的参数的二级分类查找三级分类
        List<ProduceCategory> categoryByid = productCategoryService.getCategoryByName( categoryid,3);
        System.out.println(categoryByid);
        Map<String,Object> cate2Map=new HashMap<>();
        cate2Map.put("cate3",categoryByid);
        Gson gson=new Gson();
        String s = gson.toJson(cate2Map);
        resp.getWriter().write(s);
    }

//    /**
//     * 添加分类的操作
//     * @param req
//     * @param resp
//     * @throws ServletException
//     * @throws IOException
//     */
//    protected void addCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("添加分类的请求！");
//
//    }


    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /**
     *查找要修改的分类
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxType2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("修改分类的请求进来了");
        //得到该分类id值
        int id = webUtils.parseInt(req.getParameter("id"), 1);
//        System.out.println(id);
        //先得到所有的一级分类 传给页面
        List<ProduceCategory> categoryByType = productCategoryService.getCategoryByType(1);
        req.setAttribute("category1",categoryByType);
        Map<String,Object> resMap=new HashMap<>();
        resMap.put("allOneCategory",categoryByType);//所有的一级目录发送给界面
        Gson gson=new Gson();
        String s = gson.toJson(resMap);
        resp.getWriter().write(s);
    }

    /**
     * 处理点击要修改的 三级分类 这里要将顶级父类的信息传回界面
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxType3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("三级分类的修改请求过来了");
        System.out.println(req.getParameter("id"));//这里的id是二级分类的id
        int id = webUtils.parseInt(req.getParameter("id"), 1);
        ProduceCategory produceCategory=productCategoryService.findParentTypeBy2id(id);
        Map<String,Object> resMap=new HashMap<>();
        resMap.put("category1",produceCategory);
        Gson gson=new Gson();
        String s = gson.toJson(resMap);
        resp.getWriter().write(s);
    }

    /**
     * 修改分类的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("处理修改分类的操作请求过来了");
    }

    /**
     *这里处理增加分类的操作 jsp中使用ajax 比较复杂 传入参数时使用attr设置属性值  一级的时候添加一个隐藏域让 parentId=0
     * 表单提交时候判断parentId的时候 在ajax中用type和append进行操作给两种情况不同的标签附上parentId属性
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addCategory(HttpServletRequest request,HttpServletResponse response) throws  ServletException,IOException{
        System.out.println("增加的请求过来了");
//        System.out.println(request.getParameter("type"));
//        System.out.println(request.getParameter("parentId"));
//        System.out.println(request.getParameter("name"));
//        String iconClass = request.getParameter("iconClass");
//        System.out.println("iconClass"+iconClass+"iconClass");
        //将网页上的数据封装成一个对象
        ProduceCategory produceCategory = webUtils.copyParamToBean(request.getParameterMap(), new ProduceCategory());
        //添加分类
        productCategoryService.addProductCategory(produceCategory);
        System.out.println("添加成功！");
        //重定向给page页面防止二次提交
        response.sendRedirect(request.getContextPath()+"/manager/categoryServlet?action=page");
    }
}
