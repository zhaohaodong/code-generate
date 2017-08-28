package com.yryz.generate.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.yryz.generate.service.DataService;
import com.yryz.generate.service.impl.DataServiceImpl;

/**
 * Servlet implementation class GeneratesServlet
 */
@WebServlet("/GeneratesServlet")
public class GeneratesServlet extends HttpServlet {
       
	private static final long serialVersionUID = 1L;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneratesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * 生成代码方法
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> mapResult = new HashMap<String, Object>();
		
		//模板数据参数设值
		Map<String,Object> templateData=new HashMap<String,Object>();
		templateData.put("tableName", request.getParameter("tableName"));
		templateData.put("entityName", request.getParameter("entityName"));
		templateData.put("packageNamePre", request.getParameter("packageNamePre"));
		templateData.put("outUrl", request.getParameter("outUrl"));
		
		//数据库参数设值
		Map<String,Object> dbData=new HashMap<String,Object>();
		dbData.put("databaseName", request.getParameter("databaseName"));
		dbData.put("ipName", request.getParameter("ipName"));
		dbData.put("portName", request.getParameter("portName"));
		dbData.put("userName", request.getParameter("userName"));
		dbData.put("passWord", request.getParameter("passWord"));
		dbData.put("tableName", request.getParameter("tableName"));
		
		//包名
		templateData.put("enityPackageName", String.format(templateData.get("packageNamePre").toString()+".%s.entity", templateData.get("entityName").toString().toLowerCase()));
		templateData.put("dtoPackageName", String.format(templateData.get("packageNamePre").toString()+".%s.dto", templateData.get("entityName").toString().toLowerCase()));
		templateData.put("daoPackageName", String.format(templateData.get("packageNamePre").toString()+".%s.dao", templateData.get("entityName").toString().toLowerCase()));
		templateData.put("mapperPackageName", templateData.get("packageNamePre").toString()+".%s.mapper");	
		templateData.put("servicePackageName", String.format(templateData.get("packageNamePre").toString()+".%s.service", templateData.get("entityName").toString().toLowerCase()));
		templateData.put("serviceImplPackageName", String.format(templateData.get("packageNamePre").toString()+".%s.service.impl", templateData.get("entityName").toString().toLowerCase()));
		templateData.put("controllerPackageName", String.format(templateData.get("packageNamePre").toString()+".%s.controller", templateData.get("entityName").toString().toLowerCase()));
		
		
		try {
			
			DataService dataService = new DataServiceImpl();
			// 生成Entity
			dataService.generateFile("entity.ftl", dbData,templateData,templateData.get("enityPackageName").toString(), "%s.java");

			//生成DTO
			String dtoName=String.format("%sDto", templateData.get("entityName").toString());
			templateData.put("dtoName", dtoName);
			dataService.generateFile("dto.ftl", dbData, templateData,templateData.get("dtoPackageName").toString(), dtoName+".java");
			
			//生成DAO
			String daoName=String.format("%sDao", templateData.get("entityName").toString());
			templateData.put("daoName", daoName);
			dataService.generateFile("dao.ftl", dbData, templateData,templateData.get("daoPackageName").toString(), daoName+".java");
			
			// 生成Mapper
			dataService.generateFile("mapper.ftl", dbData, templateData,templateData.get("mapperPackageName").toString(), "%sMapper.xml");

			//生成Service
			String serviceName=String.format("%sService", templateData.get("entityName").toString());
			templateData.put("serviceName", serviceName);
			dataService.generateFile("service.ftl", dbData, templateData,templateData.get("servicePackageName").toString(), serviceName+".java");
			
			//生成Service实现类
			String serviceImplName=String.format("%sServiceImpl", templateData.get("entityName").toString());
			templateData.put("serviceImplName", serviceImplName);
			dataService.generateFile("serviceImpl.ftl", dbData, templateData,templateData.get("serviceImplPackageName").toString(), serviceImplName+".java");
			
			//生成Controller实现类
			String controllerImplName=String.format("%sController", templateData.get("entityName").toString());
			templateData.put("controllerImplName", controllerImplName);
			dataService.generateFile("controller.ftl", dbData, templateData,templateData.get("controllerPackageName").toString(), controllerImplName+".java");
			
			mapResult.put("code", "200");
		} catch (Exception e) {
			e.printStackTrace();
			mapResult.put("message", "生成失败！");
		}

		String userJson = JSON.toJSONString(mapResult);
		OutputStream out = response.getOutputStream();
		out.write(userJson.getBytes("UTF-8"));
		out.flush();

	}
	
	
	
}
