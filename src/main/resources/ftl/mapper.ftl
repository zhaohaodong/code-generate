<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${daoPackageName}">

	<!--BaseResultMap-->
    <resultMap id="BaseResultMap" type="${enityPackageName}">
    <#list columns as pro>
	<#if pro.proName == 'id'>  
		<id column="id" property="id" jdbcType="BIGINT"/>
	<#else>	
		<result column="${pro.fieldName}" property="${pro.proName}" jdbcType="${pro.fieldType}"/>
	</#if>
    </#list>
    </resultMap>
	
	<!--Base_Column_List-->
	<sql id="Base_Column_List"><#list columns as pro><#if pro_index == 0>${pro.fieldName}<#else>,${pro.fieldName}</#if></#list>
    </sql>

   	<!-- 查询${entityName}列表 -->
    <select id="selectList" parameterType="${dtoPackageName}" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${tableName} where del_flag = 0
        <if test="${entityName?uncap_first}Code != null and ${entityName?uncap_first}Code != ''">
        	and ${entityName?uncap_first}_code like concat('%',trim(${r"#{"+entityName?uncap_first+"Code}"}),'%')
        </if>
        <if test="startDate != null and startDate != '' ">
             <![CDATA[  AND create_date >= ${r"#{startDate}"} ]]>
		</if>
		<if test="endDate != null and endDate != ''">
	            <![CDATA[ AND create_date <= ${r"#{endDate}"}   ]]>
		</if>
    </select>
    
     <!-- 查询${entityName}详情 -->
    <select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType="java.lang.Long">
        select
        <include refid="Base_Column_List"/>
        from ${tableName}
        where del_flag = 0 and id = ${r"#{id,jdbcType=BIGINT}"}
    </select>
    
    <!-- 查询${entityName}详情(根据${entityName}编码) -->
    <select id="selectBy${entityName}Code" resultMap="BaseResultMap" parameterType="java.lang.Long">
        select
        <include refid="Base_Column_List"/>
        from ${tableName}
        where del_flag = 0 and ${entityName?uncap_first}_code = ${r"#{"+entityName?uncap_first+r"Code"+r",jdbcType=BIGINT"+r"}"}
    </select>
    
    <!-- 删除${entityName}-->
    <delete id="deleteByPrimaryKey" parameterType="java.lang.Long">
   	 	delete from ${tableName}
    	where id = ${r"#{id,jdbcType=BIGINT}"}
    </delete>
  
  
  	<!-- 新增${entityName}-->
    <insert id="insert" parameterType="${enityPackageName}">
	    insert into ${tableName} (<#list columns as pro><#if pro_index == 0>${pro.fieldName}<#else>,${pro.fieldName}</#if></#list>)
	    values (${r"#{id,jdbcType=BIGINT}"}
	    <#list columns as pro>
	    <#if pro.fieldName == "create_date" || pro.fieldName == "last_update_date">
			,NOW()
		<#else>
			,${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
		</#if>
    	</#list>	
	    )
	</insert>
	
	
	<!-- 按需修改${entityName}-->   
    <update id="updateByPrimaryKeySelective" parameterType="${enityPackageName}">
        update ${tableName}
        <set>
           <#list columns as pro>
           	<#if pro_index == 0>
	    		 ${pro.fieldName} = ${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
	    	<#elseif pro.fieldName == "last_update_date">
	    		,${pro.fieldName} = NOW()
    		<#else>
    			,${pro.fieldName} = ${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
    		</#if>
    	</#list>
        </set>
        where id = ${r"#{id,jdbcType=BIGINT}"}
    </update>
    
    
</mapper>