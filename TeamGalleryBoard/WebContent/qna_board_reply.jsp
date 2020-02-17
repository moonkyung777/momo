<%@page import="vo.GBbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
GBbean article=(GBbean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<script language="javascript">
	</script>
<style type="text/css">
#registForm {
	width: 500px;
	height: 610px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 300px;
	background: skyblue;
}

#commandCell {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 게시판 답변 -->


	<section id="writeForm">
		<h2>게시판글등록</h2>
		<form action="boardReplyPro.bo" method="post" name="boardform">
			<input type="hidden" name="page" value="<%=nowPage %>" /> <input
				type="hidden" name="GB_NUM" value="<%=article.getGB_NUM() %>">
			<input type="hidden" name="GB_RE_REF"
				value="<%=article.getGB_RE_REF() %>"> <input
				type="hidden" name="GB_RE_LEV"
				value="<%=article.getGB_RE_LEV() %>"> <input
				type="hidden" name="GB_RE_SEQ"
				value="<%=article.getGB_RE_SEQ() %>">
			<table>
			<tr>
					<td class="td_left"><label for="GB_ID">글쓴이</label></td>
					<td class="td_right"><input name="GB_ID" type="text"
						id="GB_ID" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="GB_SUBJECT">제 목</label></td>
					<td class="td_right"><input name="GB_SUBJECT" type="text"
						id="GB_SUBJECT" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="GB_CONTENTS">내 용</label></td>
					<td><textarea id="GB_CONTENTS" name="GB_CONTENTS"
							cols="40" rows="15"></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="답변글등록" />&nbsp;&nbsp; <input
					type="reset" value="다시작성" />
			</section>
		</form>
	</section>
</body>
</html>