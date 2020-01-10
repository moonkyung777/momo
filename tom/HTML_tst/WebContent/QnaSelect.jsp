<%@page import="java.util.ArrayList"%>
<%@page import="qnaPack.QnaDao"%>
<%@page import="qnaPack.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="qdtt" class="qnaPack.QnaDao" />
<table class="table table-striped">
							<thead>
								<tr id="tabletitle">
									<th scope="col" class="thno"><span> No </span></th>
									<th scope="col" class="thtitle" style="text-align: center"><span> 제목 </span></th>
									<th scope="col" class="thname"><span> 작성자 </span></th>
									<th scope="col" class="thdate"><span> 작성일 </span></th>
									<th scope="col" class="thview"><span> 조회 </span></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="thgongji">580</td>
									<td class="thtitle">
										<a href>풋살장 구장 등록은 사업자번호가 필요한가요?</a><img src="img/lock2.png" class="secretimg">
									</td>
									<td class="thname">박**</td>
									<td class="thdate">2019. 12. 10</td>
									<td class="thview">5</td>
								</tr>
								<tr>
									<td class="thgongji">579</td>
									<td class="thtitle">
										<img src="img/re.png" class="reimg"><a href>풋살장 구장 등록은 사업자번호가 필요한가요?</a><img src="img/lock2.png" class="secretimg">
									</td>
									<td class="thname">김 팡 호</td>
									<td class="thdate">2019. 12. 10</td>
									<td class="thview">1</td>
								</tr>
								<tr>
									<td class="thgongji">578</td>
									<td class="thtitle">
										<a href> 환불하고 싶은데 계좌명이 다르다고 떠요.</a>
									</td>
									<td class="thname">이**</td>
									<td class="thdate">2019. 12. 08</td>
									<td class="thview">55</td>
								</tr>
								<tr>
									<td class="thgongji">577</td>
									<td class="thtitle">
										<img src="img/re.png" class="reimg"><a href> 환불하고 싶은데 계좌명이 다르다고 떠요.</a>
									</td>
									<td class="thname">김 팡 호</td>
									<td class="thdate">2019. 12. 05</td>
									<td class="thview">578</td>
								</tr>
								<tr>
									<td class="thgongji">576</td>
									<td class="thtitle">
										<a href>리그 등록을 하고싶은데 계속 없는 팀이라고 뜨네요?</a><img src="img/lock2.png" class="secretimg">
									</td>
									<td class="thname">정**</td>
									<td class="thdate">2019. 12. 02</td>
									<td class="thview">5</td>
								</tr>
								<tr>
									<td class="thgongji">575</td>
									<td class="thtitle">
										<img src="img/re.png" class="reimg"><a href>리그 등록을 하고싶은데 계속 없는 팀이라고 뜨네요?</a><img src="img/lock2.png" class="secretimg">
									</td>
									<td class="thname">김 팡 호</td>
									<td class="thdate">2019. 12. 03</td>
									<td class="thview">2</td>
								</tr>
								<tr>
									<td class="thgongji">578</td>
									<td class="thtitle">
										<a href> 환불하고 싶은데 계좌명이 다르다고 떠요.</a>
									</td>
									<td class="thname">이**</td>
									<td class="thdate">2019. 12. 08</td>
									<td class="thview">55</td>
								</tr>
								<tr>
									<td class="thgongji">577</td>
									<td class="thtitle">
										<img src="img/re.png" class="reimg"><a href> 환불하고 싶은데 계좌명이 다르다고 떠요.</a>
									</td>
									<td class="thname">김 팡 호</td>
									<td class="thdate">2019. 12. 05</td>
									<td class="thview">578</td>
								</tr>
								<tr>
									<td class="thgongji">576</td>
									<td class="thtitle">
										<a href>리그 등록을 하고싶은데 계속 없는 팀이라고 뜨네요?</a><img src="img/lock2.png" class="secretimg">
									</td>
									<td class="thname">정**</td>
									<td class="thdate">2019. 12. 02</td>
									<td class="thview">5</td>
								</tr>
								<tr>
									<td class="thgongji">575</td>
									<td class="thtitle">
				<img src="img/re.png" class="reimg"><a href>리그 등록을 하고싶은데 계속 없는 팀이라고 뜨네요?</a><img src="img/lock2.png" class="secretimg">
									</td>
									<td class="thname">김 팡 호</td>
									<td class="thdate">2019. 12. 03</td>
									<td class="thview">2</td>
								</tr>
								<tr>
								</tr>
							</tbody>
						</table>

























<table border="1"style="text-align:center;">
	<thead><tr><td>getqMember</td><td>getqSecret</td><td>getqSecretNum</td><td>getqContents</td><td>getqTitle</td></tr></thead>
	<tbody>
<%
	ArrayList<QnaDto> qda = qdtt.select();
	for (int i = 0; i < qda.size(); i++) {%>
<tr><td>
		<%out.println(qda.get(i).getqMember());%></td>
		<td>
		<%out.println(qda.get(i).getqSecret());%></td>
		<td>
		<%out.println(qda.get(i).getqSecretNum());%></td>
		<td>
		<%out.println(qda.get(i).getqContents());%></td>
		<td>
		<%out.println(qda.get(i).getqTitle());%></td>
		</tr>
	</tbody>
	
	<%}%>




