<%@page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>
<%!
 //String Ÿ���� �����ϴ� getParam()�޼ҵ带 ����
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
 int filecounter=0;  //����ڰ� �Է��� ���ϰ����� ����� 
 if(request.getParameter("addcnt")!=null){
  filecounter=Integer.parseInt(request.getParameter("addcnt"));
 }
%>
<html>
<head>
<title>�������� ������ ���ε��ϴ� ����</title>
<script language="javascript">
 function inputValue(form1,param,form2,idx){
  var paramValue=form1.elements[idx].value; //frmName1��  user�� �Էµ� ���� paramValue ������ �ִ´�
  form2.elements[idx].value=paramValue; //paramValue�� ����� ���� frmName2�� hidden �Ӽ����� ������ txtUser�� �ִ´�
  return;
 }
function addFile(formName){
 if(formName.addcnt.value==""){
  alert("�Է��� ���� ������ �Է��ϰ� Ȯ�� ���߸� �����ּ���");
  formName.addcnt.focus();
  return;
 }
 formName.submit();
 }
 //���� ���úκп� �ƹ��� ���� �Էµ��� �ʾ����� ������ �����϶�� �޼����� 
 //�޼��� ǥ��â��ǥ��,���� ���ö��� ������ �Ǿ��� ���� ���ڷ� ���� ���� �����ϰ� �ȴ� 
 function elementCheck(formName){
  paramIndex =1;
   for(idx=0;idx<formName.elements.length;idx++){
    if(formName.elements[idx].type =="file"){
     if(formName.elements[idx].value==""){
      var message= paramIndex+"��° ���� ������ �����ϴ�.\n���ε��� ������ ������ �ּ���";
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
  <h2>�������� ������ ���ε��ϴ� ����</h2>
  <font size="2">���ϰ����� �Է����� [Ȯ��]���߸� �����ּ���<br>
  �Է��� �Ϸ�Ǹ� ���Ͼ��ε带 ����[���ε�]���߸� �����ּ���</font><br>
   <form name="frmName1" method="post"> <!-- ����� �Է� �޴� ��  -->
     <table width="50%" border="1" align="center" cellpadding="1" cellspacing="1">
       <tr>
         <td colspan="4" align="center">���ε��� ���ϼ� �Է�
         <input type="Text" name="addcnt">
         <input type="button" value="Ȯ��" onclick="addFile(this.form)"></td>
       </tr>
</table>
</form>

<form name="frmName2" method="post" enctype="multipart/form-data" action=""><!--���� ���ε带 ���� ���������� �Է¹޴´�-->
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
<input type="Button" value="���ε�" onclick="elementCheck(this.form)"></td>
</tr>
</table>
</form>
</body>
</html>


