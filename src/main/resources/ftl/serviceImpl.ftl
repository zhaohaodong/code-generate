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
import com.yryz.qstone.core.constant.CommonConstant;
import com.yryz.qstone.core.entity.PageEntity;
import com.yryz.qstone.core.exception.ServiceException;
import ${dtoPackageName}.${dtoName};
import ${entityPackageName}.${entityName};
import ${daoPackageName}.${daoName};
import com.yryz.qstone.modules.id.api.IdAPI;

/**
 * 
 * @ClassName: ${serviceImplName}
 * @Description: ${serviceImplName}
 * @author zhongying
 * @date ${currentTime}
 *
 */
@Service
public class ${serviceImplName} implements ${serviceName} {
	private static final Logger logger = LoggerFactory.getLogger(${entityName}Provider.class);

	@Autowired
	private ${daoName} ${daoName?uncap_first};

	@Autowired
	IdAPI idAPI;

	@Override
	public PageEntity<${entityName}> list(${dtoName} ${dtoName?uncap_first}) throws ServiceException {
		PageHelper.startPage(${dtoName?uncap_first}.getPageNo(), ${dtoName?uncap_first}.getPageSize());
		List<${entityName}> ${entityName?uncap_first} = null;
		try {
			${entityName?uncap_first} = ${daoName?uncap_first}.selectList(${dtoName?uncap_first});
		} catch (Exception e) {
			logger.error("查询${entityName}列表信息失败！,${dtoName?uncap_first}:", e);
			throw ServiceException.busiError("查询${entityName}列表信息失败！");
		}
		PageEntity<${entityName}> pageEntity = new PageEntity<${entityName}>(${entityName?uncap_first});
		return pageEntity;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public Integer delete(Long id) throws ServiceException {
		if(id==null){
			logger.error("${entityName}ID不能为空！,id:"+id);
			throw ServiceException.paramsError("${entityName}ID不能为空！",String.valueOf(id));
		}
		
		${entityName} ${entityName?uncap_first}=null;
		try {
			${entityName?uncap_first}=${daoName?uncap_first}.selectByPrimaryKey(id);
		} catch (Exception e) {
			logger.error("查询${entityName}详情失败！,id:"+id + e);
			throw ServiceException.busiError("查询${entityName}详情失败！",String.valueOf(id));
		}
		
		if(${entityName?uncap_first}==null){
			logger.error("${entityName}不存在！");
			throw ServiceException.paramsError("${entityName}不存在", String.valueOf(id));
		}
		try {
			${entityName?uncap_first}.setDelFlag(CommonConstant.del.deleted.intValue());
			return ${daoName?uncap_first}.updateByPrimaryKeySelective(${entityName?uncap_first});
		} catch (Exception e) {
			logger.error("删除${entityName}失败！,id:" + id, e);
			throw ServiceException.busiError("删除${entityName}失败！",String.valueOf(id));
		}
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public Integer insert(${entityName} record) throws ServiceException {
		try {
			Long ${entityName?uncap_first}Code = idAPI.getId("${entityName}");
			//record.set${entityName}Code(${entityName?uncap_first}Code);
			return ${daoName?uncap_first}.insert(record);
		} catch (Exception e) {
			logger.error("新增${entityName}失败！,${entityName?uncap_first}:" + e);
			throw ServiceException.busiError("新增${entityName}失败！");
		}
	}

	
	@Override
	public ${entityName} detail(Long id) throws ServiceException {
		if(id==null){
			logger.error("${entityName}ID不能为空！,id:"+id);
			throw ServiceException.paramsError("${entityName}ID不能为空！",String.valueOf(id));
		}
		
		${entityName} ${entityName?uncap_first}=null;
		try {
			${entityName?uncap_first}=${daoName?uncap_first}.selectByPrimaryKey(id);
		} catch (Exception e) {
			logger.error("查询${entityName}详情失败！,id:"+id + e);
			throw ServiceException.busiError("查询${entityName}详情失败！",String.valueOf(id));
		}
		return ${entityName?uncap_first};
	}
	
	@Override
	public ${entityName} selectBy${entityName}Code(Long ${entityName?uncap_first}Code) throws ServiceException {
		if(${entityName?uncap_first}Code==null){
			logger.error("${entityName}编码不能为空！,${entityName?uncap_first}Code:"+${entityName?uncap_first}Code);
			throw ServiceException.paramsError("${entityName}编码不能为空！",String.valueOf(${entityName?uncap_first}Code));
		}
		
		${entityName} ${entityName?uncap_first}=null;
		try {
			${entityName?uncap_first}=${daoName?uncap_first}.selectBy${entityName}Code(${entityName?uncap_first}Code);
		} catch (Exception e) {
			logger.error("查询${entityName}详情失败！,${entityName?uncap_first}Code:"+${entityName?uncap_first}Code + e);
			throw ServiceException.busiError("查询${entityName}详情失败！",String.valueOf(${entityName?uncap_first}Code));
		}
		return ${entityName?uncap_first};
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public Integer update(${entityName} record) throws ServiceException {
		if(record==null || record.getId()==null){
			logger.error("不存在该${entityName}！,id:"+record.getId());
			throw ServiceException.paramsError("不存在该${entityName}！",String.valueOf(record.getId()));
		}
		
		${entityName} ${entityName?uncap_first}=null;
		try {
			${entityName?uncap_first}=${daoName?uncap_first}.selectByPrimaryKey(record.getId());
		} catch (Exception e) {
			logger.error("查询${entityName}详情失败！,id:"+record.getId() + e);
			throw ServiceException.busiError("查询${entityName}详情失败！",String.valueOf(record.getId()));
		}
		if(${entityName?uncap_first}==null){
			logger.error("${entityName}不存在！");
			throw ServiceException.paramsError("${entityName}不存在", String.valueOf(record.getId()));
		}
		
		
		try {
			return ${daoName?uncap_first}.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			logger.error("更新${entityName}详情失败！,${entityName?uncap_first}:" + e);
			throw ServiceException.busiError("更新${entityName}详情失败！",String.valueOf(record.getId()));
		}
	}


}
