package com.yu.hang.code.creator.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yu.hang.code.bean.Config;
import com.yu.hang.code.bean.TableInfo;
import com.yu.hang.code.creator.AbstractFileCreator;

import freemarker.template.Template;
import freemarker.template.TemplateException;

public class BaseServiceImplCreator extends AbstractFileCreator {
	private BaseServiceImplCreator() {
		super();
	}

	private BaseServiceImplCreator(Config conf) {
		super();
		init(conf);
	}

	public static synchronized BaseServiceImplCreator getInstance(Config conf) {
		return new BaseServiceImplCreator(conf);
	}

	@Override
	public void createFile(TableInfo tableInfo) throws IOException, TemplateException {
		String ftl = "base/BaseServiceImpl.ftl";
		String fileName = "BaseServiceImpl.java";
		String selfPath = conf.getBase();
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("table", tableInfo);
		root.put("conf", conf);
		Template temp = cfg.getTemplate(ftl);
		fileName = javaPath + selfPath + separator + fileName;
		createFile(fileName, root, temp);
	}

	@Override
	public void createFile(List<TableInfo> tableInfos, String beanName, String comments)
			throws IOException, TemplateException {

	}
}
