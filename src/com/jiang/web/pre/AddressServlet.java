package com.jiang.web.pre;

import com.google.gson.Gson;
import com.jiang.pojo.UserAddress;
import com.jiang.service.Impl.UserAddressServiceImpl;
import com.jiang.service.UserAddressService;
import com.jiang.utils.webUtils;
import com.jiang.web.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author:jiangboss
 * @create:2021--20 20:46
 */
public class AddressServlet extends BaseServlet {
    UserAddressService addressService=new UserAddressServiceImpl();
    /**
     * 修改地址的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("修改地址请求过来了");
        int id = webUtils.parseInt(req.getParameter("id"), 0);
        UserAddress userAddress=addressService.getAddressByid(id);
        Gson gson=new Gson();
        String s = gson.toJson(userAddress);
        resp.getWriter().write(s);
    }
    protected void updateAddressForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("表单改地址请求过来了");
        UserAddress userAddress = webUtils.copyParamToBean(req.getParameterMap(), new UserAddress());
        addressService.updateAddress(userAddress);
        List<UserAddress> addressList = addressService.getAddressList(userAddress.getUserId());
        req.getSession().setAttribute("addressList",addressList);
        resp.sendRedirect(req.getHeader("Referer"));
    }
}
