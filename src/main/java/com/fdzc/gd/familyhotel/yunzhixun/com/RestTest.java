/**
 * @author Tony
 * @date 2018-01-10
 * @project rest_demo
 */
package com.fdzc.gd.familyhotel.yunzhixun.com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import com.fdzc.gd.familyhotel.yunzhixun.com.ucpaas.restDemo.client.AbsRestClient;
import com.fdzc.gd.familyhotel.yunzhixun.com.ucpaas.restDemo.client.JsonReqClient;
import org.apache.commons.lang3.StringUtils;


public class RestTest {

	static AbsRestClient InstantiationRestAPI() {
		return new JsonReqClient();
	}
	
	public static void testSendSms(String sid, String token, String appid, String templateid, String param, String mobile, String uid){
		try {
			String result=InstantiationRestAPI().sendSms(sid, token, appid, templateid, param, mobile, uid);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void testSendSmsBatch(String sid, String token, String appid, String templateid, String param, String mobile, String uid){
		try {
			String result=InstantiationRestAPI().sendSmsBatch(sid, token, appid, templateid, param, mobile, uid);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void testAddSmsTemplate(String sid, String token, String appid, String type, String template_name, String autograph, String content){
		try {
			String result=InstantiationRestAPI().addSmsTemplate(sid, token, appid, type, template_name, autograph, content);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	
	public static void testGetSmsTemplate(String sid, String token, String appid, String templateid, String page_num, String page_size){
		try {
			String result=InstantiationRestAPI().getSmsTemplate(sid, token, appid, templateid, page_num, page_size);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void testEditSmsTemplate(String sid, String token, String appid, String templateid, String type, String template_name, String autograph, String content){
		try {
			String result=InstantiationRestAPI().editSmsTemplate(sid, token, appid, templateid, type, template_name, autograph, content);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void testDeleterSmsTemplate(String sid, String token, String appid, String templateid){
		try {
			String result=InstantiationRestAPI().deleterSmsTemplate(sid, token, appid, templateid);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 测试说明  启动main方法后，请在控制台输入数字(数字对应 相应的调用方法)，回车键结束
	 * 参数名称含义，请参考rest api 文档
	 * @throws IOException
	 * @method main
	 */
	public static void main(String[] args) throws IOException{

		System.out.println("请输入方法对应的数字(例如1),Enter键结束:");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String methodNumber = br.readLine();

		if (StringUtils.isBlank(methodNumber)){
			System.out.println("请输入正确的数字，不可为空");
			return;
		}

		if (methodNumber.equals("1")) {  //指定模板单发
			String sid = "4ebea70d3e4d5660f32903ec9587f8df";
			String token = "408a86db6c4cf0bb6efad03c2c78feb2";
			String appid = "89452a2276d8443cbf4e5d08a690ee21";
			String templateid = "439177";
			String param = "金城是个大傻瓜！";
			String mobile = "15880123713";
			String uid = "";
			testSendSms(sid, token, appid, templateid, param, mobile, uid);
		} else if (methodNumber.equals("2")) { //指定模板群发
			String sid = "";
			String token = "";
			String appid = "";
			String templateid = "";
			String param = "";
			String mobile = "";
			String uid = "";
			testSendSmsBatch(sid, token, appid, templateid, param, mobile, uid);
		} else if (methodNumber.equals("3")) {  //增加模板
			String sid = "";
			String token = "";
			String appid = "";
			String type = "";
			String template_name = "";
			String autograph = "";
			String content = "";
			testAddSmsTemplate(sid, token, appid, type, template_name, autograph, content);
		} else if (methodNumber.equals("4")) {  //查询模板
			String sid = "";
			String token = "";
			String appid = "";
			String templateid = "";
			String page_num = "";
			String page_size = "";
			testGetSmsTemplate(sid, token, appid, templateid, page_num, page_size);
		} else if (methodNumber.equals("5")) {  //编辑模板
			String sid = "";
			String token = "";
			String appid = "";
			String templateid = "";
			String type = "";
			String template_name = "";
			String autograph = "";
			String content = "";
			testEditSmsTemplate(sid, token, appid, templateid, type, template_name, autograph, content);
		} else if (methodNumber.equals("6")) {  //删除模板
			String sid = "";
			String token = "";
			String appid = "";
			String templateid = "";
			testDeleterSmsTemplate(sid, token, appid, templateid);
		}
	}
}
