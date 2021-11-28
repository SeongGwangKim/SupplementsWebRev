<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
<title>같이 섭취하면 좋지 않은 영양제┃SEMO</title>
</head>
<body>
	<!-- Navigation-->
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
                <div class="container px-5">
                    <a class="navbar-brand fw-bold fs-4" href="main" ><img src="image/favicon.png" style="width: 25px;" /> SEMO</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

	 	  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">영양제 소개</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="infoENS">현대인 필수 영양제</a></li>
									<li><a class="dropdown-item" href="infoCNS">증상별 영양제 추천</a></li>
									<li><a class="dropdown-item" href="infoNGNS">같이 섭취하면 좋지 않은 영양제</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link me-lg-3" href="bbs2">Q&A 게시판</a></li>
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

	<!--컨턴츠 -->
	<div class="container mb-5">
    <!-- Page Heading -->
    <h1 class="card-title text-center my-5 fw-bold fs-3">같이 섭취하면 좋지 않은 영양제 </h1>

    <!-- Project One -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="https://via.placeholder.com//600x200" alt="">
        </a>
      </div>
      <div class="col-md-5">
        <h3 class="card-title">1. 칼슘 / 마그네슘  + 철분</h3>
        <p>칼슘, 마그네슘과 철분은 체내에 흡수되는 통로가 동일하다. 따라서 칼슘/마그네슘과 철분은 "식사 전"에 철분을 "식사 후"에 칼슘 /마그네슘을 섭취하는 것을 권장한다.<br></p>
        <a class="btn btn-primary float-xl-end" href="#">더보기</a>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Two -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="https://via.placeholder.com/600x200" alt="">
        </a>
      </div>
      <div class="col-md-5">
        <h3 class="card-title">2. 오메가3 + 감마리놀레산</h3>
        <p>감마리놀레산에 오메가6 지방산이 들어가 있어 같이 복용하게 되면 오메가3의 효능이 감소하므로 같이 복용하지 않는 것을 권장한다.</p>
        <a class="btn btn-primary float-xl-end" href="#">더보기</a>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Three -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="https://via.placeholder.com/600x200" alt="">
        </a>
      </div>
      <div class="col-md-5">
        <h3 class="card-title">3. 항생제  + 유산균</h3>
        <p>항생제는 균을 죽이는 역할을 하기 때문에 균의 한 종류인 유산균과 함께 섭취하면 유산균이 죽는다. 따라서 따로 아침에 공복에 유산균을 섭취하고 식사 후에 항생제를 섭취하는 것을 권장한다.</p>
        <a class="btn btn-primary float-xl-end" href="#">더보기</a>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Four -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="https://via.placeholder.com/600x200" alt="">
        </a>
      </div>
      <div class="col-md-5">
        <h3 class="card-title">4. 비타민B1 + 타닌</h3>
        <p>비타민B1은 타닌과 만나면 흡수가 잘되지 않는다. 따라서 비타민B1을 먹을 때는 타닌이 포함된 종합 영양제를 피하는 것을 권장한다.</p>
        <a class="btn btn-primary float-xl-end" href="#">더보기</a>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Five -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="https://via.placeholder.com/600x200" alt="">
        </a>
      </div>
      <div class="col-md-5">
        <h3 class="card-title">5. 비타민A + 루테인</h3>
        <p>함량에 따라 다르지만, 비타민A와 루테인을 모두 고함량으로 섭취하면 비타민A 과잉 상태가 될 수 있다. 비타민A 과잉 상태가 되면 구토·두통·설사 증상이 나타날 수 있다. 루테인이 비타민A의 일종이기 때문이다. 이외에 레티놀과 베타카로틴도 비타민A의 역할을 하므로 주의해야 한다. </p>
        <a class="btn btn-primary float-xl-end" href="#">더보기</a>
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

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