package ${serviceImplPackageName};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${servicePackageName}.${serviceName};
import com.yryz.qstone.core.exception.ServiceException;
import ${entityPackageName}.${entityName};
import ${servicePackageName}.${openServiceName};

/**
 * 
  * @ClassName: ${openServiceImplName}
  * @Description: ${entityName}开放API业务实现类
  * @author ${authorName}
  * @date ${currentTime}
  *
 */
@Service
public class ${openServiceImplName} implements ${openServiceName} {

    @Autowired
    private ${serviceName} ${serviceName?uncap_first};

	@Override
	public void add(${entityName} account) throws ServiceException {
		${serviceName?uncap_first}.insert(account);
	}
	
}
