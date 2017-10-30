package ${providerPackageName};
import com.yryz.common.web.ResponesModel;
import com.yryz.component.rpc.RpcResponse;
import com.yryz.component.rpc.dto.PageList;
import com.yryz.component.rpc.internal.DubboResponse;

import ${apiPackageName}.${apiName};
import ${voPackageName}.${voName};
import ${dtoPackageName}.${dtoName};
import ${servicePackageName}.${serviceName};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ${providerName} implements ${apiName} {

	private static final Logger logger = LoggerFactory.getLogger(${providerName}.class);

	@Autowired
	private ${serviceName} ${serviceName?uncap_first};

	/**
	*  获取${entityName}明细
	*  @param  id
	*  @return
	* */
	public RpcResponse<CollectVo> get(Long id) {
		try {
			 return ResponesModel.returnObjectSuccess(${voName}.class, ${serviceName?uncap_first}.get(${voName}.class, id));
		} catch (Exception e) {
			logger.error("获取${entityName}明细失败", e);
			return ResponesModel.returnException(e);
		}
    }

    /**
    * 获取${entityName}列表
    * @param ${dtoName?uncap_first}
    * @return
    *
	*/
    public RpcResponse<PageList<${voName}>> list(${dtoName} ${dtoName?uncap_first}) {
        try {
       		 return ResponesModel.returnListSuccess(${serviceName?uncap_first}.selectList(${dtoName?uncap_first}));
        } catch (Exception e) {
        	logger.error("获取${entityName}列表失败", e);
       		 return ResponesModel.returnException(e);
        }
    }

}
