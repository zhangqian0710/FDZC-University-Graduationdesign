package com.fdzc.gd.familyhotel.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092800616243";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCblUOnheExU+P4SkKI0ZRahjmo/Ja47wAuMhIoJECD2BgZ+byXo5PIT41fg81uPXd8DtTj36JUYRnRT0GGWDFPePFedJtHeGg+RSR8jfI0BCLUMxIY7he/IKYoh2YJXV6UecI9SBGPYgxTdxAMbGm2Kk9mPEUqY1zp5kSkSo4HWzh+RE8OmM+FcK4iyZN+yU9Ej/hgQmarNUBZ+a6RDuocqIILXf3pY0QGHs8esTuny6YeB5HtpYMbN0oHzrB50DKhjhnCxtoP7QuF3lSdwyk1U9vkd/cgEQev1300NHNalJr19X7hegFrISbFT+6LygUXjq6683aEPOUofwmhv20fAgMBAAECggEABpyMOHU/AZqgCHAXbbsCQ+qKTr0VJpy5dD0aemw39aJcO9ZaBlOkNxHyXwm51CJ2jmYO8/QP8OgDcdqdXTkoN0lbcHkiFCJww5yqlURu83jthfj5nueXSL75cKV4V5OJLmQSNgp2/JHdFjrsCqscvuoDX8PV6Jw6WZI4fobQjE1qFczVo6+oK/k692/2WcDqd7N8FR5shV7z03aq6mjMkZEN7j3eTwEtoj0vDK+22loLK1f/a//7TLrTCWJMSYj2fUCcwjvwjkn3Y/uPycz4QOUfUeTKVyA/MEDDsAHwkUal5RIIhrjsMrYycufINFm/laJHkX5PJR3w13Us4M1IIQKBgQDUJOrHkKHzaksY0rnplDXm2N3bqVhrpqHkCCya2lkmIzUW0U0mBgdCLneQENqs4EyZa4ZvNZSZRr0Xvr6TIyD57bsBxUkfK+5SqwTcvNki/mQlve2sJ+BXQdSUz3l6VAovwCu50cf7OzsBctLswn1fsjk/mtdk5agAit92tJUHjwKBgQC7vwWQouOpTsT60vaWux69ZBIY+3DFFEAnbT12J25v1UTE6hztIjBJOgaKt4vGwMup8EKPGBYgFwRIgtm6Q1upvtiEGnlWTtnkJ4QYP1bakIZZrTHAXDz6Scx++yW7ayykx05D18Qj0bxOldhdyXzRkx91Noy0jmVIISkmGBP5cQKBgGQGE/yMIQ/X6hiGIsoS62cwkUpkiiAXrPULNZy9npLwvrNHdAydgwadShpPGAuypesgW35L0QiD5dwwP0K4qW+tuyKWlmdwGyo3IE/Das2pDCcPaeRl2MzLaSPQvwICZdslzHgMhTHbN3LzZKfk+6AHNB7dLvmPnqrCz6H0et/ZAoGAZEhucolvTXozoT6aVHzyuHsBZ7K2064zblvdXoVFahritsPOW6PNYu/JmsLbuHg20TjydHiLKOzibtDl96YPCiZUhIuXkFBh9opc9o6ul+RmvvPSBUu/jnlo79K6ntdqa0HCPl67994J1XgYsE/1igQp43QVyEPfOZ3s2to1oSECgYEAy2u01lHhDfVJiaifA+Opj0mHQs7T5c/mNe24PUpCaD9senyDsTzixsmX2WB9k/5FbjLb+MSdjEx2Blq2P6jsIOeWtGRgzluXrQl8hbfsdz2X+lfdkAxi19bLRTT6U3CJFEYosM4VvZUa9nxHY8riBuBVyO4noLg2x5uGVfRK/Wo=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2MUIqzNDYG2vq590dXkjXhaxO0kBXqykj9QvPHA1+vVZ2cCtKCWgWYQPl77ou7IXftbdCysmfqUJ7agJ0nL3kjUazxP/eG2QiZj7bDnIiWwlHmP0PN+oF44mLLRCX6RG/k+NTmMT5fW3mf5VIh1fbGyElIQWzVWva5aNN/Reuh0OQo7ebJJ12lfWGRB8PyKI14m9l9ESROSB/qKcqyBSKETZIEQYmNfg+NsBAr0bCqByuH/jxco344QfZYn00nSPHiHJAtD8FwONq6RZSoZ9zUBKUYt6itn73hzhi6ERvKTM+CcO+oCsPaCpqrkMqYpepwZ/rw6jn/GcpxX5RontJwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://106.14.159.214:8080/familyhotel/";

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

