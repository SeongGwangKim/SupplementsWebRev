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
<title>증상별 영양제 추천┃SEMO</title>
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
		<h1 class="card-title text-center my-5 fw-bold fs-3"> 증상별 영양제 </h1>
		<div class="row">
			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://s3.images-iherb.com/cgn/cgn00965/v/48.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title text-center">1. 피곤할 때 자주 방광염이나<br>질염이 생긴다면 유산균</h4>
						<p class="card-text">채소와 과일에서 추출한 비타민, 미네랄을 농축해 만들었으며 피로 해소와 각종 질병 예방 등을 돕는다. 그러나 여러 성분을 골고루 집약해 담다 보니 특정 성분이 하루 권장량에 미치지 않을 수 있어 유의해야 한다.<br>
			 					예를 들어 종합영양제에 보통 칼슘이 40~160mg 들어 있지만, 성인 여성 하루 칼슘 권장량은 1,000~1,500mg이므로 칼슘을 추가로 복용해야 한다.<br>
								 비타민 D 결핍이 많은 노인들 역시 종합영양제만으로는 영양을 충분히 섭취하기 어렵다는 문제가 있기 때문에 확인이 필요하다.<br></p>
						<a class="btn btn-primary float-end" href="https://kr.iherb.com/pr/california-gold-nutrition-lactobif-probiotics-30-billion-cfu-60-veggie-capsules/64009">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://s3.images-iherb.com/nfs/nfs02072/v/36.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title text-center">2. 피곤하다면<br>종합비타민, 비타민C, 코엔자임Q10</h4>
						<p class="card-text">수면부족, 운동부족, 정신적인 스트레스로 인해서 피곤할 때는 영양제를 먹으면 몸의 기능을 회복하는 데 도움이 될 수 있다. 먼저 종합비타민을 추천할 만하다.항피로 비타민으로 알려진 비타민B1 외에도 비타민 B2·B3·B5·B6 등 다양한 비타민B가 들어 있어 에너지 대사에 관여하기 때문이다.<br>
									또한 비타민B군 외에도 마그네슘 등 다양한 미네랄과 미량원소가 들어 있어서 피로회복에 효과적이다. 비타민B군이 함유된 종합비타민제만으로 피로감이 충분히 줄어들지 않는 경우 비타민C의 도움을 받을 수 있다. 식사 후에 1000mg를 1~2알 먹으면 된다.<br>
									이 두 가지 영양제로도 피곤함이 가시지 않으면 코엔자임 Q10을 100mg 정도 추가로 먹을 수 있다. 항산화제인 코엔자임 Q10은 에너지 생성에 중요한 역할을 하는 조효소이다.<br></p>
						<a class="btn btn-primary float-end" href="https://kr.iherb.com/pr/natural-factors-coenzyme-q10-100-mg-120-softgels/12955">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://s3.images-iherb.com/nap/nap03366/v/5.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title text-center">3. 고혈압이 있을 때<br>종합비타민, 칼슘·마그네슘 복합 제제</h4>
						<p class="card-text">비타민 D는 골다공증 위험이 있는 갱년기 여성이나 피부 노화로 비타민 D를 잘 합성하지 못하는 노인에게 특히 강조되곤 한다.<br>
							 제품을 고를 때는 하루 권장 섭취량인 200~400IU를 충족하는지 확인해야 하는데, 체외 배출이 되지 않으므로 과잉 섭취는 금물이다.
							  또한 합성비타민은 흡수율이 떨어지고, 인체에 부정적인 영향을 줄 가능성이 제기됐으므로 천연 원료로 만든 제품인지 확인해 보자.<br>
			   			뒷면을 봤을 때 ‘비타민 D’처럼 영양 성분만 표기됐다면 합성비타민, ‘건조효모(비타민 D 0.02%)’처럼 천연 원료와 영양 성분이 함께 표기됐다면 천연비타민 D다.<br></p>
					<a class="btn btn-primary float-end" href="https://kr.iherb.com/pr/nature-s-plus-cal-mag-zinc-180-tablets/51157">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://s3.images-iherb.com/cgn/cgn01179/v/128.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title text-center">4. 치매가 걱정된다면<br>오메가3, 종합비타민, 비타민D재</h4>
						<p class="card-text">오메가3에 든 성분인 DHA와 EPA는 대표적인 뇌 건강 영양소로 알려져 있다.<br>
									오메가3를 많이 섭취할수록 치매를 일으키는 베타아밀로이드의 혈중 수치가 낮아진다.<br>
									뇌기능이 저하되기 시작하면 800~1200mg의 DHA가 필요하다. 유해산소의 생성이 증가하면 뇌세포의 손상도 증가한다.<br>
									항산화 영양소를 섭취해서 뇌기능을 유지하는 데 효과를 볼 수 있다. 이를 위해서는 셀레늄, 비타민E, 비타민C, 다양한 파이토케미컬이 풍부한 종합비타민제를 추천한다. 비타민D도 치매 예방에 도움이 되는 영양제다.<br></p>
					<a class="btn btn-primary float-end" href="https://kr.iherb.com/pr/california-gold-nutrition-vitamin-d3-50-mcg-2-000-iu-90-fish-gelatin-softgels/77548">더보기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="https://s3.images-iherb.com/jrw/jrw09002/v/45.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title text-center">5. 피부 트러블로 고생할 때<br>종합비타민, 감마리놀렌산</h4>
						<p class="card-text">뾰루지 같은 피부 트러블이나 진단명이 나오지 않는 피부 습진으로 고생할 때 영양제의 도움을 받을 수 있다.<br>
									먼저 종합비타민제에 들어 있는 비타민 A·B·D, 비오틴, 아연 등 여러 가지 성분이 피부 트러블을 조절하는 데 도움이 된다.<br>
									또한 감마리놀렌산은 우리 몸에서 강력하게 염증을 줄이는 항염 성분이다. 감마리놀렌산은 식품으로 섭취하기 어려워 대부분 영양제로 섭취한다.<br></p>
						<a class="btn btn-primary float-end" href="https://kr.iherb.com/pr/jarrow-formulas-evening-primrose-1-300-mg-60-softgels/228">더보기</a>
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