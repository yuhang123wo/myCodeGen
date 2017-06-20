package com.yu.hang.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yu.hang.code.bean.Config;
import com.yu.hang.code.bean.ConfigVo;
import com.yu.hang.code.bean.TableInfo;
import com.yu.hang.code.config.ConfigLoader;
import com.yu.hang.code.util.DbUtils;
import com.yu.hang.code.util.Generater;
import com.yu.hang.code.util.JsonMapper;

import freemarker.template.TemplateException;

/**
 * mybatis代码生成器
 * 
 * @author yuhang
 * @Date 2017年6月16日
 * @desc
 */
public class GeneratorApp {

	private static Logger logging = LoggerFactory.getLogger(GeneratorApp.class);

	public void doCreate() throws SQLException, ClassNotFoundException, IOException,
			TemplateException {
		createBase();
		// 基础信息
		ConfigVo configVo = ConfigLoader.getInstance().getCurr();
		Config conf = configVo.getConfig();
		// 表集合
		List<TableInfo> tableInfos = getTableInfos(conf);
		logging.info("tableInfos ==>" + JsonMapper.nonDefaultMapper().toJson(tableInfos));
		// 生成单表文件
		Generater.createFile(conf, tableInfos);
	}
	
	private void createBase() throws ClassNotFoundException, SQLException, IOException, TemplateException {
		// 基础信息
		ConfigVo configVo = ConfigLoader.getInstance().getCurr();
		Config conf = configVo.getConfig();
		// 生成单表文件
		String[] base = new String[] { "baseModel", "baseDao", "baseService", "BaseServiceImpl" };
		for (String b : base) {
			Generater.createFileBase(conf, b);
		}
	}

	private List<TableInfo> getTableInfos(Config conf) throws ClassNotFoundException, SQLException {
		Connection connection = DbUtils.getInstance().getConnection();
		DatabaseMetaData metaData = DbUtils.getInstance().getMetaData(connection);
		List<String> tableNames = Arrays.asList(conf.getTables().split(","));
		return DbUtils.getInstance().getAllTables(metaData, tableNames);
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException, TemplateException {
		new GeneratorApp().doCreate();
	}
}
