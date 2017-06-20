package com.yu.hang.code.factory;

import com.yu.hang.code.bean.Config;
import com.yu.hang.code.creator.FileCreator;
import com.yu.hang.code.creator.impl.BaseDaoCreator;
import com.yu.hang.code.creator.impl.BaseModelCreator;
import com.yu.hang.code.creator.impl.BaseServiceCreator;
import com.yu.hang.code.creator.impl.BaseServiceImplCreator;
import com.yu.hang.code.creator.impl.BeanClassCreator;
import com.yu.hang.code.creator.impl.ControllerClassCreator;
import com.yu.hang.code.creator.impl.DaoClassCreator;
import com.yu.hang.code.creator.impl.MapperXmlCreator;
import com.yu.hang.code.creator.impl.ServiceClassCreator;
import com.yu.hang.code.creator.impl.ServiceImplClassCreator;

/**
 * 
 * @author Administrator
 *
 */
public class SimpleFactory {
	private SimpleFactory() {
		super();
	}

	public static FileCreator create(String module, Config conf) {

		FileCreator creator = null;
		if (module.equals("bean")) {
			creator = BeanClassCreator.getInstance(conf);
		} else if (module.equals("controller")) {
			creator = ControllerClassCreator.getInstance(conf);
		} else if (module.equals("service")) {
			creator = ServiceClassCreator.getInstance(conf);
		} else if (module.equals("impl")) {
			creator = ServiceImplClassCreator.getInstance(conf);
		} else if (module.equals("mapper")) {
			creator = DaoClassCreator.getInstance(conf);
		} else if (module.equals("xml")) {
			creator = MapperXmlCreator.getInstance(conf);
		} else if (module.equals("baseModel")) {
			creator = BaseModelCreator.getInstance(conf);
		} else if (module.equals("baseDao")) {
			creator = BaseDaoCreator.getInstance(conf);
		} else if (module.equals("baseService")) {
			creator = BaseServiceCreator.getInstance(conf);
		} else if (module.equals("BaseServiceImpl")) {
			creator = BaseServiceImplCreator.getInstance(conf);
		}
		return creator;

	}
}
