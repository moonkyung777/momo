import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class AdderServlet1 extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletRequest response) throws IOException {

		String str1=request.getParameter("NUM1");
		String str2=request.getParameter("NUM2");
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(str2);
		int sum = num1 +num2;
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>���� ���α׷�</title></head>");
		out.println("<bady>");
		out.printf("%d+%d=%d",num1,num2,sum);
		out.println("</bady></html>");
	}

}
