package ${daoPackageName};

import ${enityPackageName}.${entityName};
import ${dtoPackageName}.${dtoName};

import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

@Repository
public interface ${fileName?substring(0,fileName?index_of("."))} {

    List<${entityName}> selectList(${entityName}Dto ${entityName?uncap_first}Dto);

    int deleteByPrimaryKey(Long id);

    int insert(${entityName} record);

    ${entityName} selectByPrimaryKey(Long id);

	${entityName} selectBy${entityName}Code(Long ${entityName?uncap_first}Code);

    int updateByPrimaryKeySelective(${entityName} record);
}