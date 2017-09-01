package ${serviceImplPackageName};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yryz.qstone.api.AccountApi;
import com.yryz.qstone.core.exception.ServiceException;
import com.yryz.qstone.entity.base.model.Account;
import com.yryz.qstone.modules.base.api.OpenAccountApi;

/**
 * 
  * @ClassName: OpenAccountService
  * @Description: 账户开放API业务实现类
  * @author zhongying
  * @date 2017年8月23日 上午9:46:38
  *
 */
@Service
public class OpenAccountService implements OpenAccountApi {

    @Autowired
    private AccountApi accountApi;

	@Override
	public void add(Account account) throws ServiceException {
		accountApi.insert(account);
	}

	@Override
	public Account detail(Long accountCode) throws ServiceException {
		return accountApi.selectByAccountCode(accountCode);
	}
	
	
}
