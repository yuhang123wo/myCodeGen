package ${conf.basePackage}.${conf.base}<#if prefixName??>.${prefixName}</#if>;

import java.util.List;
import java.util.Map;

/**
 * @类说明：
 * @version 1.0
 * @创建时间：${.now}
 */
public interface BaseService<T extends BaseModel> {
    
   
	/**
	 * 保存业务对象
	 * 
	 * @param model
	 */
	void save(T model);

	/**
	 * 批量保存业务对象列表
	 * 
	 * @param list
	 * @return
	 */
	int saveBatch(List<T> list);

	/**
	 * 根据ID查询
	 * 
	 * @param id
	 * @return
	 */
	T queryById(long id);

	/**
	 * 查询
	 * 
	 * @param map
	 * @return
	 */
	List<T> queryByParmas(Map<String, Object> map);
	
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
	int update(T model);
	/**
	 * 分页查询
	 * @param map
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	Page<T> queryPageByParmas(Map<String, Object> map, int pageNo, int pageSize);
}