package Tmos;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HundredServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException

	{
		int total =0;
		for(int cnt=1;cnt<101;cnt++)
			total += cnt;
		resp.setContentType("text/html; chareset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head><title>1부터 100까지 더하는 서블릿</title><head>");
		out.println("<body>");
		out.printf("<1부터 100까지 합은=%d>",total);
		out.println("</body></html>");
	}

}

