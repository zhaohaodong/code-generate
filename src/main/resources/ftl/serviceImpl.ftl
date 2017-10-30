package ${serviceImplPackageName};

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yryz.common.dao.BaseDao;
import com.yryz.common.service.BaseServiceImpl;
import com.yryz.common.web.PageModel;
import com.yryz.component.rpc.dto.PageList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${voPackageName}.${voName};
import ${dtoPackageName}.${dtoName};
import ${entityPackageName}.${entityName};
import ${daoPackageName}.${daoName};
import ${servicePackageName}.${serviceName};



import java.util.List;

@Service
public class ${serviceImplName} extends BaseServiceImpl implements ${serviceName} {

    @Autowired
    private ${daoName} ${daoName?uncap_first};

    protected BaseDao getDao() {
        return ${daoName?uncap_first};
    }

    public PageList<${voName}> selectList(${dtoName} ${dtoName?uncap_first}){
        PageHelper.startPage(${dtoName?uncap_first}.getCurrentPage(), ${dtoName?uncap_first}.getPageSize());
        List<${voName}> list = ${daoName?uncap_first}.selectList(${dtoName?uncap_first});
         return new PageModel<${voName}>().getPageList(list);
    }

 }
