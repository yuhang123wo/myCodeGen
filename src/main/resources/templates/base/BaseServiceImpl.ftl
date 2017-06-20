package ${conf.basePackage}.${conf.base}<#if prefixName??>.${prefixName}</#if>;

import java.util.List;
import java.util.Map;

/**
 * @类说明：
 * @version 1.0
 * @创建时间：${.now}
 */
public abstract class BaseServiceImpl<T extends BaseModel> implements BaseService<T>  {
    
   protected Class<T> clazz;

	public BaseServiceImpl() {
		clazz = ReflectionHelper.getClassGenricType(getClass());
	}

	/**
	 * dao 层实现类
	 */
	public abstract BaseDao<T> getDao(); 


	@Override
	public void save(T t) {
		Assert.isTrue(StringHelper.objectIsNotNull(t), "model为空");
		this.getDao().save(t);
	}

	@Override
	public int saveBatch(List<T> list) {
		Assert.isTrue(StringHelper.listIsNotNull(list), "model为空");
		return this.getDao().saveBatch(list);
	}
    
    @Override
	public T queryById(Long id){
		return this.getDao().queryById(id);
	}

	@Override
	public List<T> queryByParmas(Map<String, Object> map){
	   return this.getDao().queryByParmas(map);
	}
	
	@Override
	public int countByParmas(Map<String, Object> map){
	  return this.getDao().countByParmas(map);
	}
	
	@Override
	public int update(T model){
	 return this.getDao().update(model);
	}
}