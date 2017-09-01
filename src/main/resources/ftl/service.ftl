package ${servicePackageName};

import java.math.BigDecimal;

import com.yryz.qstone.core.entity.PageEntity;
import com.yryz.qstone.core.exception.ServiceException;
import ${dtoPackageName}.${entityName}Dto;
import ${entityPackageName}.${entityName};

/**
 * 
 * @ClassName: ${serviceName}
 * @Description: ${serviceName}
 * @author zhongying
 * @date ${currentTime}
 *
 */
public interface ${serviceName} {

	/**
	 * ${entityName}列表
	 * 
	 * @return
	 */
	public PageEntity<${entityName}> list(${dtoName} ${dtoName?uncap_first}) throws ServiceException;

	/**
	 * 删除${entityName}
	 * 
	 * @param id
	 * @return
	 */
	Integer delete(Long id) throws ServiceException;

	/**
	 * 新增${entityName}
	 * 
	 * @param record
	 * @return
	 */
	Integer insert(${entityName} record) throws ServiceException;

	/**
	 * 查询${entityName}信息
	 * 
	 * @param id
	 * @return
	 */
	${entityName} detail(Long id) throws ServiceException;

	/**
	 * ${entityName}更新
	 * 
	 * @param record
	 * @return
	 */
	Integer update(${entityName} record) throws ServiceException;

}
