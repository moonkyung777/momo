<%@page import="java.util.ArrayList"%>
<%@page import="qnaPack.QnaDao"%>
<%@page import="qnaPack.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="qdtt" class="qnaPack.QnaDao"/>

<%
 // String qNo = request.getParameter("id");
  String qMember = request.getParameter("qnaid"); //입력값
  String qSecret = request.getParameter("secret");
  String qSecretNum = request.getParameter("qnapw");
//  String qDate = request.getParameter("secret");
//  String qCount = request.getParameter("hp3");
  String qContents = request.getParameter("qContents");
  String qTitle = request.getParameter("qTitle");
//  String qEmail = request.getParameter("gender");
   
   
	QnaDto qdt = new QnaDto();
	
	qdt.setqMember(qMember);
	qdt.setqSecret(qSecret);
	qdt.setqSecretNum(qSecretNum);
	qdt.setqContents(qContents);
	qdt.setqTitle(qTitle);
	
	qdtt.Qna_insert(qdt);
	response.sendRedirect("qna.jsp");

  

%>