<%@page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>

<%@page import="java.io.*"%>

<%// fileName �� upload�� ��ü���ָ� �ٿ�ε尡������ 
 String filename=request.getParameter("fileName");
 //�ѱ������� ������ ��츦 ����Ͽ� .getBytes euc-kr �� ���ڵ�
 String saveFolder="upload";
 ServletContext context=getServletContext();
 String filePath=context.getRealPath(saveFolder);
 
 //import java.io.*���� �ҷ����� ����°�ü
 InputStream in=null;
 BufferedOutputStream os=null;
 File file=null;//������ �����ִ� �Ǹ�������  File�̶�� ��ü�� ���
 //File viewFile= null;
 boolean skip= false;
 
 String client="";
   try{
    try{
     file= new File(filePath,filename);
     out.print("file:"+file);
     in = new FileInputStream(file);//File������ �о�帲
    }catch(FileNotFoundException fe){
     skip=true;
    }//catch
    response.reset();
    //�������� ��带 �ٿ�ε忡 �����ϰ� Client�� ����� ��ȯ���� 
    client = request.getHeader("User-Agent");
    response.setContentType("application/x-msdownload");
    response.setHeader("Content-Description","JSP Generated Data");
    
    if(!skip){//skip�� false��~
     if(client.indexOf("MSIE 5.5")!=-1){//�ͽ� �÷ο� ����Ȯ�� indexOf (5.5�̸�)������� 
      response.setHeader("Content-Type","doesn/matter;charset=euc-kr");
      response.setHeader("Content-Disposition","filename="+new String(filename.getBytes("euc-kr"),"8859_1"));
     }else{//�ƴ϶�� �������
      response.setHeader("Content-Type","application/octet-stream;charset=euc-kr");
      response.setHeader("Content-Disposition","attachment;filename="+new String(filename.getBytes("euc-kr"),"8859_1"));
     }//esle end
     response.setHeader("Content-Transfer-Encoding","binary;");
     response.setHeader("Context-Length",""+file.length());
     response.setHeader("Pragma","no-cache;");
     response.setHeader("Expires","-1;");
     
     //��º�
     os=new
     BufferedOutputStream(response.getOutputStream());
     byte b[]=new byte[4096];
     int leng= 0;
     while((leng = in.read(b))>0){
      os.write(b,0,leng);
     }//while end
     os.flush();
    }else{//inputsteam���� ���о� ������� 
     out.println("<script language='javascript'>");
     out.println("alert('File Downloaging Fail !!');");
     out.println("</script>");
     return;
    }//else
   }catch(Exception e){
    System.out.println(e);
   }finally{// �б� �Ǵ� ���� ������ �����  ���� 
    if(in !=null)in.close();
      if(os !=null){
       os.close();
       out.clear();
       out = pageContext.pushBody();
    }
   }//finally
%>

