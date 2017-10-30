package com.yryz.openapi.${entityName?uncap_first}.web;

import com.yryz.component.rpc.RpcResponse;
import com.yryz.component.rpc.dto.PageList;

import ${voPackageName}.${voName};
import ${dtoPackageName}.${dtoName};
import ${entityPackageName}.${entityName};
import ${apiPackageName}.${apiName};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("services/app/v1/${entityName?uncap_first}")
public class ${controllerName} {
   @Autowired
   private ${apiName} ${apiName?uncap_first};

   @ResponseBody
   @RequestMapping(value="/detail", method = RequestMethod.GET)
   public RpcResponse<${voName}> get(Long id) {
       return ${apiName?uncap_first}.get(id);
   }

   @ResponseBody
   @RequestMapping(value="/list", method = RequestMethod.GET)
   public RpcResponse<PageList<${voName}>> list(${dtoName} ${dtoName?uncap_first}) {
        return ${apiName?uncap_first}.list(${dtoName?uncap_first});
   }

}
