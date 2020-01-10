<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url",url);
	String includeurl = "header.jsp";
	String uss = (String)session.getAttribute("id");
	String log = "로그인";
	if(uss==null)
		uss="GUEST";
	 else{
	 	log="로그아웃";
		includeurl = "sign_login.jsp";
	 }
		//수정부분 끝
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>sign</title>
  <script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/datepicker.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/common/form_check.js"></script>
  <link rel="stylesheet" type="text/css" href="css\join.css"/>
  <link rel="stylesheet" href="css/classic.css">
	<link rel="stylesheet" href="css/classic.date.css">
	<link rel="stylesheet" href="css/classic.time.css">
	<link rel="stylesheet" href="css/style2.css" media="screen">
	<!----------------------------메인 스타일-------------------------->
	<link rel="stylesheet" href="css/yongsign_x_materialFormStyles.css">
	<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
	<script src="js/materialForm.js"></script>
	


<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
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
	<!----------------------------서브메뉴마우스오버기능-------------------------->
	<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
	<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->
	<script type='text/javascript'>
		$(function() {
		  $('#forgot_username_link').tipsy({gravity: 'w'});   
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
					if($(e.target).parent("a.signin").length==0) {
						$(".signin").removeClass("menu-open");
						$("fieldset#signin_menu").hide();
					}
				});			
				
			});
	</script>
	<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
<script>
		
	$(function(){
		 var shrinkHeader = 30;
		 var shrinkhollow = 465;
		  $(window).scroll(function() {
			var scroll = getCurrentScroll();
			  if ( scroll >= shrinkHeader ) {
				   $('#navtop').addClass('shrink');  
				}
				else {
					$('#navtop').removeClass('shrink');	
				}
			   if(scroll>= shrinkhollow ){
					$('#navtop').addClass('shrinkhollow');  
				}
				else {
					$('#navtop').removeClass('shrinkhollow');	
				}
	});
	function getCurrentScroll() {
		return window.pageYOffset || document.documentElement.scrollTop;
		}
	});
	</script>
	<!-- -----------------다음 주소 api ----------------------------------------->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- ------------------------------------------------------------------------- -->
 </head>
 <body>
 	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<div id="mainleft">
			

			<div id="leftbanner">
				<div id="banner1">
					<img src="img/20191211.jpg" width="100%" height="100%"/>
				</div>
			
				<div id="banner3">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
				</div>
			</div>


		</div>
	<section id="main">
		

		<section id="mainright">
			<div id="matList">
				<div class="container" id="formOutterWrapper">
<h1>그린풋살파크 용병가입</h1>
        <div class="container" id="formInnerWrapper">
                <form name = "join" id="materialForm" class="form" method="post" action="signInsert.jsp" role="form" autocomplete="off">
                    <div class="form-group">
                        <div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-8">
                            <label class="labels" for="id">용병이름</label>
                            <input type="text" class="formInput" id="id" name="id">
                        </div>
					
					</div>
  
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
                        <div class="col-xs-2">
                            <label class="labels" for="hp1">휴대폰번호</label>
                            <input type="text" class="formInput" id="hp1" name="hp1">
                        </div>
						<div class="col-xs-1" style="position:relative; top:-17px; right:-25px;">
							<h3>-</h3>
						</div>
						<div class="col-xs-2">
                            <label class="labels" for="hp2"></label>
                            <input type="text" class="formInput" id="hp2" name="hp2">
                        </div>
						<div class="col-xs-1" style="position:relative; top:-17px; right:-25px;">
							<h3>-</h3>
						</div>
						<div class="col-xs-2">
                            <label class="labels" for="hp3"></label>
                            <input type="text" class="formInput" id="hp3" name="hp3">
                        </div>
                    </div>
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-1" style="font-size:16px; font-weight:400;">
							지점
						</div>
						<div class="col-xs-3">
							<select name="lv"  class = formInput><option value="2">2지점<option value="1">1지점</select>
						</div>

						<div class="col-xs-1" style="font-size:16px; font-weight:400;">
							구장
						</div>
						<div class="col-xs-3">
							<select name="lv"  class = formInput><option value="2">2구장<option value="1">1구장</select>
						</div>
						
					</div>
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-1" style="font-size:16px; font-weight:400;">
							실력
						</div>
						<div class="col-xs-3">
							<select name="lv"  class = formInput><option value="5">상<option value="4">중상<option value="3">중<option value="2">중하<option value="1">하</select>
						</div>
						
					</div>


					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-2" style="font-size:16px; font-weight:400;">
                            성별
                        </div>
						<div class="col-xs-6 radio">
							<div class="col-xs-3">
								<label>
									<input type ="radio" name="gender" value="female" checked>여성
								</label>
							</div>
							<div class="col-xs-3">
								<label>
									<input type ="radio" name="gender" value="male">남성
								</label>
							</div>
						</div>

						
					</div>
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-1" style="font-size:16px; font-weight:400;">
							매치일정
						</div>
						<div class="col-xs-3">
							<select name="lv"  class = formInput><option value="3">주말<option value="2">주중<option value="1">별도문의</select>
						</div>
						
					</div>
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-1" style="font-size:16px; font-weight:400;">
							시간선택
						</div>
						<div class="col-xs-3">
							<select name="lv"  class = formInput><option value="3">오후<option value="2">오전<option value="1">별도문의</select>
						</div>
						
					</div>

					
					
					

					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-2" style="font-size:16px; font-weight:400;">
							소속팀존재유무
						</div>
						<div class="col-xs-6 radio">
							<div class="col-xs-3">
								<label>
									<input type="radio" name="team" id="team" value="teamok" checked>
									있음
								</label>
							</div>

							<div class="col-xs-3">
								<label>
									<input type="radio" name="team" id="team" value="teamno">
									없음
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-2" style="font-size:16px; font-weight:400;">
							선호포지션
						</div>
						<div class="col-xs-8 checkbox">
							<div class="col-xs-2">
								<label>
									<input type="checkbox" name=hobby value="FW">
									FW
								</label>
							</div>

							<div class="col-xs-2">
								<label>
									<input type="checkbox" name=hobby value="MF">
									MF
								</label>
							</div>
							<div class="col-xs-2">
								<label>
									<input type="checkbox" name=hobby value="DF">
									DF
								</label>
							</div>
							<div class="col-xs-2">
								<label>
									<input type="checkbox" name=hobby value="GK">
									GK
								</label>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-1" style="font-size:16px; font-weight:400;">
							마감여부
						</div>
						<div class="col-xs-3">
							<select name="lv"  class = formInput><option value="2">가능<option value="1">마감</select>
						</div>
						
					</div>
					







                    <div class="form-group">
						<div class="col-xs-8" style="font-size:14px;">
								
						</div>
                        <div class="col-xs-1">
                            <input type ="button" value = "가입" class="btn btn-primary" onClick="joinsubmit()">
							
                        </div>
						<div class="col-xs-1" style="font-size:14px;">
							<input type = "reset" value="초기화" class="btn btn-danger">
						</div>
                    </div>
					<input type="hidden" name="hidden" value="" />
                </form>
        </div>
  </div>
    <script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>
    <script src="js/materialForm.js"></script>


			
			</div>
			
		</section>

		
	</section>
	
	

 </body>
</html>
