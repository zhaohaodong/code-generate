<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${daoPackageName}.${daoName}">

	<!--BaseResultMap-->
    <resultMap id="BaseResultMap" type="${entityPackageName}.${entityName}">
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
    <select id="selectList" parameterType="${dtoPackageName}.${dtoName}" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${tableName} where del_flag = 0
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
    
    <!-- 删除${entityName}-->
    <delete id="deleteByPrimaryKey" parameterType="java.lang.Long">
   	 	delete from ${tableName}
    	where id = ${r"#{id,jdbcType=BIGINT}"}
    </delete>
  
  
  	<!-- 新增${entityName}-->
    <insert id="insert" parameterType="${entityPackageName}.${entityName}">
	    insert into ${tableName} (<#list columns as pro><#if pro_index == 0><#elseif pro_index == 1>${pro.fieldName}<#else>,${pro.fieldName}</#if></#list>)
	    values (
	    <#list columns as pro>
	    <#if pro_index == 0>
	    <#elseif pro_index == 1>
	    	${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
	    <#else>
	    	<#if pro.fieldName == "create_date" || pro.fieldName == "last_update_date">
			,NOW()
			<#else>
				,${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
			</#if>
	    </#if>
    	</#list>	
	    )
	</insert>
	
	<!--按需新增${entityName}-->
    <insert id="insertByPrimaryKeySelective" parameterType="${entityPackageName}.${entityName}">
	    insert into ${tableName} (
	    <#list columns as pro>
	    <#if pro.fieldName != "id">
	    <#if pro.fieldType == 'VARCHAR'>
        <if test="${pro.proName} != null and ${pro.proName} != ''">
	    <#else>
        <if test="${pro.proName} != null">
        </#if>
	    <#if pro_index == 1>
	    	${pro.fieldName}
	    <#else>
			,${pro.fieldName}
	    </#if>
	    </if>
	    </#if>
    	</#list>	
	    )
	    values (
	    <#list columns as pro>
	    <#if pro.fieldName != "id">
	    <#if pro.fieldType == 'VARCHAR'>
        <if test="${pro.proName} != null and ${pro.proName} != ''">
	    <#else>
        <if test="${pro.proName} != null">
        </#if>
	    <#if pro_index == 1>
	    	${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
	    <#else>
			,${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
	    </#if>
	    </if>
	    </#if>
    	</#list>	
	    )
	</insert>
	
	
	<!-- 按需修改${entityName}-->   
    <update id="updateByPrimaryKeySelective" parameterType="${entityPackageName}.${entityName}">
        update ${tableName}
        <set>
           <#list columns as pro>
           	<#if pro.fieldType == 'VARCHAR'>
            <if test="${pro.proName} != null and ${pro.proName} != ''">
            <#else>
             <if test="${pro.proName} != null">
            </#if>
           	<#if pro_index == 0>
	    		 ${pro.fieldName} = ${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
	    	<#elseif pro.fieldName == "last_update_date">
	    		,${pro.fieldName} = NOW()
    		<#else>
    			,${pro.fieldName} = ${r"#{" + pro.proName + r",jdbcType=" + pro.fieldType +r"}"}
    		</#if>
    		</if>
    	</#list>
        </set>
        where id = ${r"#{id,jdbcType=BIGINT}"}
    </update>
    
    
</mapper>