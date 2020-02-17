package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.GBbean;
import vo.G_BoardRepBean;

import static db.JdbcUtil.*;

public class BoardDetailService {

	public GBbean getArticle(int GB_NUM) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService.getArticle(int board_num)");
		GBbean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(GB_NUM);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = boardDAO.selectArticle(GB_NUM);
		close(con);
		return article;
		
	}
	public ArrayList<G_BoardRepBean> getArticleRep(int GB_NUM) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService.getArticleRep(int board_num)");
		ArrayList<G_BoardRepBean> articlerep = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		
		articlerep = boardDAO.selectArticleRepList(GB_NUM);
		close(con);
		return articlerep;
		
	}

}
