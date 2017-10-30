package ${serviceImplPackageName};

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yryz.common.dao.BaseDao;
import com.yryz.common.service.BaseServiceImpl;
import com.yryz.common.web.PageModel;
import com.yryz.component.rpc.dto.PageList;
import com.yryz.qsource.modules.collect.dao.persistence.CollectDao;
import com.yryz.qsource.modules.collect.dto.CollectDto;
import com.yryz.qsource.modules.collect.entity.Collect;
import com.yryz.qsource.modules.collect.service.CollectSerivce;
import com.yryz.qsource.modules.collect.vo.CollectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ${serviceImplName} extends BaseServiceImpl implements ${serviceName} {

    @Autowired
    private CollectDao collectDao;

    protected BaseDao getDao() {
        return collectDao;
    }

    public PageList<CollectVo> selectList(CollectDto collect){
        PageHelper.startPage(collect.getCurrentPage(), collect.getPageSize());
        List<CollectVo> list = collectDao.selectList(collect);
         return new PageModel<CollectVo>().getPageList(list);
    }

 }
