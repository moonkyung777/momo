<%@page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>

<%@page import="java.io.*"%>

<%// fileName 과 upload만 교체해주면 다운로드가능해짐 
 String filename=request.getParameter("fileName");
 //한글파일이 깨지는 경우를 대비하여 .getBytes euc-kr 로 인코딩
 String saveFolder="upload";
 ServletContext context=getServletContext();
 String filePath=context.getRealPath(saveFolder);
 
 //import java.io.*에서 불러오는 입출력객체
 InputStream in=null;
 BufferedOutputStream os=null;
 File file=null;//파일을 열수있는 권리를얻음  File이라는 객체를 사용
 //File viewFile= null;
 boolean skip= false;
 
 String client="";
   try{
    try{
     file= new File(filePath,filename);
     out.print("file:"+file);
     in = new FileInputStream(file);//File을열고 읽어드림
    }catch(FileNotFoundException fe){
     skip=true;
    }//catch
    response.reset();
    //브라우져의 헤드를 다운로드에 접합하게 Client의 헤더를 변환해줌 
    client = request.getHeader("User-Agent");
    response.setContentType("application/x-msdownload");
    response.setHeader("Content-Description","JSP Generated Data");
    
    if(!skip){//skip이 false면~
     if(client.indexOf("MSIE 5.5")!=-1){//익스 플로우 버전확인 indexOf (5.5이면)헤더설정 
      response.setHeader("Content-Type","doesn/matter;charset=euc-kr");
      response.setHeader("Content-Disposition","filename="+new String(filename.getBytes("euc-kr"),"8859_1"));
     }else{//아니라면 헤더설정
      response.setHeader("Content-Type","application/octet-stream;charset=euc-kr");
      response.setHeader("Content-Disposition","attachment;filename="+new String(filename.getBytes("euc-kr"),"8859_1"));
     }//esle end
     response.setHeader("Content-Transfer-Encoding","binary;");
     response.setHeader("Context-Length",""+file.length());
     response.setHeader("Pragma","no-cache;");
     response.setHeader("Expires","-1;");
     
     //출력부
     os=new
     BufferedOutputStream(response.getOutputStream());
     byte b[]=new byte[4096];
     int leng= 0;
     while((leng = in.read(b))>0){
      os.write(b,0,leng);
     }//while end
     os.flush();
    }else{//inputsteam으로 못읽어 드렸을때 
     out.println("<script language='javascript'>");
     out.println("alert('File Downloaging Fail !!');");
     out.println("</script>");
     return;
    }//else
   }catch(Exception e){
    System.out.println(e);
   }finally{// 읽기 또는 실패 했을시 헤더를  정리 
    if(in !=null)in.close();
      if(os !=null){
       os.close();
       out.clear();
       out = pageContext.pushBody();
    }
   }//finally
%>

