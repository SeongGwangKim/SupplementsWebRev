<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="SupplementsWeb.com.biz.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="SupplementsWeb.com.vo.*" %>
<%@ page import="SupplementsWeb.com.dao.*" %>
<%@ page import="java.io.File" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 건너오는 데이터를 UTF-8로 사용 -->
<jsp:useBean id="bbs" class="com.vo.BbsVo" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>3조 게시판 만들기 프로젝트</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID")!=null);{
	userID = (String) session.getAttribute("userID");
	}
	
 	BbsBiz bbsa = new BbsBiz();
	bbs.setBbsID(bbsa.getNewNext()); 
	
	String directory = application.getRealPath("/SupplementsWebRev13/WebContent/File1");
	
	File targetDir = new File(directory);
	if(!targetDir.exists()){
		targetDir.mkdirs();
	}
	
	int maxSize = 1024 * 1024 * 500;
	String encoding = "UTF-8";
	
	MultipartRequest multipartRequest
	= new MultipartRequest(request, directory, maxSize, encoding,
					new DefaultFileRenamePolicy());
	
	String fileName = multipartRequest.getOriginalFileName("file_name");
	String fileRealName = multipartRequest.getFilesystemName("file_name");
	
	String bbsTitle = multipartRequest.getParameter("bbsTitle");
	String bbsContent = multipartRequest.getParameter("bbsContent");
	bbs.setBbsTitle(bbsTitle);
	bbs.setBbsContent(bbsContent);
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login'");
		script.println("</script>");
	}
	if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else{
	BbsBiz bbsBiz = new BbsBiz();
	int result = bbsBiz.insertBbs(bbs.getBbsTitle(), userID, bbs.getBbsContent(),1);
	
	
	
	
	
	FileBiz fileBiz=new FileBiz();
	fileBiz.InsertFile(fileName, fileRealName, userID);
	out.write("filename : " + fileName + "<br>");
	out.write("realfilename : " + fileName + "<br>");
	System.out.println(fileName);
	System.out.println(fileRealName);
	System.out.println(userID);

	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} 
	else {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'bbs'");
		script.println("</script>");

	}
	}
	
	%>
</body>
</html>