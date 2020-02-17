package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.GBbean;
import vo.G_BoardRepBean;

 public class BoardDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		 System.out.println("BoardDetailAction.java");
		int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
		String page = request.getParameter("page");
		BoardDetailService boardDetailService = new BoardDetailService();
		GBbean article = boardDetailService.getArticle(GB_NUM);
		ArrayList<G_BoardRepBean> articlelist = boardDetailService.getArticleRep(GB_NUM);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
	   	request.setAttribute("articlelist", articlelist);
   		forward.setPath("/gal_board_view.jsp");
   		return forward;

	 }
	 
}