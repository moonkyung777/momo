<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url", url);
	String includeurl = "header.jsp";
	String uss = (String) session.getAttribute("id");
	String log = "로그인";
	if (uss == null)
		uss = "GUEST";
	else {
		log = "로그아웃";
		includeurl = "sign_login.jsp";
	}
	//수정부분 끝
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>대관신청</title>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Chrissy Collins" name="author">
<meta content="A pure vanilla JS calendar by @chrisssycollins" name="description">
<link href="css/vanillaCalendar.css" rel="stylesheet">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/orbit-1.2.3.css">
<link rel="stylesheet" href="css/reservation_body.css">
<link rel="stylesheet" href="css/demo-style.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:100,300,400'>
<link rel="stylesheet" href="css/selectstyle.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/form_check.js"></script>
<script type="text/javascript" src="jquery-1.5.1.min.js"></script>
<link rel="stylesheet" href="reservation_body.css">
<!----------------------------바디 스타일------------------------------------>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
<!-- select box -->
<script src="js/selectindex.js"></script>
<!----------------------------서브메뉴마우스오버기능-------------------------->
<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->
<script type='text/javascript'>
	$(function() {
		$('#forgot_username_link').tipsy({
			gravity : 'w'
		});
	});
</script>
<link href="css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
<script src="js/jquery2.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".signin").click(function(e) {
			e.preventDefault();
			$("fieldset#signin_menu").toggle();
			$(".signin").toggleClass("menu-open");
		});

		$("fieldset#signin_menu").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if ($(e.target).parent("a.signin").length == 0) {
				$(".signin").removeClass("menu-open");
				$("fieldset#signin_menu").hide();
			}
		});

	});
</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>

<script type="text/javascript">
	$(window).load(function() {
		$('#featured').orbit();
	});
</script>
<script>
	/*스크롤 내리면 메뉴 위치 이동하는 기능------따로빼면 작동xxxxxx*/
	$(function() {
		var shrinkHeader = 30;
		var shrinkhollow = 465;
		$(window).scroll(function() {
			var scroll = getCurrentScroll();
			if (scroll >= shrinkHeader) {
				$('#navtop').addClass('shrink');
			} else {
				$('#navtop').removeClass('shrink');
			}
			if (scroll >= shrinkhollow) {
				$('#navtop').addClass('shrinkhollow');
			} else {
				$('#navtop').removeClass('shrinkhollow');
			}
		});
		function getCurrentScroll() {
			return window.pageYOffset || document.documentElement.scrollTop;
		}
	});
</script>

<style>
.box {
	width: 450px;
}
</style>



</head>
<body>
	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>




	<div id="mainleft">
		<div id="leftbanner">
			<div id="banner1">
				<img src="img/20191211.jpg" width="100%" height="100%" />
			</div>
			<div id="banner3">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
			</div>
		</div>
	</div>



	<section id="main">
		<section id="mainright">
			<div id="section_1">

				<div id="v-cal">

					<div class="vcal-header">
						<button class="vcal-btn" data-calendar-toggle="previous">
							<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
					</svg>
						</button>
						<div class="vcal-header__label" data-calendar-label="month">March 2017</div>

						<button class="vcal-btn" data-calendar-toggle="next">
							<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
					</svg>
						</button>
					</div>

					<div class="vcal-week">
						<span>Mon</span> <span>Tue</span> <span>Wed</span> <span>Thu</span> <span>Fri</span> <span>Sat</span> <span>Sun</span>
					</div>

					<div class="vcal-body" data-calendar-area="month"></div>
				</div>
				<p class="demo-picked">
				<div class="borderCenter">
					<div class="fonlist">
						날짜선택: <span data-calendar-label="picked"></span>
					</div>

				</div>
				</p>


				<script src="js/vanillaCalendar.js" type="text/javascript"></script>
				<script>
					window.addEventListener('load', function() {
						vanillaCalendar.init({
							disablePastDays : true
						});
					})
				</script>
			</div>
			<hr>


			<div id="section_2" align=right>
				<table>
					<tr>
						<td colspan=2></td>
					</tr>
					<tr>
						<td colspan=2>

							<div class="cont_heg_50"></div>
							<div class="cont_select_center">

								<div class="select_mate" data-mate-select="active">
									<select name="" onclick="return false;" id="">
										<option value="">구장</option>
										<option value="1">A구장</option>
										<option value="2">B구장</option>
										<option value="3">C구장</option>
									</select>

									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td colspan=2>
							<div class="cont_heg_50"></div>
							<div class="cont_select_center">

								<div class="select_mate" data-mate-select="active">
									<select name="" onclick="return false;" id="">
										<option value="">시간</option>
										<option value="1">10:00 AM</option>
										<option value="2">12:00 PM</option>
										<option value="3">2:00 PM</option>
										<option value="4">4:00 PM</option>
										<option value="5">6:00 PM</option>
										<option value="6">8:00 PM</option>
									</select>

									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>


					<tr>
						<td colspan=2 align=right>
							<br>
							<div class="borderCenter">
								<h4>합계 : 80,000(원) [구장대여 1시간 65,000 + 옵션선택 5,000]</h4>
							</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<hr>
			<!-- ------------------------------------------------- -->
			<div id="section_3" align="left">
				<table>
					<tr>
						<td align="center">
							<br>
							<h3>매치등록</h3>
						</td>
					</tr>
					<tr>
						<td align="center">
							<br>매치를 등록하면 경기를 희망하는 팀의 연락을 받을 수 있습니다.
						</td>
					</tr>
					<tr>

						<td>
							<div class="cont_heg_50"></div>
							<div class="cont_select_center">

								<div class="select_mate" data-mate-select="active">
									<select name="" onclick="return false;" id="">
										<option value="">매치형태</option>
										<option value="1">5 vs 5</option>
										<option value="2">6 vs 6</option>
									</select>

									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>

						<td>
							<div class="cont_heg_50"></div>
							<div class="cont_select_center">

								<div class="select_mate" data-mate-select="active">
									<select name="" onclick="return false;" id="">
										<option value="">신청 가능 팀</option>
										<option value="1">1 팀</option>
										<option value="2">2 팀</option>
									</select>

									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td>
							<div class="cont_heg_50"></div>
							<div class="cont_select_center">

								<div class="select_mate" data-mate-select="active">
									<select name="" onclick="return false;" id="">
										<option value="">팀수준</option>
										<option value="1">상</option>
										<option value="2">중상</option>
										<option value="2">중</option>
										<option value="2">중하</option>
										<option value="2">하</option>
									</select>

									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td align="center">
							유니폼
							<div class="cont_heg_50"></div>
							<div class="cont_select_center" style="float: left;">

								<div class="select_mate" data-mate-select="active" style="min-width: 150px; width: 150px;">
									<select name="" onclick="return false;" id="">
										<option value="">상의</option>
										<option value="1">Red</option>
										<option value="2">Blue</option>
										<option value="2">Green</option>
										<option value="2">Yellow</option>
										<option value="2">White</option>
										<option value="2">직접입력</option>
									</select>


									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>

							<div class="cont_heg_50"></div>
							<div class="cont_select_center" style="float: left;">

								<div class="select_mate" data-mate-select="active" style="min-width: 150px; width: 150px;">
									<select name="" onclick="return false;" id="">
										<option value="">하의</option>
										<option value="1">Red</option>
										<option value="2">Blue</option>
										<option value="2">Green</option>
										<option value="2">Yellow</option>
										<option value="2">White</option>
										<option value="2">직접입력</option>
									</select>
									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>

							<div class="cont_heg_50"></div>
							<div class="cont_select_center" style="float: left;">

								<div class="select_mate" data-mate-select="active" style="min-width: 150px; width: 150px;">
									<select name="" onclick="return false;" id="">
										<option value="">스타킹</option>
										<option value="1">Black</option>
										<option value="2">White</option>
										<option value="2">직접입력</option>
									</select>
									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td align="rignt">
							<br>
							<textarea name="won" rows=5 cols=65 class=box placeholder="원하는 매칭시간/개인 연락처/팀 소개등 메모" onfocus="this.placeholder = ''" onblur="this.placeholder = '원하는 매칭시간/개인 연락처/팀 소개등 메모'"></textarea>
						</td>
					</tr>
				</table>
			</div>

			<!-- --------------------------------------------- -->
			<div id="section_4" align="left">
				<table>
					<tr>
						<td align="center">
							<br>
							<h3>용병모집</h3>
						</td>
					</tr>
					<tr>
						<td align="center">
							<br>용병모집을 등록하면 커뮤니티의 용병모집란에 자동 등록 됩니다.
						</td>
					</tr>
					<tr>

						<td>
							<div class="cont_heg_50"></div>
							<div class="cont_select_center">

								<div class="select_mate" data-mate-select="active">
									<select name="" onclick="return false;" id="">
										<option value="">모집인원</option>
										<option value="1">1명</option>
										<option value="2">2명</option>
										<option value="2">3명</option>
										<option value="2">4명</option>
										<option value="2">5명</option>
										<option value="2">6명</option>
										<option value="2">7명</option>
										<option value="2">8명</option>
										<option value="2">9명</option>
										<option value="2">10명</option>
									</select>

									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>


					<tr>

						<td>
							<div class="cont_heg_50"></div>
							<div class="cont_select_center">

								<div class="select_mate" data-mate-select="active">
									<select name="" onclick="return false;" id="">
										<option value="">팀수준</option>
										<option value="1">상</option>
										<option value="2">중상</option>
										<option value="2">중</option>
										<option value="2">중하</option>
										<option value="2">하</option>
									</select>

									<p class="selecionado_opcion" onclick="open_select(this)"></p>
									<span onclick="open_select(this)" class="icon_select_mate"><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
									<div class="cont_list_select_mate">
										<ul class="cont_select_int">
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td align="rignt">
							<br>
							<textarea name="won" rows=5 cols=65 class=box placeholder="원하는 매칭시간/개인 연락처/팀 소개등 메모" onfocus="this.placeholder = ''" onblur="this.placeholder = '원하는 매칭시간/개인 연락처/팀 소개등 메모'"></textarea>
							<br>
						</td>
					</tr>
				</table>
			</div>
			<div id="section_5" align="right">
				<tr>
					<td align="right">
						<hr>
						<br>
						<div class="depthButton">결 제</div>
					</td>
				</tr>
		</section>
	</section>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>

</body>
</html>

