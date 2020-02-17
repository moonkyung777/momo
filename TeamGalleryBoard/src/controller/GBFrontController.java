package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.galDeleteProAction;
import action.galDetailAction;
import action.galListAction;
import action.galModifyFormAction;
import action.galModifyProAction;
import action.galReplyFormAction;
import action.galReplyProAction;
import action.galWriteProAction;
import vo.ActionForward;

@WebServlet("*.bo")

public class GBFrontController extends javax.servlet.http.HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/galWriteForm.bo")){
			forward=new ActionForward();
			forward.setPath("/gal_board_write.jsp");
		}else if(command.equals("/galWritePro.bo")){
			action  = new galWriteProAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/galList.bo")){
			action = new galListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/galDetail.bo")){
			action = new galDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/galReplyForm.bo")){
			action = new galReplyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/galReplyPro.bo")){
			action = new galReplyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/galModifyForm.bo")){
			action = new galModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/galModifyPro.bo")){
			action = new galModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/galDeleteForm.bo")){
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
			request.setAttribute("GB_NUM",GB_NUM);
			forward=new ActionForward();
			forward.setPath("/gal_board_delete.jsp");
		}
		else if(command.equals("/galDeletePro.bo")){
			action = new galDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   

}
