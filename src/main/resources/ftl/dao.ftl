package ${daoPackageName};

import ${entityPackageName}.${entityName};
import ${dtoPackageName}.${dtoName};

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ${fileName?substring(0,fileName?index_of("."))} {

    List<${entityName}> selectList(${entityName}Dto ${entityName?uncap_first}Dto);

    Integer deleteByPrimaryKey(Long id);

    Integer insert(${entityName} record);

    ${entityName} selectByPrimaryKey(Long id);

    Integer updateByPrimaryKeySelective(${entityName} record);
}