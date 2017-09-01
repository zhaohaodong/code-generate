package ${daoPackageName};

import ${entityPackageName}.${entityName};
import ${dtoPackageName}.${dtoName};

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ${daoName} {

    List<${entityName}> selectList(${dtoName} ${dtoName?uncap_first});

    Integer deleteByPrimaryKey(Long id);

    Integer insert(${entityName} ${entityName?uncap_first});

    ${entityName} selectByPrimaryKey(Long id);

    Integer updateByPrimaryKeySelective(${entityName} ${entityName?uncap_first});
}