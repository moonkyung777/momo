package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerServlet extends HttpServlet {
	// web.xml 에서 *do 실행
	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		Cominterface inter = null;
		String viewName = "";

		try {
			if (command.equals("idcheck")) { // parameter값으로 index.html에서 넘어온것
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				inter = ConfirmIdService.instance();
				String count = inter.showData(request, response);
				String id = request.getParameter("id");
				if (count.equals("123")) {
					out.println(id + "는(은) 이미 사용중인 ID입니다");
				} else {
					out.println(id + "는(은)사용할 수 있는  ID입니다");
				}

			} else if (command.equals("signinput")) { //
				inter = SigninsertService.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);// getRequestDispatcher = ()안에있는 주소로
																					// 보낸다
			} else if (command.equals("mypage")) { //
				System.out.println("111");
				inter = SignImpl.instance();
				viewName = inter.showData(request, response);		
				request.getRequestDispatcher(viewName).forward(request, response);
			}	else if(command.equals("pwchange")){
				inter = PwModify.instance();
				inter.showData(request, response);
				//request.getRequestDispatcher("sangpum_insert.jsp").forward(request, response);
			}
			else if(command.equals("signdel")){//삭제 컨트롤러 추가
				System.out.println("컨트롤러진입");
				inter = SignDel.instance();
				viewName = inter.showData(request, response);
				PrintWriter out=response.getWriter();
				int check=(int) request.getAttribute("check");
				System.out.println(check);
				if(check==0) {
					
					out.println("<script>alert('비밀번호를 확인해주세요.')</script>");
				}else {
					out.println("<script>alert('삭제가 완료되었습니다.')</script>");
				}
			}
			else if (command.equals("loginbutton")) {
				response.setContentType("text/html;charset=UTF-8"); // 받아온 스트링을 다국어 글자로 변경
				PrintWriter out = response.getWriter();
				inter = LoginService.instance();
				viewName = inter.showData(request, response);
				int check = (int) request.getAttribute("check");
				if (check == 0) {
					out.println("<script>alert('아이디나 비밀번호가 일치하지 않습니다.');</script>");
				} else {
					out.println("ok");
				}
			} else {

				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			System.out.println("service err : " + e);
		}
	}
}
