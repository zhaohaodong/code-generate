package ${daoPackageName};

import ${entityPackageName}.${entityName};
import ${dtoPackageName}.${dtoName};

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 
  * @ClassName: ${daoName}
  * @Description: ${entityName}数据访问接口
  * @author ${authorName}
  * @date ${currentTime}
  *
 */
@Repository
public interface ${daoName} {

    List<${entityName}> selectList(${dtoName} ${dtoName?uncap_first});

    Integer deleteByPrimaryKey(Long id);

    Integer insert(${entityName} ${entityName?uncap_first});
    
 	Integer insertByPrimaryKeySelective(${entityName} ${entityName?uncap_first});
 
    ${entityName} selectByPrimaryKey(Long id);

    Integer updateByPrimaryKeySelective(${entityName} ${entityName?uncap_first});
}