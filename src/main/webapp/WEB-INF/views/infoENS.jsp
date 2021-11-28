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
<title>현대인 필수 영양제┃SEMO</title>
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
	<div class="container">
		<!-- Page Heading -->
		<h1 class="card-title text-center my-5 fw-bold fs-3"> 현대인 필수 영양제 </h1>
		<div class="row">
			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://images.unsplash.com/photo-1514995669114-6081e934b693?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80/700x400" alt="종합 영양제">
					<div class="card-body">
						<h4 class="card-title text-center">1. 종합 영양제</h4>
						<p class="card-text">채소와 과일에서 추출한 비타민, 미네랄을 농축해 만들었으며 피로 해소와 각종 질병 예방 등을 돕는다. 그러나 여러 성분을 골고루 집약해 담다 보니 특정 성분이 하루 권장량에 미치지 않을 수 있어 유의해야 한다.<br>
			 					예를 들어 종합영양제에 보통 칼슘이 40~160mg 들어 있지만, 성인 여성 하루 칼슘 권장량은 1,000~1,500mg이므로 칼슘을 추가로 복용해야 한다.<br>
								  비타민 D 결핍이 많은 노인들 역시 종합영양제만으로는 영양을 충분히 섭취하기 어렵다는 문제가 있기 때문에 확인이 필요하다.<br></p>
						<a class="btn btn-primary float-xl-end" href="https://kr.iherb.com/search?kw=%EC%A2%85%ED%95%A9%20%EC%98%81%EC%96%91%EC%A0%9C">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://images.unsplash.com/photo-1624362772755-4d5843e67047?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80/700x400" alt="오메가3">
					<div class="card-body">
						<h4 class="card-title text-center">2. 오메가-3</h4>
						<p class="card-text">생선이나 물범, 호박씨 등에서 추출되는 오메가-3 지방산은 신체의 대사 작용에 필수적인 영양소이지만 인체 내에서 합성되지 않아 반드시 음식이나 영양제 등으로 섭취해야 한다.<br>
			 					오메가-3를 구성하는 EPA와 DHA 성분은 콜레스테롤 수치를 떨어트리고 혈압, 당뇨 등에 효과가 있으며 뇌세포 기능을 증가시키는 데 도움을 준다.<br>
			 					 하루 최소 1,500mg 이상을 섭취해야 하기 때문에 제품 구입 시 중금속, 환경호르몬의 우려가 비교적 적은 소형 어류(정어리, 멸치 등)에서 추출한 제품인지, 고온에서 추출해 산화 위험이 있는 것은 아닌지 따져보는 것이 좋다.<br></p>
						<a class="btn btn-primary float-xl-end" href="https://kr.iherb.com/search?kw=%EC%98%A4%EB%A9%94%EA%B0%803">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://images.unsplash.com/photo-1610348718584-07f43528231d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80/700x400" alt="비타민D">
					<div class="card-body">
						<h4 class="card-title text-center">3. 비타민 D</h4>
						<p class="card-text">비타민 D는 골다공증 위험이 있는 갱년기 여성이나 피부 노화로 비타민 D를 잘 합성하지 못하는 노인에게 특히 강조되곤 한다.<br>
							 제품을 고를 때는 하루 권장 섭취량인 200~400IU를 충족하는지 확인해야 하는데, 체외 배출이 되지 않으므로 과잉 섭취는 금물이다.
							  또한 합성비타민은 흡수율이 떨어지고, 인체에 부정적인 영향을 줄 가능성이 제기됐으므로 천연 원료로 만든 제품인지 확인해 보자.<br>
			   				뒷면을 봤을 때 ‘비타민 D’처럼 영양 성분만 표기됐다면 합성비타민, ‘건조효모(비타민 D 0.02%)’처럼 천연 원료와 영양 성분이 함께 표기됐다면 천연비타민 D다.<br></p>
						<a class="btn btn-primary float-xl-end" href="https://kr.iherb.com/search?kw=%EB%B9%84%ED%83%80%EB%AF%BCD">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://images.pexels.com/photos/3310691/pexels-photo-3310691.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940/700x400" alt="칼슘/마그네슘">
					<div class="card-body">
						<h4 class="card-title text-center">4. 칼슘/마그네슘</h4>
						<p class="card-text">한국인이 가장 적게 섭취하는 영양소는 바로 칼슘으로 하루에 1,000mg 정도가 요구된다. 그러나 한 번에 500mg 이상의 칼슘은 흡수하기 어렵기 때문에 가급적 나눠서 복용하는 게 좋다.<br>
			 				 특히 칼슘은 마그네슘과 함께 섭취할 때 흡수율이 더 높아진다.시중에 칼슘과 마그네슘, 그 밖에 비타민 D나 망간 등을 배합한 제품이 많이 출시된 것도 이것 때문이다.<br>
							칼슘과 마그네슘 복합제를 선택할 때는 2대1의 황금 비율인지 살펴보자.<br></p>
						<a class="btn btn-primary float-xl-end" href="https://kr.iherb.com/search?kw=%EC%B9%BC%EC%8A%98%2F%EB%A7%88%EA%B7%B8%EB%84%A4%EC%8A%98">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://images.unsplash.com/photo-1562114808-b4b33cf60f4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80/700x400" alt="5. 유산균">
					<div class="card-body">
						<h4 class="card-title text-center">5. 유산균</h4>
						<p class="card-text">프로바이오틱스는 장내 유익균의 증식을 도와 배변 활동을 원활히 하는 한편 몸의 면역력을 높이고 각종 질병 예방에도 도움을 준다.<br>
							제품을 선택할 때는 유산균을 비롯한 세균 함량이 허가 기준치에 도달하는지(균의 양을 세는 단위는 CFU로 1그램당 균 수가 1억~100억 CFU 함량을 넘어야 한다), 유익균이 장까지 얼마나 살아남는지 등을 주의 깊게 확인해야 한다.<br>
							프로바이오틱스는 위산에 약하기 때문에 공복에 복용하는 게 좋고 상온에서 활동을 시작하기 때문에 주문할 때 냉장 배송이 되는지 꼭 확인해야 한다.<br></p>
						<a class="btn btn-primary float-xl-end" href="https://kr.iherb.com/search?kw=%EC%9C%A0%EC%82%B0%EA%B7%A0">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://images.unsplash.com/photo-1610837856480-3b56279b2221?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80/700x400" alt="">
					<div class="card-body">
						<h4 class="card-title text-center">6. 비타민 C</h4>
						<p class="card-text">비타민 C는 거의 모든 과일과 채소에 들어있는 비타민의 중의 하나이고, 비타민 C 합성 효소를 가지고 있는 육식 동물은 자체적으로 체내에서 이것을 합성하기 때문에 채소와 과일을 먹지 않아도 되지만, <br>
							합성하지 못하는 동물은 반드시 섭취해야 한다. 인간은 비타민 C 합성 효소를 가지고 있지 않기 때문에 음식으로 섭취해야 하는 필수 비타민의 한 종류이다. 비타민 C가 결핍되면 괴혈병을 일으키는데, 과거에 그 이유를 모르고 장기 항해를 하는 선원들이 신선한 채소와 과일로부터 충분한 비타민 C를 섭취하지 못하여 괴혈병으로 사망하는 사례가 많았다. </p>
						<a class="btn btn-primary float-xl-end" href="https://kr.iherb.com/search?kw=%EB%B9%84%ED%83%80%EB%AF%BC%20c">더보기</a>
					</div>
				</div>
			</div>
		</div>

		<!--페이지
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span> <span class="sr-only">이전</span>
				</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span> <span class="sr-only">다음</span>
				</a>
			</li>
		</ul> -->
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