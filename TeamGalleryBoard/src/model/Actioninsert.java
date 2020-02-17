package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class Actioninsert {
	static Actioninsert model = new Actioninsert();

	public static Actioninsert instance() { // instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void insertinform(Mdto Mdto) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("insertData", Mdto); // mapper.xml�� ,<select> id
		sqlSession.commit();

		sqlSession.close();
	}

}
