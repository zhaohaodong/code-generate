package ${servicePackageName};

import com.yryz.qstone.core.exception.ServiceException;
import ${entityPackageName}.${entityName};

/**
 * 
  * @ClassName: ${openServiceName}
  * @Description: 账户开放API接口
  * @author ${authorName}
  * @date ${currentTime}
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
