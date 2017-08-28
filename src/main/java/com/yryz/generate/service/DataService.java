package com.yryz.generate.service;

import java.util.Map;

public interface DataService {

	
	/**
	 * 根据表名获取Vo模板要用的Map型数据
	 * 
	 * @param tableName
	 * @return
	 */
	public Map<String, Object> getDbTemplateData(String templateName, Map<String, Object> dbData, Map<String, Object> paramMap,
			String fileName);

	public void generateFile(String templateName, Map<String, Object> dbData, Map<String, Object> templateData,
			String packageName, String fileName);
}
