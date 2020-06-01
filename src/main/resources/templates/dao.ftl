package ${conf.basePackage}.${conf.mapperPackage}<#if prefixName??>.${prefixName}</#if>;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import ${conf.basePackage}.${conf.beanPackage}<#if prefixName??>.${prefixName}</#if>.${table.beanName};

/**
 * @类说明：
 * ${table.tableDesc}
 * @version 1.0
 * @创建时间：${.now}
 */
public interface ${table.beanName}Dao {


	/**
	 * 保存业务对象
	 * 
	 * @param model
	 * @throws Exception
	 */
	void save(${table.beanName} model);

	/**
	 * 批量保存业务对象列表
	 * 
	 * @param list
	 * @return
	 * @throws Exception
	 */
	int saveBatch(List<${table.beanName}> list);

	/**
	 * 根据ID查询
	 * 
	 * @param id
	 * @return
	 */
	${table.beanName} queryById(@Param("id") long id);

	/**
	 * 查询
	 * 
	 * @param map
	 * @return
	 */
	List<${table.beanName}> queryByParmas(Map<String, Object> map);
	
	/**
	 * 统计
	 * 
	 * @param map
	 * @return
	 */
	int countByParmas(Map<String, Object> map);
	
	/**
	 * 更新单个
	 * 
	 * @param model
	 * @return
	 */
	int update(${table.beanName} model);
}