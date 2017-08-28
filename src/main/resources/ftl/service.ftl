package ${servicePackageName};

import java.math.BigDecimal;

import com.yryz.qstone.core.entity.PageEntity;
import com.yryz.qstone.core.exception.ServiceException;
import ${dtoPackageName}.In${entityName};
import ${enityPackageName}.${entityName};

/**
 * 
 * @ClassName: ${fileName?substring(0,fileName?index_of("."))}
 * @Description: ${fileName?substring(0,fileName?index_of("."))}
 * @author zhongying
 * @date ${currentTime}
 *
 */
public interface ${fileName?substring(0,fileName?index_of("."))} {

	/**
	 * ${entityName}列表
	 * 
	 * @return
	 */
	public PageEntity<${entityName}> list(In${entityName} in${entityName}) throws ServiceException;

	/**
	 * 删除${entityName}
	 * 
	 * @param id
	 * @return
	 */
	int delete(Long id) throws ServiceException;

	/**
	 * 新增${entityName}
	 * 
	 * @param record
	 * @return
	 */
	int insert(${entityName} record) throws ServiceException;

	/**
	 * 查询${entityName}信息
	 * 
	 * @param id
	 * @return
	 */
	${entityName} detail(Long id) throws ServiceException;

	/**
	 * 根据${entityName}编码查询${entityName}信息
	 * @param ${entityName?uncap_first}Code
	 * @return
	 */
	${entityName} selectBy${entityName}Code(Long ${entityName?uncap_first}Code);
	
	/**
	 * ${entityName}更新
	 * 
	 * @param record
	 * @return
	 */
	int update(${entityName} record) throws ServiceException;

	/**
	 * 使用ownerCode和${entityName?uncap_first}TypeCode查询${entityName}信息
	 * 
	 * @param ownerCode
	 *            持有主体编码
	 * @param ${entityName?uncap_first}TypeCode
	 *            账号类型编码
	 * @return Out${entityName}
	 */
	${entityName} detail(Long ownerCode, Integer ${entityName?uncap_first}TypeCode) throws ServiceException;

}
