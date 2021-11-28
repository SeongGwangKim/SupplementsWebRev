<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<%@ page import="com.biz.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device" ,initial-scale="1">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- favicon -->
<link href="image/favicon.png" rel="shortcut icon">
<!-- CSS -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/custom.css">
<title>마이페이지┃SEMO</title>
</head>
<body>
	<!-- Navigation-->
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	//로그인 안한 경우
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login'");
		script.println("</script>");
	}
	UserBiz biz = new UserBiz();
	UserVo vo = biz.getUser(userID);
	%>
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
                            <li class="nav-item"><a class="nav-link me-lg-3" href="bbs2">Q & A 게시판</a></li>
							<li class="nav-item"><a class="nav-link me-lg-3" href="bbs">후기 게시판</a></li>
							<li class="nav-item"><a class="nav-link me-lg-3" href="newsVideo">NEWS & VIDEO</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이 페이지</a>
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
			<a class="nav-link dropdown-toggle btn btn-primary fw-bold" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
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

	<!-- 유저 정보 확인 -->
	<div class="container">
		<h1 class="card-title text-center my-5 fw-bold fs-3">내 정보 확인</h1>
		<hr class="mt-2 mb-4">
		<div class="row">
		<table class="table table-striped">
			<tr>
			<th class="table-primary" style="width: 20%;">아이디</th>
			<th class="table-primary" style="width: 20%;">이름</th>
			<th class="table-primary" style="width: 20%;">성별</th>
			<th class="table-primary" style="width: 20%;">Email</th>
			<th class="table-primary" style="width: 20%;">생년월일</th>
		</tr>
		<%

		    out.print("<tr><td>"+vo.getUserID()+"</td>");
			out.print("<td>"+vo.getUserName()+"</td>");
			out.print("<td>"+vo.getUserGender()+"</td>");
			out.print("<td>"+vo.getUserEmail()+"</td>");
			out.print("<td>"+vo.getUserBirth()+"</td>");
			out.print("</tr>");
		%>

		</table>
		</div>
		</div>

	 	<!--정보 수정-->
		<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div
					class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
					<div class="card-img-left d-none d-md-flex"></div>
					<div class="card-body p-4 p-sm-5">
						<h3 class="card-title text-center mb-5 fw-bold fs-3">내 정보 수정</h3>
						<!-- 비밀번호 변경 -->
							<div class="form-floating mb-3">
							<form method="post" action="updateUserPassword">
							<input type="hidden" name="no" maxlength="50" value="<%=vo.getUserID()%>"> 변경하고자 하는 비밀번호
							<input class="form-control mb-3" type="text" name="password" maxlength="50">

							<div class="d-grid mb-2">
							<button type="submit" class="btn btn-primary">비밀번호 변경</button>
							</div>
							</form>
							</div>

   							<div class="form-floating mb-3">
   							<form method="post" action="updateUserEmail">
							<input type="hidden" name="no" maxlength="50" value="<%=vo.getUserID()%>"> 변경하고자 하는 이메일
							<input class="form-control mb-3" type="text" name="email" maxlength="50">

							<div class="d-grid mb-2">
							<button type="submit" class="btn btn-primary float-end">이메일 변경</button>
							</div>
							</form>
							</div>

							<hr class="my-3">

							<form method="post" action="deleteUser">
							<input type="hidden" name="userID" maxlength="50" value="<%=vo.getUserID()%>">
							<button type="submit" class="btn btn-lg btn-google btn-login fw-bold float-end">계정 삭제</button>
							</form>
					</div>
				</div>
			</div>
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