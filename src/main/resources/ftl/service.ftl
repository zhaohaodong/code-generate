package ${servicePackageName};

import com.yryz.common.service.BaseService;
import ${entityPackageName}.${entityName};
import ${dtoPackageName}.${dtoName};

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 
  * @ClassName: ${serviceName}
  * @Description: ${entityName}业务访问接口
  * @author ${authorName}
  * @date ${currentTime}
  *
 */
@Repository
public interface ${serviceName} extends BaseService {

    List<${entityName}> selectList(${dtoName} ${dtoName?uncap_first});

}