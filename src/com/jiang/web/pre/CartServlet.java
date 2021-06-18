package com.jiang.web.pre;

import com.google.gson.Gson;
import com.jiang.pojo.Product;
import com.jiang.pojo.pre.Cart;
import com.jiang.pojo.pre.CartItem;
import com.jiang.service.Impl.ProductServiceImpl;
import com.jiang.service.ProductService;
import com.jiang.utils.webUtils;
import com.jiang.web.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * @author jiangboss
 * @create 2021-06-02-17:20
 *处理购物车 请求操作
 */
public class CartServlet extends BaseServlet {
    ProductService productService=new ProductServiceImpl();
    /**
     * 添加到购物车的操作 使用ajax操做便于修改右上角的购物车的信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addProductAjax(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("增加的请求过来");
        //处理增加操作
        int id = webUtils.parseInt(req.getParameter("id"), 0);//得到商品项的id 可找到商品信息
        Product productById = productService.findProductById(id);
        //将商品信息转换为商品项  还要判断购物车模型在不在session中 不在创建一个
        CartItem cartItem=new CartItem(productById.getFileName(),productById.getId(),productById.getName(),productById.getPrice(),productById.getPrice(),1);
        Cart cart=(Cart) req.getSession().getAttribute("cart");
        if (cart==null){
            cart=new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addProduct(cartItem);//添加商品项
        System.out.println(cart);

        //还需要商品的图片 购物车的数量 还要购物车的总金额
        req.getSession().setAttribute("name",productById.getName());
        req.getSession().setAttribute("fileName",productById.getFileName());
        req.getSession().setAttribute("cartTotal",cart.getCount());
        req.getSession().setAttribute("totalPrice",cart.getTotalPrice());
        Map<String,Object> resMap=new HashMap<>();
        //将购物车中需要的数据 使用json数据发送过去

        resMap.put("totalCount",cart.getCount());
//        resMap.put("fileName",productById.getFileName());
        resMap.put("totalPrice",cart.getTotalPrice());
        resMap.put("Species",cart.getSpecies());
//        resMap.put("name",productById.getName());
//        resMap.put("price",productById.getPrice());
        //？？？？？怎么传 jsp怎么接受 解析数据
        resMap.put("cartMaps",cart.getCartItemMap());
        Gson gson=new Gson();
        String s = gson.toJson(resMap);
        resp.getWriter().write(s);
    }
    /**
     * 删除商品项的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteCartItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    System.out.println("删除商品项的操作过来了！");
        Cart cart = (Cart)req.getSession().getAttribute("cart"); //获得session域中的cart对象
//        System.out.println(id);
//        System.out.println(cart);
        int id = webUtils.parseInt(req.getParameter("id"), 1);
        if (cart!=null){
            cart.deleteCart(id);
        }
        resp.sendRedirect(req.getHeader("Referer"));
    }

    /**
     * 修改商品的的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateCartItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("修改购物车商品项操作过来了");
        //得到商品的id和得到要将商品修改到什么数量
        int id = webUtils.parseInt(req.getParameter("id"), 0);
        int count = webUtils.parseInt(req.getParameter("count"), 0);
        Cart cart=(Cart) req.getSession().getAttribute("cart");
        if(cart!=null){
            //更改购物车的数量
            cart.updateCount(id,count);
        }
        resp.sendRedirect(req.getHeader("Referer"));
    }


    /***********************************************************************************************************************************************/

    protected void addProductAjax2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("增加多个产品的请求过来");
        System.out.println(req.getParameter("id"));
        System.out.println(req.getParameter("num"));
        //处理增加的操作
        int id = webUtils.parseInt(req.getParameter("id"), 0);//得到商品项的id 可找到商品信息
        int num = webUtils.parseInt(req.getParameter("num"), 0);

        Product productById = productService.findProductById(id);
        //将商品信息转换为商品项  还要判断购物车模型在不在session中 不在创建一个
        CartItem cartItem=new CartItem(productById.getFileName(),productById.getId(),productById.getName(),productById.getPrice(),productById.getPrice(),1);
        Cart cart=(Cart) req.getSession().getAttribute("cart");
        if (cart==null){
            cart=new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addProducts(cartItem,num);//添加商品项
        System.out.println(cart);

        //还需要商品的图片 购物车的数量 还要购物车的总金额
        req.getSession().setAttribute("name",productById.getName());
        req.getSession().setAttribute("fileName",productById.getFileName());
        req.getSession().setAttribute("cartTotal",cart.getCount());
        req.getSession().setAttribute("totalPrice",cart.getTotalPrice());
        Map<String,Object> resMap=new HashMap<>();
        //将购物车中需要的数据 使用json数据发送过去

        resMap.put("totalCount",cart.getCount());
//        resMap.put("fileName",productById.getFileName());
        resMap.put("totalPrice",cart.getTotalPrice());
        resMap.put("Species",cart.getSpecies());
//        resMap.put("name",productById.getName());
//        resMap.put("price",productById.getPrice());
        //？？？？？怎么传 jsp怎么接受 解析数据
        resMap.put("cartMaps",cart.getCartItemMap());
        Gson gson=new Gson();
        String s = gson.toJson(resMap);
        resp.getWriter().write(s);
    }
}
