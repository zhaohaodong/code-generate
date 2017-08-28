package com.yryz.generate.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.yryz.generate.service.DataService;
import com.yryz.generate.service.DbService;
import com.yryz.generate.util.freeMaker.FreeMakerUtil;

public class DataServiceImpl implements DataService {

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
	public void generateFile(String templateName,Map<String,Object> dbData,Map<String,Object> templateData,String packageName,
			String fileName) { 
		
		// 默认生成文件的路径
		FreeMakerUtil freeMakerUtil = new FreeMakerUtil();
		fileName=String.format(fileName, templateData.get("entityName").toString());
		templateData.put("fileName",fileName);
		
		Map<String, Object> map = getDbTemplateData(templateName,dbData,templateData, fileName);
		
		try {
			freeMakerUtil.generateFile(templateName, map ,packageName, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 根据表名获取模板要用的Map型数据 (带有列信息)
	 * 
	 * @param tableName
	 * @return
	 */
	public Map<String, Object> getDbTemplateData(String templateName,Map<String,Object> dbData, Map<String, Object> templateData, String fileName) {
		DbService dbService = new DbServiceImpl();
		
		// 通用参数
		SimpleDateFormat myFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		templateData.put("currentTime", myFmt.format(new Date()));

		switch (templateName) {
		case "entity.ftl":
			// 数据库参数
			dbService.getAllColums(dbData,templateData);
			break;
		case "mapper.ftl":
			dbService.getAllColums(dbData,templateData);
			break;
		default:
			break;
		}

		return templateData;
	}

}
