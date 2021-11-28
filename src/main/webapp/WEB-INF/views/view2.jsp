<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import="com.vo.*"%>
<%@ page import="com.biz.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device",initial-scale="1">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- favicon -->
<link href="image/favicon.png" rel="shortcut icon">
<!-- CSS -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/custom.css">
<title>Q&A 게시판┃SEMO</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs'");
			script.println("</script>");

		}
		BbsVo2 bbsVo = new BbsBiz2().getBBSByID(bbsID);
		int viewNum= new BbsBiz2().getBBSView(bbsVo.getBbsID());

		// 저장된 쿠키 불러오기
		int visitor = 0;
		Cookie[] cookies2 = request.getCookies();
		String cookieValue = null;
		for(Cookie cookie : cookies2) {
			// 요청정보로부터 쿠키를 가져온다.
			if(cookie.getName().equals("visit2")){
				visitor = 1;


				if(cookie.getValue().contains(request.getParameter("bbsID"))){

				}else{

					cookie.setValue(cookie.getValue() + "_" +request.getParameter("bbsID"));

					response.addCookie(cookie);

					int resView=new BbsBiz2().plusBbsView(bbsVo.getBbsID(), viewNum);

				}

			}
		}

		if(visitor == 0){

			Cookie cookie1 = new Cookie("visit2", request.getParameter("bbsID"));
			response.addCookie(cookie1);

			int resView=new BbsBiz2().plusBbsView(bbsVo.getBbsID(), viewNum);
		}

		ArrayList<BbsCommentVo2> CommentList= new BbsCommentBiz2().getAllComments(bbsVo.getBbsID());

	%>
 	<!-- Navigation-->
 	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
                <div class="container px-5">
                    <a class="navbar-brand fw-bold fs-4" href="main" ><img src="image/favicon.png" style="width: 25px;" /> SEMO</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

	 	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">영양제 소개</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="infoENS">현대인 필수 영양제</a></li>
									<li><a class="dropdown-item" href="infoCNS">증상별 영양제 추천</a></li>
									<li><a class="dropdown-item" href="infoNGNS">같이 섭취하면 좋지 않은 영양제</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link me-lg-3 active" href="bbs2">Q&A 게시판</a></li>
							<li class="nav-item"><a class="nav-link me-lg-3" href="bbs">후기 게시판</a></li>
							<li class="nav-item"><a class="nav-link me-lg-3" href="newsVideo">NEWS & VIDEO</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이 페이지</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                   	<li><a class="dropdown-item" href="myPage">회원 정보 수정</a></li>
								</ul>
							</li>
						</ul>
	<%
  		if(userID == null){
 	%>
		<ul class="navbar-nav ms-sm-5">
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle btn btn-primary fw-bold" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">접속하기</a>
				<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
					<li class="active"><a class="dropdown-item" href="login">로그인</a></li>
					<!-- active : 선택이 됨을 알려줌 -->
					<li><a class="dropdown-item" href="join">회원가입</a></li>
				</ul></li>
		</ul>
	<%
		} else {
	%>
		<ul class="navbar-nav ms-sm-5">
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle btn btn-primary" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="logoutAction">로그아웃</a></li>
				</ul></li>
		</ul>
	<%
		}
	%>
		</div>
		</div>
	</nav>

	<div class="container">
		<h1 class="card-title text-center my-5 fw-bold fs-3">Q&A 게시판</h1>
		<hr class="mt-2 mb-4">
		<div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="card-title" colspan="3">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="table-primary" style="width: 20%;">제목</td>
						<td class="table-secondary" colspan="2"><%= bbsVo.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td class="table-primary" style="width: 20%;">작성자</td>
						<td class="table-secondary" colspan="2"><%= bbsVo.getUserID() %></td>
					</tr>
					<tr>
						<td class="table-primary" style="width: 20%;">작성일</td>
						<td class="table-secondary" colspan="2"><%= bbsVo.getBbsDate().substring(0, 11) + bbsVo.getBbsDate().substring(11, 13) + "시" + bbsVo.getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<tr>
						<td class="table-primary" style="width: 20%;">첨부파일</td>
						<td class="table-secondary" colspan="2"><%= bbsVo.getUserID() %></td>
					</tr>
					<tr>
						<td class="table-primary" style="width: 20%;">내용</td>
						<td class="table-secondary" colspan="2"
							style="min-height: 200px; text-align: justify;"><%= bbsVo.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("\n", "<br>")%></td>
					</tr>
				</tbody>
			</table>
		</div>

				<a href="bbs2" class="btn btn-primary float-end">목록</a>
				<%
					if(userID != null && userID.equals(bbsVo.getUserID())){
				%>
				<a onClick="return confirm('정말로 수정하시겠습니까?')" href="find2?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
				<a onClick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction2?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
				<%
					}
				%>
		</div>

		<!-- 댓글 쓰기 -->
	<div class="container my-5 fw-bold fs-3">
		<div class="row">
			<p class="card-title text-center fw-bold fs-6"> 댓글 쓰기 </p>
			<form method="post" action="comment2" class="comment2">
			<input type="hidden" class="a" placeholder="게시글ID" name="bbsID" value="<%=bbsID%>">
			<input type="hidden" class="a" placeholder="유저ID" name="userID" value="<%=userID%>">
     		<textarea type="text" class="form-control mb-3" class="a" placeholder="댓글을 입력하세요" name="comment2" maxlength="100" rows="3"></textarea>
   			<input type="submit" class="btn btn-primary float-end" value="입력">
			</form>
		</div>
	</div>
	<%
		if (CommentList != null) {
	%>

	<!-- 댓글 보기 -->
	<div class="container">
	<div class="row">
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="card-title" colspan="4" >댓글 보기</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th class= "table-primary" style="width: 20%;">ID</th>
				<th class= "table-primary" style="width: 60%;">댓글 내용</th>
				<th class= "table-primary" style="width: 10%;">수정</th>
				<th class= "table-primary" style="width: 10%;">삭제</th>
			</tr>
				<%
						for (BbsCommentVo2 ar : CommentList) {
						out.print("<tr><td>" + ar.getUserID() + "</td>");
						out.print("<td>" + ar.getCommentText() + "</td>");
						if (ar.getUserID().equals(userID)) {
							out.print("<td> <a href =findComment2?no=" + ar.getCommentID() + "> 수정</a></td>");
							out.print("<td> <a href =deleteComment2?no=" + ar.getCommentID() + "> 삭제</a></td>");
						}
						out.print("</tr>");
					}
					}
					%>
					</tbody>
				</table>
			</div>
		</div>


		<!-- Footer-->
        <footer class="bg-white text-center py-5">
            <div class="container px-5">
                <div class="text-black-50 small">
                    <div class="mb-2">&copy; Supplements Web Site 2021.</div>
                    <a>TEAM MBTI: 김성광 │ 김상홍  │ 유정원  │ 이성재  │ 이정은  │ 장재성  │ 최현준  </a>
                </div>
            </div>
        </footer>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/bootstrap.js"></script>
		<script src="js/dropdown.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      	<!-- Darkmode JS -->
		<script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script>
		<script src="js/widget.js"></script>
    	<!-- Icon JS-->
   	 	<script src="https://kit.fontawesome.com/050483e6c4.js" crossorigin="anonymous"></script>
</body>
</html>