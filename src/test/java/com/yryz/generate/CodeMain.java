package com.yryz.generate;

import java.util.HashMap;
import java.util.Map;

import com.yryz.generate.service.DataService;
import com.yryz.generate.service.impl.DataServiceImpl;
import com.yryz.generate.util.SystemConstants;
/**
 * 
  * @ClassName: CodeMain
  * @Description: 注意：该程序读取的是application.properties文件的配置信息
  * @author zhongying
  * @date 2017年8月31日 下午6:01:54
  *
 */
public class CodeMain {

	public static void main(String[] args) {
		System.out.println("......生成代码start......");


		// 模板数据参数设值
		Map<String, Object> templateData = new HashMap<String, Object>();
		templateData.put("tableName", SystemConstants.tableName);
		templateData.put("entityName", SystemConstants.entityName);
		templateData.put("packageNamePre", SystemConstants.packageNamePre);
		templateData.put("outUrl", SystemConstants.outUrl);

		templateData.put("databaseName", SystemConstants.databaseName);
		templateData.put("ipName", SystemConstants.ipName);
		templateData.put("portName", SystemConstants.portName);
		templateData.put("userName", SystemConstants.userName);
		templateData.put("passWord", SystemConstants.passWord);

		DataService dataService = new DataServiceImpl();

		try {
			dataService.generate(templateData);
		} catch (Exception e) {
		}

		System.out.println("......生成代码end......");
	}

}
