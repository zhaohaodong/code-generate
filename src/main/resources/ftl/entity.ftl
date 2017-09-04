package ${ entityPackageName };

import com.yryz.qshop.common.entity.GenericEntity;
import java.math.BigDecimal;
import java.util.Date;
/**
 * 
  * @ClassName: ${entityName}
  * @Description: ${tableDes}实体类
  * @author ${authorName}
  * @date ${currentTime}
  *
 */
public class ${entityName} extends GenericEntity{
	
	<#--属性遍历-->
	<#list columns as pro> 
	<#if pro.proName != 'id' && pro.proName != 'createUserId' && pro.proName != 'createDate' && pro.proName != 'lastUpdateUserId' && pro.proName != 'lastUpdateDate'>
	/**
	 * ${pro.proDes}
	 */	 
    private  ${pro.proType} ${pro.proName};
    
	</#if>
	</#list>

	<#--属性get||set方法-->
	<#list columns as pro>
	<#if pro.proName != 'id' && pro.proName != 'createUserId' && pro.proName != 'createDate' && pro.proName != 'lastUpdateUserId' && pro.proName != 'lastUpdateDate'>  
	public ${pro.proType} get${pro.proName?cap_first}() {
		return this.${pro.proName};
	}
	
	public void set${pro.proName?cap_first}(${pro.proType} ${pro.proName}) {
		this.${pro.proName} = ${pro.proName};
	}
		
	</#if>
	</#list>
}