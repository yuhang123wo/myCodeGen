<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<#assign beanName = table.beanName/>
<#assign tableName = table.tableName/>
<#macro mapperEl value>${r"#{"}${value}}</#macro>
<#assign primaryKey = table.primaryKey/>
<#assign keys = primaryKey?keys/>
<#assign mapper = conf.basePackage+"."+conf.mapperPackage+"."+beanName+"Dao"/>
<!-- namespace必须指向Dao接口 -->
<mapper namespace="${mapper}">
	<#list keys as key>
		<#assign pk_column = key/>
		<#assign pk_field = primaryKey[key]/>
    </#list>
   <resultMap type="${beanName}" id="${beanName}Map">
		<#list table.fieldInfos as fieldInfo> 
		  <id property ="${fieldInfo.beanName}" column="${fieldInfo.columnName}" />
		</#list>
	</resultMap>

	<sql id="sql${beanName}">
    	<#list table.fieldInfos as fieldInfo>${fieldInfo.columnName}<#if !(fieldInfo?is_last)>,</#if></#list>
	</sql>
	
	<sql id="where${beanName}">
        <where>
        	<!--<if test="startTime!=null">
	        	<![CDATA[
	        		and create_time>=<@mapperEl "startTime"/>
	        	]]>
	        </if>
	        <if test="endTime!=null">
	        	<![CDATA[
	        		and create_time<=<@mapperEl "endTime"/>
	        	]]>
	        </if> -->
        </where>
    </sql>
    
    <insert id="save" keyProperty="id"	useGeneratedKeys="true">
		insert into ${tableName}(<#list table.fieldInfos as fieldInfo><#if fieldInfo.columnName!="id">${fieldInfo.columnName}<#if !(fieldInfo?is_last)>,</#if></#if></#list>) values
		 (<#list table.fieldInfos as fieldInfo><#if fieldInfo.beanName!="id"><@mapperEl fieldInfo.beanName/><#if !(fieldInfo?is_last)>,</#if></#if></#list>)
	</insert>
    
    <insert id="saveBatch" parameterType="java.util.List">
		insert into ${tableName}(<#list table.fieldInfos as fieldInfo><#if fieldInfo.columnName!="id">${fieldInfo.columnName}<#if !(fieldInfo?is_last)>,</#if></#if></#list>) values
		<foreach collection="list" item="item" separator=",">
			(<#list table.fieldInfos as fieldInfo><#if fieldInfo.beanName!="id"><@mapperEl "item."+fieldInfo.beanName/><#if !(fieldInfo?is_last)>,</#if></#if></#list>)
		</foreach>
	</insert>
	
	<select id="queryById" resultMap="${beanName}Map">
     select   <include refid="sql${beanName}"/> FROM ${tableName}  where id=${r'#{id}'}
    </select>

    <select id="queryByParmas" parameterType="map" resultMap="${beanName}Map">
      select  <include refid="sql${beanName}"/> FROM ${tableName} where <include refid="where${beanName}"/>
        <if test="start!=null and size!=null">
	        limit <@mapperEl "start"/>,<@mapperEl "size"/>
        </if>
    </select>
    
    <select id="countByParmas"  parameterType="map" resultType="int">
      select  count(1) FROM ${tableName} where <include refid="where${beanName}"/>
    </select>
    
   <update id="update">
        UPDATE ${tableName} set 
        <#list table.fieldInfos as fieldInfo><#if fieldInfo.columnName!="id">${fieldInfo.columnName}=<@mapperEl fieldInfo.beanName/><#if !(fieldInfo?is_last)>,</#if></#if></#list>
        WHERE id = ${r'#{id}'}
    </update>    
</mapper>