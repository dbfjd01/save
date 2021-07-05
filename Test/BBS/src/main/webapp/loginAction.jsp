<%@page import="java.io.PrintWriter" %>
<%@page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"></jsp:setProperty>
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 시도</title>
</head>
<body>
<%
	//현재 세션 상태 체크
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	//이미 로그인했다면 다시 로그인 불가능 하게 만들기
	if(userID != null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어 있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	
	UserDAO userDAO=new UserDAO();
	int result=userDAO.login(user.getUserID(), user.getUserPassword());
	if(result==1){
		session.setAttribute("userID", user.getUserID());
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if(result ==0){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result ==-1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result ==-2){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('오류입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>