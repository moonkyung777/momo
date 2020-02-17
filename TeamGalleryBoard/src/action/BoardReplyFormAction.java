package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.GBbean;

public class BoardReplyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	ActionForward forward = new ActionForward();
	   		String nowPage = request.getParameter("page");
	   		int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
	   		BoardDetailService boardDetailService = new BoardDetailService();
	   		GBbean article=boardDetailService.getArticle(GB_NUM);	
	   		request.setAttribute("article", article);
	   		request.setAttribute("page", nowPage);
	   		forward.setPath("/gal_board_reply.jsp");
	   		return forward;
	   		
	}
	 
}