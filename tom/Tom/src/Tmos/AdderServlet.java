import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AdderServlet extends  HttpServlet
{
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String[] movie = request.getParameterValues("bo");
		
		
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<html><head><style> body{background-color: #5878F3;}</style> <title>선택한 영화 출력</title></head>");
		out.println("<body>");
		for(int i=0; i<movie.length; i++){
			out.println("<img src='img/"+movie[i]+".jpg' width='200' height='400' border-style: solid; border-color: white; />");
		}
		//out.printf("%d+%d=%d",num1, num2, sum);
		out.println("</body></html>");
	}
}
