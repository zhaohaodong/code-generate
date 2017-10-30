package com.yryz.generate.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.yryz.generate.service.DataService;
import com.yryz.generate.service.DbService;
import com.yryz.generate.util.freeMaker.FreeMakerUtil;

public class DataServiceImpl implements DataService {

	public void generate(Map<String, Object> templateData) {
		//======================包名配置======================
		{
			String packageNamePre=templateData.get("packageNamePre").toString();
			
			templateData.put("entityPackageName", String.format(packageNamePre + ".entity",
					templateData.get("entityName").toString().toLowerCase()));
			templateData.put("dtoPackageName", String.format(packageNamePre + ".dto",
					templateData.get("entityName").toString().toLowerCase()));
			templateData.put("daoPackageName", String.format(packageNamePre + ".dao",
					templateData.get("entityName").toString().toLowerCase()));
			templateData.put("mapperPackageName", packageNamePre + ".mapper");
			templateData.put("servicePackageName", String.format(packageNamePre + ".api",
					templateData.get("entityName").toString().toLowerCase()));
			templateData.put("serviceImplPackageName", String.format(packageNamePre  + ".service",
					templateData.get("entityName").toString().toLowerCase()));
//			templateData.put("openControllerPackageName", String.format(packageNamePre  + ".controller",
//					templateData.get("entityName").toString().toLowerCase()));
			templateData.put("controllerPackageName", String.format(packageNamePre  + ".controller",
			templateData.get("entityName").toString().toLowerCase()));
			SimpleDateFormat myFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			templateData.put("currentTime", myFmt.format(new Date()));
		}
		
		//======================生成文件配置======================
		try {
			// 生成Entity  
			String entityName=String.format("%s", templateData.get("entityName").toString());
			this.generateFile("entity.ftl", templateData, templateData.get("entityPackageName").toString(), entityName+".java");

			// 生成DTO
			String dtoName = String.format("%sDto", templateData.get("entityName").toString());
			templateData.put("dtoName", dtoName);
			this.generateFile("dto.ftl", templateData, templateData.get("dtoPackageName").toString(),
					dtoName + ".java");

			// 生成DAO
			String daoName = String.format("%sDao", templateData.get("entityName").toString());
			templateData.put("daoName", daoName);
			this.generateFile("dao.ftl", templateData, templateData.get("daoPackageName").toString(),
					daoName + ".java");

			// 生成Mapper
			String mapperName = String.format("%sMapper", templateData.get("entityName").toString());
			this.generateFile("mapper.ftl", templateData, templateData.get("mapperPackageName").toString(),
					mapperName+".xml");

			// 生成Service
			String serviceName = String.format("%sApi", templateData.get("entityName").toString());
			templateData.put("serviceName", serviceName);
			this.generateFile("service.ftl", templateData, templateData.get("servicePackageName").toString(),
					serviceName + ".java");

			// 生成Service实现类
			String serviceImplName = String.format("%sProvider", templateData.get("entityName").toString());
			templateData.put("serviceImplName", serviceImplName);
			this.generateFile("serviceImpl.ftl", templateData, templateData.get("serviceImplPackageName").toString(),
					serviceImplName + ".java");

			// 生成OpenService  
//			String openServiceName = String.format("Open%sApi", templateData.get("entityName").toString());
//			templateData.put("openServiceName", openServiceName);
//			this.generateFile("openService.ftl", templateData, templateData.get("servicePackageName").toString(),
//					openServiceName + ".java");

			// 生成OpenServiceImpl实现类 
//			String openServiceImplName = String.format("Open%sService", templateData.get("entityName").toString());
//			templateData.put("openServiceImplName", openServiceImplName);
//			this.generateFile("openServiceImpl.ftl", templateData, templateData.get("serviceImplPackageName").toString(),
//					openServiceImplName + ".java");
//			
			
			// 生成Controller实现类  
//			String openControllerName = String.format("Open%sController", templateData.get("entityName").toString());
//			templateData.put("openControllerName", openControllerName);
//			this.generateFile("openController.ftl", templateData, templateData.get("openControllerPackageName").toString(),
//					openControllerName + ".java");

			// 生成Controller实现类  
			/*String controllerName = String.format("%sController", templateData.get("entityName").toString());
			templateData.put("controllerName", controllerName);
			this.generateFile("controller.ftl", templateData, templateData.get("controllerPackageName").toString(),
					controllerName + ".java");*/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成文件
	 * 
	 * @param templateName
	 *            模板名称
	 * @param packageName
	 *            包名
	 * @param templateData
	 *            参数名
	 * @param fileName
	 *            文件名
	 */
	public void generateFile(String templateName, Map<String, Object> templateData, String packageName,
			String fileName) {
		templateData.put("fileName", fileName);
		
		DbService dbService = new DbServiceImpl();
		switch (templateName) {
		case "entity.ftl":
			// 数据库参数
			dbService.getAllColums(templateData);
			break;
		case "mapper.ftl":
			dbService.getAllColums(templateData);
			break;
		default:
			break;
		}
		
		try {
			// 默认生成文件的路径
			FreeMakerUtil freeMakerUtil = new FreeMakerUtil();
			freeMakerUtil.generateFile(templateName, templateData, packageName, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
