package svc;

import java.sql.Connection;
import dao.GBDAO;
import vo.GBbean;
import static db.JdbcUtil.*;
public class galWriteProService {

	public boolean registArticle(GBbean GBbean) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		GBDAO GBdao = GBDAO.getInstance();
		GBdao.setConnection(con);
		
		int insertCount = GBdao.insertArticle(GBbean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
