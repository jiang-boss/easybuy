package com.jiang.web.pre;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.jiang.alipay.AlipayConfig;
import com.jiang.web.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 22498 jiangBoss
 * @create 2021-06-19
 * @time 13:46
 */
public class PayServlet extends BaseServlet {

    protected void doPay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理付款的业务
        System.out.println("支付宝请求过来了");
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new String(req.getParameter("orderNum").getBytes("ISO-8859-1"),"UTF-8");
        //付款金额，必填
        String total_amount = new String(req.getParameter("allPrice").getBytes("ISO-8859-1"),"UTF-8");
        //订单名称，必填
        String subject = new String(req.getParameter("orderName").getBytes("ISO-8859-1"),"UTF-8");
        //商品描述，可空
        String body = new String(req.getParameter("orderBody").getBytes("ISO-8859-1"),"UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
        //		+ "\"total_amount\":\""+ total_amount +"\","
        //		+ "\"subject\":\""+ subject +"\","
        //		+ "\"body\":\""+ body +"\","
        //		+ "\"timeout_express\":\"10m\","
        //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

        //请求
        AlipayTradePagePayResponse alipayTradePagePayResponse=null;
        try {
            alipayTradePagePayResponse = alipayClient.pageExecute(alipayRequest);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
//        String result = alipayClient.pageExecute(alipayRequest).getBody();
        //输出
        resp.getWriter().write(alipayTradePagePayResponse.getBody());
    }
}
