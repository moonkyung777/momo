package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.GBbean;
import vo.G_BoardRepBean;

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {
		// TODO Auto-generated constructor stub
	}

	public static BoardDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//글의 개수 구하기.
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from galboard");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	//글 목록 보기.	
	public ArrayList<GBbean> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from galboard order by GB_RE_REF desc,GB_RE_SEQ asc limit ?,9";
		ArrayList<GBbean> articleList = new ArrayList<GBbean>();
		GBbean board = null;
		int startrow=(page-1)*10; //읽기 시작할 row 번호..	

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new GBbean();
				board.setGB_NUM(rs.getInt("GB_NUM"));
				//board.setGB_ID(rs.getString("GB_ID"));
				board.setGB_SUBJECT(rs.getString("GB_SUBJECT"));
				board.setGB_CONTENTS(rs.getString("GB_CONTENTS"));
				board.setGB_FILE(rs.getString("GB_FILE"));
				board.setGB_RE_REF(rs.getInt("GB_RE_REF"));
				board.setGB_RE_LEV(rs.getInt("GB_RE_LEV"));
				board.setGB_RE_SEQ(rs.getInt("GB_RE_SEQ"));
				board.setGB_READCOUNT(rs.getInt("GB_READCOUNT"));
				board.setGB_DATE(rs.getDate("GB_DATE"));
				articleList.add(board);
			}

		}catch(Exception ex){
			System.out.println("ex");
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	//글 내용 보기.
	public GBbean selectArticle(int GB_NUM){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GBbean boardBean = null;

		try{
			pstmt = con.prepareStatement(
					"select * from galboard where GB_NUM = ?");
			pstmt.setInt(1, GB_NUM);
			rs= pstmt.executeQuery();

			if(rs.next()){
				boardBean = new GBbean();
				boardBean.setGB_NUM(rs.getInt("GB_NUM"));
				boardBean.setGB_ID(rs.getString("GB_ID"));
				boardBean.setGB_SUBJECT(rs.getString("GB_SUBJECT"));
				boardBean.setGB_CONTENTS(rs.getString("GB_CONTENTS"));
				boardBean.setGB_FILE(rs.getString("GB_FILE"));
				boardBean.setGB_RE_REF(rs.getInt("GB_RE_REF"));
				boardBean.setGB_RE_LEV(rs.getInt("GB_RE_LEV"));
				boardBean.setGB_RE_SEQ(rs.getInt("GB_RE_SEQ"));
				boardBean.setGB_READCOUNT(rs.getInt("GB_READCOUNT"));
				boardBean.setGB_DATE(rs.getDate("GB_DATE"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}

	//글 등록.
	public int insertArticle(GBbean article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(GB_NUM) from galboard");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;
			sql="insert into galboard (GB_NUM,GB_ID,GB_SUBJECT,";
			sql+="GB_CONTENTS, GB_FILE, GB_RE_REF,"+
					"GB_RE_LEV,GB_RE_SEQ,GB_READCOUNT,"+
					"GB_DATE) values(?,?,?,?,?,?,?,?,?now())";
			System.out.println("dfsdf");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getGB_ID());
			//pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(3, article.getGB_SUBJECT());
			pstmt.setString(4, article.getGB_CONTENTS());
			pstmt.setString(5, article.getGB_FILE());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println(pstmt);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 답변.
	public int insertReplyArticle(GBbean article){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql="select max(GB_NUM) from galboard";
		String sql="";
		int num=0;
		int insertCount=0;
		int re_ref=article.getGB_RE_REF();
		int re_lev=article.getGB_RE_LEV();
		int re_seq=article.getGB_RE_SEQ();

		try{
			pstmt=con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num =rs.getInt(1)+1;
			else num=1;
			sql="update galboard set GB_RE_SEQ=GB_RE_SEQ+1 where GB_RE_REF=? ";
			sql+="and GB_RE_SEQ>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,re_ref);
			pstmt.setInt(2,re_seq);
			int updateCount=pstmt.executeUpdate();

			if(updateCount > 0){
				commit(con);
			}

			re_seq = re_seq + 1;
			re_lev = re_lev+1;
			sql="insert into galboard (GB_NUM,GB_ID,GB_SUBJECT,";
			sql+="GB_CONTENTS, GB_FILE,GB_RE_REF,GB_RE_LEV,GB_RE_SEQ,";
			sql+="GB_READCOUNT,GB_DATE) values(?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getGB_ID());
			//pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(3, article.getGB_SUBJECT());
			pstmt.setString(4, article.getGB_CONTENTS());
			pstmt.setString(5, ""); //답장에는 파일을 업로드하지 않음.
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			pstmt.setInt(9, 0);
			System.out.println(pstmt);
			insertCount = pstmt.executeUpdate();
			System.out.println(333333);
		}catch(SQLException ex){
			
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 수정.
	public int updateArticle(GBbean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update galboard set GB_SUBJECT=?,GB_CONTENTS=? where GB_NUM=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getGB_SUBJECT());
			pstmt.setString(2, article.getGB_CONTENTS());
			pstmt.setInt(3, article.getGB_NUM());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//글 삭제.
	public int deleteArticle(int GB_NUM){

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from galboard where GB_NUM=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, GB_NUM);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.print(ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}

	//조회수 업데이트.
	public int updateReadCount(int GB_NUM){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update galboard set GB_READCOUNT = "+
				"GB_READCOUNT+1 where GB_NUM = "+GB_NUM;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

	//글쓴이인지 확인.
	public boolean isArticleBoardWriter(int GB_NUM,String GB_ID){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql="select * from galboard where GB_NUM=?";
		boolean isWriter = false;

		try{
			pstmt=con.prepareStatement(board_sql);
			pstmt.setInt(1, GB_NUM);
			rs=pstmt.executeQuery();
			rs.next();

			if(GB_ID.equals(rs.getString("GB_ID"))){
				isWriter = true;
			}
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);
		}

		return isWriter;

	}
	
	public int G_RepinsertArticle(G_BoardRepBean article){
		System.out.println("G_RepinsertArticle(G_BoardRepBean article)");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;
		
		
		try{
			pstmt=con.prepareStatement("select max(GB_Rep_NUM) from galrep");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into galrep (GB_REP_CONTENTS,GB_NUM,";
			sql+="GB_REP_NUM, GB_ID, GB_REP_DATE"+
					") values(?,?,?,?,now())";
			System.out.println(11);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getGB_REP_CONTENTS());
			pstmt.setInt(2, article.getGB_NUM());
			System.out.println(22);
			pstmt.setInt(3, num);
			pstmt.setString(4, article.getGB_ID());
			
			System.out.println(pstmt);
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	public ArrayList<G_BoardRepBean> selectArticleRepList(int num){
		System.out.println("selectArticleRepList(int num) ");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from galrep where GB_NUM =? order by GB_REP_DATE desc";
		ArrayList<G_BoardRepBean> articleList = new ArrayList<G_BoardRepBean>();
		G_BoardRepBean board = null;
		
		
		try{
			
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, num);
			
			
			
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new G_BoardRepBean();
				board.setGB_ID(rs.getString("GB_ID"));
				board.setGB_NUM(num);
				board.setGB_REP_CONTENTS(rs.getString("GB_REP_CONTENTS"));
				board.setGB_REP_DATE(rs.getDate("GB_REP_DATE"));
				board.setGB_REP_NUM(rs.getInt("GB_REP_NUM"));
				

				articleList.add(board);
				
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

}
