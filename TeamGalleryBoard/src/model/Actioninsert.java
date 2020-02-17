package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class Actioninsert {
	static Actioninsert model = new Actioninsert();

	public static Actioninsert instance() { // instance메소드가 객체를 항상 뱉어냄. 싱글톤패턴, static(정적) 한번실행하면 전체를실행시키는것처럼 느껴짐
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void insertinform(Mdto Mdto) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("insertData", Mdto); // mapper.xml의 ,<select> id
		sqlSession.commit();

		sqlSession.close();
	}

}
