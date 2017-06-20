<#import "base/date.ftl" as dt>
package ${conf.basePackage}.${conf.servicePackage}<#if prefixName??>.${prefixName}</#if>.impl;
<#assign beanName = table.beanName/>
<#assign beanNameUncap_first = beanName?uncap_first/>

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ${conf.basePackage}.${conf.servicePackage}<#if prefixName??>.${prefixName}</#if>.${beanName}Service;
import org.springframework.beans.factory.annotation.Resource;

/**
 * @类说明：
 * ${table.tableDesc}
 * @创建时间：${.now}
 */
@Service("${beanNameUncap_first}Service")
public class ${beanName}ServiceImpl extends BaseServiceImpl<${beanName}> implements ${beanName}Service {
	<#assign primaryKey = table.primaryKey/>
	<#assign keys = primaryKey?keys/>
	<#list keys as key>
		<#assign pk_column = key/>
		<#assign pk_field = primaryKey[key]/>
    </#list>
        
	@Resource
	private ${beanName}Dao ${beanNameUncap_first}Dao;
	
	public BaseDao<${beanName}> getDao() {
		return ${beanNameUncap_first}Dao;
	}
}