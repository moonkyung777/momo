package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardReplyProService;
import vo.ActionForward;
import vo.GBbean;

public class BoardReplyProAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 
		 	ActionForward forward = null;
		    String nowPage = request.getParameter("page");
		    GBbean article = new GBbean();  		
		 	article.setGB_NUM(Integer.parseInt(request.getParameter("GB_NUM")));
		 	article.setGB_ID(request.getParameter("GB_ID"));
		// 	article.setBOARD_PASS(request.getParameter("BOARD_PASS"));
		 	article.setGB_SUBJECT(request.getParameter("GB_SUBJECT"));
		 	article.setGB_CONTENTS(request.getParameter("GB_CONTENTS"));
		 	article.setGB_RE_REF(Integer.parseInt(request.getParameter("GB_RE_REF")));
		 	article.setGB_RE_LEV(Integer.parseInt(request.getParameter("GB_RE_LEV")));
		 	article.setGB_RE_SEQ(Integer.parseInt(request.getParameter("GB_RE_SEQ")));	   		
		 	BoardReplyProService boardReplyProService = new BoardReplyProService();
		 	boolean isReplySuccess = boardReplyProService.replyArticle(article);
		 	
	   		if(isReplySuccess){
	   			forward = new ActionForward();
	   			forward.setRedirect(true);
	   			forward.setPath("galList.bo?page=" + nowPage);
	   		}
	   		else{
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('답장실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
	   		}
	   		
	   		return forward;
	   		
	}  	
	 
}