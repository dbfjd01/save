<%@page import="java.io.PrintWriter" %>
<%@page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"></jsp:setProperty>
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>
<jsp:setProperty name="user" property="userName"></jsp:setProperty>
<jsp:setProperty name="user" property="userGender"></jsp:setProperty>
<jsp:setProperty name="user" property="userEmail"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 시도</title>
</head>
<body>
<%
	//현재 세션상태 체크문
	String userID=null;
	if(session.getAttribute("userID")!= null){
		userID=(String)session.getAttribute("userID");
	}
	//이미 로그인 했으면 회원가입을 할수 없게 만들기
	if(userID !=null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("이미 로그인이 되어 있습니다.");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}

	if(user.getUserID()==null||user.getUserPassword()==null||user.getUserName()==null||user.getUserGender()==null||user.getUserEmail()==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("입력되지 않은 내용이 있습니다.");
		script.println("history.back()");
		script.println("</script>");
	}else{
		UserDAO userDAO=new UserDAO();
		int result=userDAO.join(user);
		if(result==-1){//입력값이-1이 대입되면 이미 존재한다고 뜨게 설정
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
		}else{
		session.setAttribute("userID",user.getUserID());
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입 성공')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		}
	}
%>
</body>
</html>