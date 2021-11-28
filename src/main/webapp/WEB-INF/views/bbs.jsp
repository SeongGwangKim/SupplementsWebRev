<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="com.biz.BbsBiz" %>
<%@ page import ="com.vo.BbsVo" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
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
<title>후기 게시판┃SEMO</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");

		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
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
                            <li class="nav-item"><a class="nav-link me-lg-3" href="bbs2">Q&A 게시판</a></li>
							<li class="nav-item"><a class="nav-link me-lg-3 active" href="bbs">후기 게시판</a></li>
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

	<!--후기 게시판 -->
	<!-- 후기 이미지 -->
	<div class="container">
		<h1 class="card-title text-center my-5 fw-bold fs-3">후기 게시판</h1>
		<hr class="mt-2 mb-4">
		<div class="row text-center text-lg-start">
			<div class="col-lg-3 col-md-4 col-6">
				<a class="d-block mb-4 h-100">
				<img class="img-fluid img-thumbnail" src="https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1176&q=80/400x300" alt="">
				</a>
			</div>

			<div class="col-lg-3 col-md-4 col-6">
				<a class="d-block mb-4 h-100">
				<img class="img-fluid img-thumbnail" src="https://images.unsplash.com/photo-1556155092-490a1ba16284?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80/400x300" alt="">
				</a>
			</div>

			<div class="col-lg-3 col-md-4 col-6">
				<a class="d-block mb-4 h-100">
				<img class="img-fluid img-thumbnail" src="https://images.unsplash.com/photo-1630852722075-0fd74c222ad8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80/400x300" alt="">
				</a>
			</div>

			<div class="col-lg-3 col-md-4 col-6">
				<a class="d-block mb-4 h-100">
				<img class="img-fluid img-thumbnail" src="https://images.unsplash.com/photo-1630673163701-a31ca55cb4b2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80/400x300" alt="">
				</a>
			</div>
		</div>
		<hr class="mt-2 mb-4">
	</div>

	<!-- 검색-->
		<div class="container offset-6">
		<div class="col-lg-6 mb-3">
			<div class="card-body">
				<form method="post" action="search">
					<div class="input-group">
						<select class="form-select" name="choice">
							<option value="title">제목별</option>
							<option value="userId">작성자별</option>
							<option value="content">내용별</option>
						</select>
						<input class="form-control" type="text" placeholder="내용을 적어주세요" name="searchText">
						<button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
					</div>
				</form>
			</div>
		</div>
		</div>

	<!-- 글목록 -->
		<div class="container">
		  <div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th class="table-style-3" style="width: 10%;">번호</th> -->
						<th class="table-primary text-center" style="width: 40%;">제목</th>
						<th class="table-primary text-center" style="width: 20%;">작성자</th>
						<th class="table-primary text-center" style="width: 20%;">작성일</th>
						<th class="table-primary text-center" style="width: 10%;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(request.getAttribute("searchAns") == null){
					BbsBiz bbsBiz = new BbsBiz();
					ArrayList<BbsVo> list = bbsBiz.getBBSByPage(pageNumber);
					for(int i = 0; i <list.size(); i++){
					%>
					<tr>
						<!-- <td><%= list.get(i).getBbsID() %></td> -->
						<td class="text-center"><a href="view?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td class="text-center"><%= list.get(i).getUserID() %></td>
						<td class="text-center"><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
						<td class="text-center"><%= list.get(i).getBbsView()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			</div>
				<%
					if(pageNumber != 1){
				%>
			<a href="bbs?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success float-start"><i class="fas fa-arrow-left"></i>  이전</a>
				<%
					} if(bbsBiz.isEmptyNextPageBBS(pageNumber)){
				%>
			<a href="bbs?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success float-start"><i class="fas fa-arrow-right"></i>  다음</a>

				<%
					}
					}else{
					BbsBiz bbsBiz = new BbsBiz();
					ArrayList<BbsVo> list = (ArrayList<BbsVo>)request.getAttribute("searchAns");
					for(int i = 0; i <list.size(); i++){
				%>
			<tr>
				<!-- <td><%= list.get(i).getBbsID() %></td>  -->
				<td><a href="view?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
				<td><%= list.get(i).getUserID() %></td>
				<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
				<td><%= list.get(i).getBbsView()%></td>
			</tr>
				<%
					}
				%>
			</tbody>
			</table>
				<%
					}
				%>
			<a href="write" class="btn btn-primary float-end"><i class="fas fa-pen"></i> 글쓰기</a>
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