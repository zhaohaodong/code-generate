package ${serviceImplPackageName};
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import ${servicePackageName}.${serviceName};
import com.yryz.qshop.core.constant.CommonConstant;
import com.yryz.qshop.common.entity.PageList;
import com.yryz.qshop.common.exception.ServiceException;
import ${dtoPackageName}.${dtoName};
import ${entityPackageName}.${entityName};
import ${daoPackageName}.${daoName};

/**
 * 
 * @ClassName: ${serviceImplName}
 * @Description: ${serviceImplName}业务实现类
 * @author ${authorName}
 * @date ${currentTime}
 *
 */
@Service
public class ${serviceImplName} implements ${serviceName} {
	private static final Logger logger = LoggerFactory.getLogger(${entityName}Provider.class);

	@Autowired
	private ${daoName} ${daoName?uncap_first};

	@Override
	public PageList<${entityName}> list(${dtoName} ${dtoName?uncap_first}) throws ServiceException {
		PageHelper.startPage(${dtoName?uncap_first}.getPageNo(), ${dtoName?uncap_first}.getPageSize());
		List<${entityName}> ${entityName?uncap_first} = null;
		try {
			${entityName?uncap_first} = ${daoName?uncap_first}.selectList(${dtoName?uncap_first});
		} catch (Exception e) {
			logger.error("查询${entityName}列表信息失败！,${dtoName?uncap_first}:", e);
			throw ServiceException.busiError("查询${entityName}列表信息失败！");
		}
		PageList<${entityName}> pageEntity = new PageList<${entityName}>(${entityName?uncap_first});
		return pageEntity;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public Integer delete(Long ${businessId}) throws ServiceException {
		if(${businessId}==null){
			logger.error("${entityName}ID不能为空！,${businessId}:"+${businessId});
			throw ServiceException.paramsError("${entityName}ID不能为空！",String.valueOf(${businessId}));
		}
		
		${entityName} ${entityName?uncap_first}=null;
		try {
			${entityName?uncap_first}=${daoName?uncap_first}.selectByPrimaryKey(${businessId});
		} catch (Exception e) {
			logger.error("查询${entityName}详情失败！,${businessId}:"+${businessId} + e);
			throw ServiceException.busiError("查询${entityName}详情失败！",String.valueOf(${businessId}));
		}
		
		if(${entityName?uncap_first}==null){
			logger.error("${entityName}不存在！");
			throw ServiceException.paramsError("${entityName}不存在", String.valueOf(${businessId}));
		}
		try {
			${entityName?uncap_first}.setDelFlag(CommonConstant.del.deleted.intValue());
			return ${daoName?uncap_first}.updateByPrimaryKeySelective(${entityName?uncap_first});
		} catch (Exception e) {
			logger.error("删除${entityName}失败！,${businessId}:" + ${businessId}, e);
			throw ServiceException.busiError("删除${entityName}失败！",String.valueOf(${businessId}));
		}
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public Integer insert(${entityName} ${entityName?uncap_first}) throws ServiceException {
		try {
			return ${daoName?uncap_first}.insertByPrimaryKeySelective(${entityName?uncap_first});
		} catch (Exception e) {
			logger.error("新增${entityName}失败！,${entityName?uncap_first}:" + e);
			throw ServiceException.busiError("新增${entityName}失败！");
		}
	}

	
	@Override
	public ${entityName} detail(Long ${businessId}) throws ServiceException {
		if(${businessId}==null){
			logger.error("${entityName}ID不能为空！,${businessId}:"+${businessId});
			throw ServiceException.paramsError("${entityName}ID不能为空！",String.valueOf(${businessId}));
		}
		
		${entityName} ${entityName?uncap_first}=null;
		try {
			${entityName?uncap_first}=${daoName?uncap_first}.selectByPrimaryKey(${businessId});
		} catch (Exception e) {
			logger.error("查询${entityName}详情失败！,${businessId}:"+${businessId} + e);
			throw ServiceException.busiError("查询${entityName}详情失败！",String.valueOf(${businessId}));
		}
		return ${entityName?uncap_first};
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public Integer update(${entityName} record) throws ServiceException {
		if(record==null || record.get${businessId?cap_first}()==null){
			logger.error("不存在该${entityName}！,${businessId}:"+record.get${businessId?cap_first}());
			throw ServiceException.paramsError("不存在该${entityName}！",String.valueOf(record.get${businessId?cap_first}()));
		}
		
		${entityName} ${entityName?uncap_first}=null;
		try {
			${entityName?uncap_first}=${daoName?uncap_first}.selectByPrimaryKey(record.get${businessId?cap_first}());
		} catch (Exception e) {
			logger.error("查询${entityName}详情失败！,${businessId}:"+record.get${businessId?cap_first}() + e);
			throw ServiceException.busiError("查询${entityName}详情失败！",String.valueOf(record.get${businessId?cap_first}()));
		}
		if(${entityName?uncap_first}==null){
			logger.error("${entityName}不存在！");
			throw ServiceException.paramsError("${entityName}不存在", String.valueOf(record.get${businessId?cap_first}()));
		}
		
		
		try {
			return ${daoName?uncap_first}.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			logger.error("更新${entityName}详情失败！,${entityName?uncap_first}:" + e);
			throw ServiceException.busiError("更新${entityName}详情失败！",String.valueOf(record.get${businessId?cap_first}()));
		}
	}


}
