package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import vo.GBbean;
import dao.BoardDAO;

public class BoardModifyProService {

	public boolean isArticleWriter(int GB_NUM, String GB_ID) throws Exception {
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleBoardWriter(GB_NUM, GB_ID);
		close(con);
		return isArticleWriter;
		
	}

	public boolean modifyArticle(GBbean article) throws Exception {
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
