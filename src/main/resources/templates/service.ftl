package ${conf.basePackage}.${conf.servicePackage}<#if prefixName??>.${prefixName}</#if>;

<#assign beanName = table.beanName/>
import ${conf.basePackage}.${conf.beanPackage}<#if prefixName??>.${prefixName}</#if>.${beanName};
import java.util.Map;
import java.util.List;
import org.springframework.data.domain.Page;

/**
 * @类说明：
 * ${table.tableDesc}
 * @创建时间：${.now}
 */
public interface ${beanName}Service extends BaseService<${beanName}> {

	<#assign primaryKey = table.primaryKey/>
	<#assign keys = primaryKey?keys/>
	<#list keys as key>
		<#assign pk_column = key/>
		<#assign pk_field = primaryKey[key]/>
    </#list>
	
}