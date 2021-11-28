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
<title>More Health, Less Care! with SEMO</title>
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
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">영양제 소개</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="infoENS">현대인 필수 영양제</a></li>
									<li><a class="dropdown-item" href="infoCNS">증상별 영양제 추천</a></li>
									<li><a class="dropdown-item" href="infoNGNS">같이 섭취하면 좋지 않은 영양제</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link me-lg-3" href="bbs2">Q & A 게시판</a></li>
							<li class="nav-item"><a class="nav-link me-lg-3" href="list">후기 게시판</a></li>
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

     <!--사이트 소개 -->
     <header>
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" style="background-image: url('https://images.unsplash.com/photo-1610021685640-830eff58c1dd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1840&q=80/1920x1080')">
					<div class="carousel-caption">
						<h5 class="display-4">나에게 지금 필요한 영양제는 무엇일까요?</h5>
						<p>세모에서는 필수 영양제, 같이 먹으면 안 좋은 영양제 등 다양한 정보를 제공해요! 지금 세모에 가입하고 많은 회원들과 소통해보세요!</p>
					</div>
				</div>
				<div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1627467959547-8e44da7aa00a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1074&q=80/1920x1080')">
					<div class="carousel-caption">
						<h5>어떤 내용을 쓸까?</h5>
						<p>설명 설명 설명.</p>
					</div>
				</div>
				<div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1611073061835-e77b1b16d3f3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1171&q=80/1920x1080')">
					<div class="carousel-caption">
						<h5>어떤 내용을 쓸까?</h5>
						<p>설명 설명 설명.</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</header>

        <!--추천 영양제-->
        <section id="features">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-8 order-lg-1 mb-5 mb-lg-0">
                        <div class="container-fluid px-5">
                            <div class="row gx-5">
                                <div class="col-md-6 mb-5">
                                    <!-- Feature item1-->
                                    <div class="text-center">
                                        <img src="https://s3.images-iherb.com/jrw/jrw29003/v/19.jpg" style="width: 200px; height: auto; margin-top:10px;" />
                                        <h4 class="font-alt">Jarrow Formulas,<br>Vision Optimizer</h4>
                                        <p class="text-muted mb-0">눈건강 영양제의 끝판왕!<br>눈에 좋은 영양 성분이 모두 모여있어요!</p>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-5">
                                    <!-- Feature item2-->
                                    <div class="text-center">
                                        <img src="https://s3.images-iherb.com/cgn/cgn01092/v/165.jpg" style="width: 200px; height: auto; margin-top:10px;" />
                                        <h4 class="font-alt">California<br>Gold Nutrition</h4>
                                        <p class="text-muted mb-0">유명 유튜버 추천 비타민 C!<br>맛도 좋고 영양도 좋아서 어린이에게 제격!</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-5 mb-md-0">
                                    <!-- Feature item3-->
                                    <div class="text-center">
                                        <img src="https://s3.images-iherb.com/nwy/nwy15686/v/103.jpg" style="width: 200px; height: auto; margin-top:10px;" />
                                        <h4 class="font-alt">Nature's Way, Alive!<br>Once Daily</h4>
                                        <p class="text-muted mb-0">여성에게 필요한 비타민 총 집합!<br>한 알로도 충분해요!</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Feature item4-->
                                    <div class="text-center">
                                        <img src="https://s3.images-iherb.com/nwy/nwy15685/v/97.jpg" style="width: 200px; height: auto; margin-top:10px;" />
                                        <h4 class="font-alt">Nature's Way, Alive!<br>Once Daily</h4>
                                        <p class="text-muted mb-0">남성에게 최적화된 비타민!<br>한 알로도 충분해요!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 order-lg-0">
                        <!-- Features section video-->
                            <div class="device-wrapper">
                                    <div class="screen bg-white">
                                        <video muted="muted" autoplay="" loop="" style="max-width: 100%; height: 100%">
                                        <source src="image/example.mp4" type="video/mp4" /></video>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <!--게시판 - Q&A 게시판-->
        <aside class="text-center bg-gradient-primary-to-secondary">
            <div class="container px-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-xl-8">
                        <div class="h2 fs-1 text-white mb-4">"Is this suitable for me?"</div>
                        <a class="btn btn-outline-light py-3 px-4 rounded-pill" href="bbs2"><i class="fas fa-users"></i>　소통하기</a>
                    </div>
                </div>
            </div>
        </aside>

        <!--NEWS & VIDEO-->
        <section class="bg-light">
            <div class="container px-5">
                <div class="row gx-5 align-items-center justify-content-center justify-content-lg-between">
                    <div class="col-12 col-lg-6">
                    	<div class="context-media">
                    	<img src="https://imgnews.pstatic.net/image/296/2021/11/04/0000052565_001_20211104213201532.png?type=w647" style="height: 300px" />
                        </div>
                        <h4 class="font-alt">내가 살찌는 이유 ‘잠’ 때문이었나?</h4>
                        <hr><p class="lead fw-normal text-muted mb-5 mb-lg-0">수면 장애란 건강한 수면을 못 하거나, 충분한 자는데도 낮에 각성을 유지하지 못하는 상태, 수면리듬이 흐트러져 있어서 깨어 있을 때 어려움을 겪는 상태를 말한다.</p>
                    	<a class="btn btn-outline-dark py-1 px-2 rounded-pill" style="float: right;" href="newsVideo"><i class="fas fa-angle-right"></i>　더보기</a>
                    </div>
                    <div class="col-12 col-lg-6">
                    	<div class="context-media">
                    	<iframe width="500" height="280" src="https://www.youtube.com/embed/Vtcbsu0tBaY" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        <h4 class="font-alt">영양제 최고의 조합과 최악의 조합?</h4>
                        <hr><p class="lead fw-normal text-muted mb-5 mb-lg-0">영양제 최고의 궁합과 최악의 궁합은 무엇? 종합비타민, 오메가3, 칼슘, 비타민C는 어떤 영양제랑 같이 먹으면 더 좋을까요?<br>#영양제 #영양제궁합 #종합비타민</p>
                    	<a class="btn btn-outline-dark py-1 px-2 rounded-pill" style="float: right;" href="newsVideo"><i class="fas fa-angle-right"></i>　더보기</a>
                    </div>
                    </div>
                </div>
        </section>

        <!--영양제 소개 - info 게시판으로 이동-->
        <section class="cta">
            <div class="cta-content">
                <div class="container px-5">
                    <h2 class="text-white display-1 lh-1 mb-4">
                        More Health, Less Care!
                        <br>
                         with SEMO.
                    </h2>
                    <a class="btn btn-outline-light py-3 px-4 rounded-pill" href="infoENS"><i class="fas fa-eye"></i>　알아보기</a>
                </div>
            </div>
        </section>

         <!-- 게시판 - 후기 게시판-->
        <aside class="text-center bg-gradient-primary-to-secondary">
            <div class="container px-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-xl-8">
                        <h2 class="display-4 fs-1 text-white mb-4">"비오틴을 복용하니까 손톱이 단단해졌어요!"</h2>
                        <a class="btn btn-outline-light py-3 px-4 rounded-pill" href="bbs"><i class="far fa-keyboard"></i>　후기 남기기</a>
                    </div>
                </div>
            </div>
        </aside>

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