package kr.co.tripadvisor.common.db;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyAppSqlConfig {
	private static final SqlSession sqlMapper;
	
	static {
		try {
			String resource = "config/mybatis/SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
			sqlMapper = factory.openSession(true);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException ("Error Initializing MyAppSqlConfig class, cause : " + e);
		}
	}
	
	public static SqlSession getSqlSession() {
		return sqlMapper;
	}
}
