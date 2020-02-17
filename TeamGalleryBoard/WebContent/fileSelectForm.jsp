<%@page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>
<%!
 //String 타입을 리턴하는 getParam()메소드를 정의
 public String getParam(HttpServletRequest request,String paramName){
  if(request.getParameter(paramName)!=null){
   return request.getParameter(paramName);
  }else{
   return"";
  }
 }
%>
<%
 request.setCharacterEncoding("euc-kr");
 int filecounter=0;  //사용자가 입력한 파일개수가 저장됨 
 if(request.getParameter("addcnt")!=null){
  filecounter=Integer.parseInt(request.getParameter("addcnt"));
 }
%>
<html>
<head>
<title>여러개의 파일을 업로드하는 예제</title>
<script language="javascript">
 function inputValue(form1,param,form2,idx){
  var paramValue=form1.elements[idx].value; //frmName1의  user에 입력된 값을 paramValue 변수에 넣는다
  form2.elements[idx].value=paramValue; //paramValue에 저장된 값을 frmName2의 hidden 속성으로 지정된 txtUser에 넣는다
  return;
 }
function addFile(formName){
 if(formName.addcnt.value==""){
  alert("입력할 파일 갯수를 입력하고 확인 단추를 눌러주세요");
  formName.addcnt.focus();
  return;
 }
 formName.submit();
 }
 //파일 선택부분에 아무런 값이 입력되지 않았을때 파일을 선택하라는 메세지를 
 //메세지 표시창에표시,파일 선택란이 선택이 되었을 때는 인자로 받은 폼을 전송하게 된다 
 function elementCheck(formName){
  paramIndex =1;
   for(idx=0;idx<formName.elements.length;idx++){
    if(formName.elements[idx].type =="file"){
     if(formName.elements[idx].value==""){
      var message= paramIndex+"번째 파일 정보가 없습니다.\n업로드할 파일을 선택해 주세요";
      alert(message);
      formName.elements[idx].focus();
      return;
     }
     paramIndex++;
    }
   }
   formName.action="fileSelectPro.jsp";
   formName.submit();
 }
 </script>
 </head>
 <body>
  <h2>여러개의 파일을 업로드하는 예제</h2>
  <font size="2">파일갯수를 입력한후 [확인]단추를 눌러주세요<br>
  입력이 완료되면 파일업로드를 위한[업로드]단추를 눌러주세요</font><br>
   <form name="frmName1" method="post"> <!-- 사용자 입력 받는 폼  -->
     <table width="50%" border="1" align="center" cellpadding="1" cellspacing="1">
       <tr>
         <td colspan="4" align="center">업로드할 파일수 입력
         <input type="Text" name="addcnt">
         <input type="button" value="확인" onclick="addFile(this.form)"></td>
       </tr>
</table>
</form>

<form name="frmName2" method="post" enctype="multipart/form-data" action=""><!--파일 업로드를 위한 파일정보를 입력받는다-->
 <table width="50%" border="1" align="center" cellpadding="1" celspacing="1">
   <tr>
     <td width="40%" align="center">
     <input type="hidden" name="txtUser" value="<%=getParam(request,"user")%>">
     <input type="hidden" name="txtTitle" value="<%=getParam(request,"title")%>">
     <input type="hidden" name="txtAbstract" value="<%=getParam(request,"abstract")%>">
<%
 for(int i=0; i<filecounter; i++){ 
%>
 <input type="File" size="50" name="selectFile<%=i%>" multiple="multiple"><br>
<%
 }
%>
<input type="Button" value="업로드" onclick="elementCheck(this.form)"></td>
</tr>
</table>
</form>
</body>
</html>


