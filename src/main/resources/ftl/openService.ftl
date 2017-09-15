package ${servicePackageName};

import com.yryz.qshop.common.exception.ServiceException;
import ${entityPackageName}.${entityName};

/**
 * 
  * @ClassName: ${openServiceName}
  * @Description: ${entityName}开放API接口
  * @author ${authorName}
  * @date ${currentTime}
  *
 */
public interface ${openServiceName} {

    /**
     * 创建${entityName}
     *
     * @param ${entityName?uncap_first}
     */
    void add(${entityName} ${entityName?uncap_first}) throws ServiceException;
    
}
