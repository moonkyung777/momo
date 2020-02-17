<%@page import="vo.GBbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
GBbean article = (GBbean)request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
	<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
	<style type="text/css">
   #registForm{
      width: 500px;
      height: 600px;
      border : 1px solid red; 
      margin:auto; 
   }   
   h2{
      text-align: center;
   }
   table{
      margin:auto;
      width: 450px;
      }
   .td_left{
      width: 150px;
      background:orange;
   }
   .td_right{
      width: 300px;
      background:skyblue;
   }
   #commandCell{
      text-align: center;
      
   }
</style>
</head>
<body>
<!-- 게시판 등록 -->

<section id = "writeForm">
<h2>게시판글수정</h2>
<form action="boardModifyPro.bo" method="post" name = "modifyform"
>
<input type = "hidden" name = "GB_NUM" value = "<%=article.getGB_NUM()%>"/>
<table>
	<tr>
		<td class="td_left">
			<label for = "GB_ID">글쓴이</label>
		</td>
		<td class="td_right">
			<input type = "text" name="GB_ID" id = "GB_ID" value = "<%=article.getGB_ID()%>"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "GB_ID">비밀번호</label>
		</td>
		<td class="td_right">
			<input name="GB_ID" type="password" id ="GB_ID"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "GB_SUBJECT">제 목</label>
		</td>
		<td class="td_right">
			<input name="GB_SUBJECT" type="text" id = "GB_SUBJECT" value = "<%=article.getGB_SUBJECT()%>"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "GB_CONTENTS">내 용</label>
		</td>
		<td>
			<textarea id = "GB_CONTENTS" name="GB_CONTENTS" cols="40" rows="15"><%=article.getGB_CONTENTS()%></textarea>
		</td>
	</tr>
</table>
	<section id = "commandCell">
			<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
	</section>
</form>
</section>
</body>
</html>