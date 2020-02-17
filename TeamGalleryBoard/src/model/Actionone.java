package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class Actionone {
	static Actionone model = new Actionone();
	public static Actionone instance(){ //instance메소드가 객체를 항상 뱉어냄. 싱글톤패턴, static(정적) 한번실행하면 전체를실행시키는것처럼 느껴짐
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); //SqlMapConfig를 사용하겠다

	public List<Mdto> selectSangpum(){ //mapper에서 dto의 resulttype으로 넘겨줬으면, 받아줄때 이곳에서 List***의 형태로 받아줌 
		List<Mdto> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectData"); //mapper.xml의 ,<select> id
		sqlSession.close();
		return list;
	}

}
