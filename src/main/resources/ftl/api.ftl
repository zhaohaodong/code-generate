package ${apiPackageName};

import com.yryz.component.rpc.RpcResponse;
import com.yryz.component.rpc.dto.PageList;
import ${dtoPackageName}.${dtoName};
import ${entityPackageName}.${entityName};

/**
 * 
 * @ClassName: ${apiName}
 * @Description: ${apiName}接口
 * @author ${authorName}
 * @date ${currentTime}
 *
 */
public interface ${apiName} {

	/**
	*  获取${entityName}明细
	*  @param  id
	*  @return
	* */
	RpcResponse<${entityName}> get(Long id);

    /**
    * 获取${entityName}列表
    * @param ${dtoName?uncap_first}
    * @return
    * */
    RpcResponse<PageList<${entityName}>> list(CollectDto ${dtoName?uncap_first});

    RpcResponse<Boolean> add(${entityName} ${dtoName?uncap_first});


}
