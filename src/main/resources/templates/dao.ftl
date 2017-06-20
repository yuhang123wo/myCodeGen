package ${conf.basePackage}.${conf.mapperPackage}<#if prefixName??>.${prefixName}</#if>;

import ${conf.basePackage}.${conf.beanPackage}<#if prefixName??>.${prefixName}</#if>.${table.beanName};

/**
 * @类说明：
 * ${table.tableDesc}
 * @version 1.0
 * @创建时间：${.now}
 */
public interface ${table.beanName}Dao extends BaseDao<${table.beanName}> {
}