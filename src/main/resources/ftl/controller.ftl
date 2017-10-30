package com.yryz.openapi.event.web;

import com.yryz.component.rpc.RpcResponse;
import com.yryz.component.rpc.dto.PageList;
import com.yryz.qsource.modules.collect.CollectApi;
import com.yryz.qsource.modules.collect.dto.CollectDto;
import com.yryz.qsource.modules.collect.vo.CollectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("services/app/v1/collect")
public class CollectController {
   @Autowired
   private CollectApi collectApi;

   @ResponseBody
   @RequestMapping(value="/detail", method = RequestMethod.GET)
   public RpcResponse<CollectVo> get(Long id) {
       return collectApi.get(id);
   }

   @ResponseBody
   @RequestMapping(value="/list", method = RequestMethod.GET)
   public RpcResponse<PageList<CollectVo>> list(CollectDto collect) {
           return collectApi.list(collect);
   }

}
