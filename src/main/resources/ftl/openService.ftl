package ${servicePackageName};

import com.yryz.qstone.core.exception.ServiceException;
import ${entityPackageName}.${entityName};

/**
 * 
  * @ClassName: ${openServiceName}
  * @Description: 账户开放API接口
  * @author ${authorName}
  * @date 2017年8月23日 上午9:42:54
  *
 */
public interface ${openServiceName} {

    /**
     * 创建账户
     *
     * @param ${entityName?uncap_first}
     */
    void add(${entityName} ${entityName?uncap_first}) throws ServiceException;
    
}
