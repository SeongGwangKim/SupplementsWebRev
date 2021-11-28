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
<jsp:useBean id="bbs2" class="com.vo.BbsVo2" scope="page" />
<jsp:setProperty name="bbs2" property="bbsTitle" />
<jsp:setProperty name="bbs2" property="bbsContent" />



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
	
 	BbsBiz2 bbsa = new BbsBiz2();
	bbs2.setBbsID(bbsa.getNewNext2()); 
	
	String directory2 = application.getRealPath("/SupplementsWebRev13/WebContent/File2");
	
	File targetDir2 = new File(directory2);
	if(!targetDir2.exists()){
		targetDir2.mkdirs();
	}
	
	int maxSize2 = 1024 * 1024 * 500;
	String encoding2 = "UTF-8";
	
	MultipartRequest multipartRequest
	= new MultipartRequest(request, directory2, maxSize2, encoding2,
					new DefaultFileRenamePolicy());
	
	String fileName = multipartRequest.getOriginalFileName("file_name2");
	String fileRealName = multipartRequest.getFilesystemName("file_name2");
	
	String bbsTitle = multipartRequest.getParameter("bbsTitle");
	String bbsContent = multipartRequest.getParameter("bbsContent");
	bbs2.setBbsTitle(bbsTitle);
	bbs2.setBbsContent(bbsContent);
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login'");
		script.println("</script>");
	}
	if (bbs2.getBbsTitle() == null || bbs2.getBbsContent() == null ) {
		System.out.println("난 타이틀이야" + bbs2.getBbsTitle());
		System.out.println("난 컨텐츠야" + bbs2.getBbsContent());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else{
	BbsBiz2 bbsBiz = new BbsBiz2();
	int result = bbsBiz.insertBbs(bbs2.getBbsTitle(), userID, bbs2.getBbsContent(),1);
	
	

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
		script.println("location.href = 'bbs2'");
		script.println("</script>");

	}
	}
	
	%>
</body>
</html>