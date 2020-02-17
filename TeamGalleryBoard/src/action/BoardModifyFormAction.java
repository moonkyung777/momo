package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.GBbean;

public class BoardModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
			BoardDetailService boardDetailService
			= new BoardDetailService();	
			GBbean article =boardDetailService.getArticle(GB_NUM);
		   	request.setAttribute("article", article);
	   		forward.setPath("/gal_board_modify.jsp");
	   		return forward;
	   		
	 }
	 
}