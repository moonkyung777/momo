package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class Actionone {
	static Actionone model = new Actionone();
	public static Actionone instance(){ //instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); //SqlMapConfig�� ����ϰڴ�

	public List<Mdto> selectSangpum(){ //mapper���� dto�� resulttype���� �Ѱ�������, �޾��ٶ� �̰����� List***�� ���·� �޾��� 
		List<Mdto> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectData"); //mapper.xml�� ,<select> id
		sqlSession.close();
		return list;
	}

}
