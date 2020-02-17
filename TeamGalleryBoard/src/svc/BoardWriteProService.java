package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.GBbean;
import static db.JdbcUtil.*;
public class BoardWriteProService {

	public boolean registArticle(GBbean GBbean) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertArticle(GBbean);
		
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
