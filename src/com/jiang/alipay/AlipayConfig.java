package com.jiang.alipay;

import java.io.FileWriter;
import java.io.IOException;

/**
 * @author 22498 jiangBoss
 * @create 2021-06-19
 * @time 12:40
 */
public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    //2021000117675904
    public static String app_id = "2021000117675904";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQDDPUrVWV8i07/5h/N7gUewHtfcuPS0/4r9Bs8Eu3FWMu0ygUgRrtrw1Qbk0QIHf2mUR86dtWfqJM9FChWJWZ4XdrusdC236WWxyJZHo46oluJwrTLIR08YEQNaNT2zRqeQqBEvB4m6ulhzdtVdDzua/pDkhBz7MGpYCKkcewx0LfZmDnIwxCthmgcGAFHeAUwNOgCas+tRXjw2wV94LD93V8Ep3VKbPlQN7+/lK0IQYsIF4e1vBcjlQRUiMNmQYtMG2V4jiE1OiM4lJG+8T4ULGMH8m+8RAE2ddHEeqlA4JNt1bLezk876LIHwY8mpUmRRuaHSiIIWpqxgary8+dUlAgMBAAECggEBAI1kiBt2e+WXAILQKE8bUzWDQMVC1UV3g8q28Zn1vaC1hP58jhrwTPL48+MmUpfneCjA0Ct6wuTY/5p6MRqlYk6P2F6OTMXSK6nTILKFCr2heCAt7ocIzYkaWRktUZ/R3WxvqvIqPV6TsZb9Sov4iiw3i+tSmkJ3z6wtqXtMybogg0J03wklMOrVODUHivyEKndmLYqdIpopPA6VIJurTS/j5qTXcq702dyZYgC9PQD/lW6kRqTH27TQzqcWJBLAwMm5su9RCM6s1NJCNz7Hgwpu934C7/LVwCj0OWKQxwp3HIYoZ91McvQ97H0WtHXk8GyzZ5steBTJ/BO8JZw8bAECgYEA5vLjXmrD6gRmoi+jC8I6CXrhlrWxwg1z3FmPpqJ2sKoHwqpBs3BZzmCpQnHrxmT5oxGGpIBPVoxrAEg2bNLOR+oa5Buy5MzTryDUjihXS2zkm1Rekm/8BIlOodRrJ0eqxw+sXnE2SH0ZQBAFSejmxvjZ5gs6eniOXQkB61bfmqUCgYEA2GrOpCd/dkxvpc9BtiXhTobSHTDMXiZY//loe+9D9cNT/lJli9K/+C3eOp2i72W9xMptRYoa4x3hHrkB0ZxAwj646B+F98RreiI1qMPn0XFRCmCu8cd8oxjkZFv7CdqIvBKeBcETFDOFUjxZLuVAnRcXnIucgKnf6GWom8LMyIECgYEAmrY1qKd/LQLbumSNJjBr7rPZ8bswJJ4cco2w1OFa/4g4AKlLsChgkQdh+/gTCWnVbe8ssoCeJY2VlK/LfeVOeRCUCSGhGvM4D8a/faf6qrV9A61mWVUZj/Rnr7N8QOkat5WBVBclVTQwuSDCWjvidYJ5fkkhWK/wNtT06zHcQ10CgYEAx6iSB+PgthUCk+hH6XG9ESNUyVVx1hJu3YkNmfk9q4iO/vypbnv6W06FzXINFeu5TcqrURJ+h7XTMPLh+K29GPegw5YBlHoD5eOVuaMzRYjTiU11WN3/4MBgRS6OxaJ1r31FiG192o9Fmn7OkHM0Tzk0sVokApe2WMMg8MKhBwECgYEAu2cCiH+Cj9tsxhjv1Ra+dx3LSuXMhaqFKTdbr3tCMN5UbXLChhsSssEs0ILXydKM42xOd1WxL8pleF/FJqmHwZLBkuUHDffXoVbJdS/R29WqE18hz+8IlRtZsUUJ0btfH3KXaf0ECqjtsUKV085gahL65xxpUB6iW9iX5Czjg9I=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0hGDAD6fJlFMJwUDRUvbpd8dgX9RYKjNQPAY2yzGtGTmsMkDVAwKT2vXm9xKOIijASQQ2NtaAOlXXn0O9s294zuTWWiUI4p6uaCXpvT1XexifIlJXt++Sxo4PtIAMKRCHHw75fmy7Y67bZsqEMcBKHdoKMK9+JzZ/GUqrxJBJddu9JqkrJkIFwr3721bcKiLPKOEucZLlcJV0hCE2dkp51m8lxO/vyksW4yF1dgAvKEfYc7MeMtJbABF+SvunnNEdQU6wPxuOI0DQDWBDv8Fl46qnwZcccMDrqxeNKV7eqENN4sKRRPWLhFBkRwbd+/HB97anPeTHthSO5Hufbr0xwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/pay/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/yimaiwang/pay/return_url.jsp";
    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";
    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
