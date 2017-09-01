package ${servicePackageName};

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.rpc.RpcContext;
import com.yryz.qstone.core.constant.ExceptionEnum;
import com.yryz.qstone.core.entity.ResultEntity;
import com.yryz.qstone.core.exception.ServiceException;
import ${enityPackageName}.${entityName};
import ${servicePackageName}.${serviceName};

/**
 * 
 * @ClassName: ${entityName}Controller
 * @Description: ${entityName}开放API控制层
 * @author zhongying
 * @date 2017年8月23日 上午9:47:25
 *
 */
@Controller
@RequestMapping("${entityName?uncap_first}")
public class ${fileName?substring(0,fileName?index_of("."))} {

	@Autowired
	private ${serviceName} ${serviceName?uncap_first};

	/**
	 * 创建${entityName}
	 * 
	 * @param owner
	 * @param clientCode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "add")
	public ResultEntity<String> add(@RequestBody ${entityName} ${entityName?uncap_first}, @RequestHeader("clientCode") String clientCode) {
		//if (${entityName?uncap_first}.getOwnerCode() == null) {
		//	 return new ResultEntity<String>(ExceptionEnum.BusiException.getCode(), "资金主体编码不能为空！");
		//}
		
		try {
			RpcContext.getContext().setAttachment("clientCode", clientCode);
			${serviceName?uncap_first}.insert(${entityName?uncap_first});
		} catch (Exception e) {
      	  if (e instanceof ServiceException)
                return new ResultEntity<String>(ExceptionEnum.BusiException.getCode(), ((ServiceException) e).getMsg());
            else
                return new ResultEntity<String>(ExceptionEnum.BusiException.getCode(), "RPC调用异常");
      }
		 return new ResultEntity<String>("success");
	}

	/**
	 * 查询${entityName}详情
	 * 
	 * @param ${entityName?uncap_first}Code
	 * @param clientCode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/detail/{${entityName?uncap_first}Code}", method = RequestMethod.GET)
	public ResultEntity<${entityName}> detail(@PathVariable("${entityName?uncap_first}Code") Long ${entityName?uncap_first}Code,
			@RequestHeader("clientCode") String clientCode) {
		if (StringUtils.isBlank(clientCode)) {
			return new ResultEntity(ExceptionEnum.BusiException.getCode(), "客户端编码无效");
		}
		RpcContext.getContext().setAttachment("clientCode", clientCode);
		${entityName} ${entityName?uncap_first} = ${serviceName?uncap_first}.detail(${entityName?uncap_first}Code);
		return new ResultEntity<${entityName}>(${entityName?uncap_first});
	}

}
