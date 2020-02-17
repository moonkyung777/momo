package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerServlet extends HttpServlet {
	// web.xml ���� *do ����
	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		Cominterface inter = null;
		String viewName = "";

		try {
			if (command.equals("idcheck")) { // parameter������ index.html���� �Ѿ�°�
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				inter = ConfirmIdService.instance();
				String count = inter.showData(request, response);
				String id = request.getParameter("id");
				if (count.equals("123")) {
					out.println(id + "��(��) �̹� ������� ID�Դϴ�");
				} else {
					out.println(id + "��(��)����� �� �ִ�  ID�Դϴ�");
				}

			} else if (command.equals("signinput")) { //
				inter = SigninsertService.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);// getRequestDispatcher = ()�ȿ��ִ� �ּҷ�
																					// ������
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
			else if(command.equals("signdel")){//���� ��Ʈ�ѷ� �߰�
				System.out.println("��Ʈ�ѷ�����");
				inter = SignDel.instance();
				viewName = inter.showData(request, response);
				PrintWriter out=response.getWriter();
				int check=(int) request.getAttribute("check");
				System.out.println(check);
				if(check==0) {
					
					out.println("<script>alert('��й�ȣ�� Ȯ�����ּ���.')</script>");
				}else {
					out.println("<script>alert('������ �Ϸ�Ǿ����ϴ�.')</script>");
				}
			}
			else if (command.equals("loginbutton")) {
				response.setContentType("text/html;charset=UTF-8"); // �޾ƿ� ��Ʈ���� �ٱ��� ���ڷ� ����
				PrintWriter out = response.getWriter();
				inter = LoginService.instance();
				viewName = inter.showData(request, response);
				int check = (int) request.getAttribute("check");
				if (check == 0) {
					out.println("<script>alert('���̵� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');</script>");
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