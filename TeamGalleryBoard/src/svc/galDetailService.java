package svc;

import java.sql.Connection;
import dao.GBDAO;
import vo.GBbean;
import static db.JdbcUtil.*;

public class galDetailService {

	public GBbean getArticle(int GB_NUM) throws Exception{
		// TODO Auto-generated method stub
		
		GBbean article = null;
		Connection con = getConnection();
		GBDAO GBdao = GBDAO.getInstance();
		GBdao.setConnection(con);
		int updateCount = GBdao.updateReadCount(GB_NUM);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = GBdao.selectArticle(GB_NUM);
		close(con);
		return article;
		
	}

}
