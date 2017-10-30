package ${providerPackageName};
import com.yryz.common.web.ResponesModel;
import com.yryz.component.rpc.RpcResponse;
import com.yryz.component.rpc.dto.PageList;
import com.yryz.component.rpc.internal.DubboResponse;

import ${apiPackageName}.${apiName};
import ${voPackageName}.${voName};
import ${entityPackageName}.${entityName};
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
	private CollectSerivce collectSerivce;

	/**
	*  获取${entityName}明细
	*  @param  id
	*  @return
	* */
	public RpcResponse<CollectVo> get(Long id) {
		try {
			 return ResponesModel.returnObjectSuccess(CollectVo.class, collectSerivce.get(CollectVo.class, id));
		} catch (Exception e) {
			logger.error("获取${entityName}明细失败", e);
			return ResponesModel.returnException(e);
		}
    }

    /**
    * 获取${entityName}列表
    * @param collect
    * @return
    *
	*/
    public RpcResponse<PageList<CollectVo>> list(CollectDto collect) {
        try {
        return ResponesModel.returnListSuccess(collectSerivce.selectList(collect));
        } catch (Exception e) {
        logger.error("获取${entityName}列表失败", e);
        return ResponesModel.returnException(e);
        }
    }

    public RpcResponse<Boolean> add(Collect collect) {
		DubboResponse<Boolean> response = new DubboResponse<Boolean>(null, null, null, null, null);
		response.setStatus(true);
		try {
			collectSerivce.insert(new Collect());
			response.setData(true);
			response.setMsg("success");
		} catch (Exception e) {
			response.setStatus(false);
			response.setErrorMsg("add fail");
		}

			return response;
		}
   }
