<%@page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*"%>
<%@page import="java.net.*"%>
<%@page import="java.io.*"%>

<%
 String realPath="";
 String savePath="upload";
 String type="euc-kr";
 int maxSize=5*1024*1024;


ServletContext context=getServletContext();
realPath= context.getRealPath(savePath);
ArrayList saveFiles= new ArrayList();
ArrayList origFiles= new ArrayList();

String user="";
String title="";
String content="";

  try{
  MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,type,new DefaultFileRenamePolicy());
  
   user = multi.getParameter("txtUser");
   title = multi.getParameter("txtTitle");
   content = multi.getParameter("txtAbstract");
   
   Enumeration files = multi.getFileNames();
   while(files.hasMoreElements()){
    String name = (String)files.nextElement();
    saveFiles.add(multi.getFilesystemName(name));
    origFiles.add(multi.getOriginalFileName(name));
   }
%>
<html>
<head>
<title>여러개의 파일을 업로드하는 예제</title>
</head>
   <body>
     <table width="50%" border="1" align="center" cellpadding="1" cellspacing="1">
       <tr>
         <td width="15%" align="center"><strong>작성자</strong></td>
         <td width="35%"><%=user%></td>
       </tr>
       <tr>
         <td width="15%" align="center"><strong>제목</strong></td>
         <td width="35%"> <%=title%></td>
       </tr>
       <tr>
         <td width="15%" align="center"><strong>내용</strong></td>
         <td width="35%" colspan="3"><%=content%></td>
       </tr>
       <tr>
         <td colspan="4">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="4"><strong>업로드된 파일 리스트</strong></td>
       </tr>
<%
  for(int i=0; i<saveFiles.size();i++){
%>
  <tr>
    <td colspan="4">
<%   
   String y = (String)saveFiles.get(i);
     y = URLEncoder.encode(y,"euc-kr");
   //String x = request.getContextPath()+"/"+savePath+"/"+URLEncoder.encode(y,"UTF-8");
%>
   <%=i+1%>.<a href="filedown.jsp?fileName=<%=y%>"><strong><%=origFiles.get(i)%></strong></a></td>
  </tr>
<%} %>

      </table>
     </body>
    </html>
<%
 }catch(IOException ioe){
  System.out.println(ioe);
 }catch(Exception ex){
  System.out.println(ex);
 }

%>

