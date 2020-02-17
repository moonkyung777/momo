<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//2020_01_02 수정부분
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

	//수정사항 2020.01.14 로그인 ID에 대한 정보.
	String logid = (String) session.getAttribute("id");
%>
<!-- datepicker -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,500,300,700'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- <link rel='stylesheet' type='text/css' href='http://fian.my.id/Waves/static/waves.min.css?v=0.7.4'> -->
<link rel='stylesheet' type='text/css' href='css/rm-datepicker.css'>
<!-- ---------- -->
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>yongsign</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>

<!-- <link rel="stylesheet" type="text/css" href="css\join.css" /> -->


<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/signbutton.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/signformrelocation.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles2.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>



<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
<!----------------------------alam form 추가 2020.01.06-------------------------->
<script type="text/javascript">
	$(document).ready(function() {
		$(".mypage").click(function(e) {
			e.preventDefault();
			$("fieldset#mypage_menu").toggle();
			$(".mypage").toggleClass("menu-open");
		});
		$("fieldset#mypage_menu").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if ($(e.target).parent("a.mypage").length != 0) {
				$(".mypage").removeClass("menu-open");
				$("fieldset#mypage_menu").hide();
			}
		});

	});
</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
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
<link href="css/front.css" media="screen, projection" rel="stylesheet"
	type="text/css">
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
<script>
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
<!------------------------------ datepicker ---------------------------->

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<!-- <script src="http://fian.my.id/Waves/static/waves.min.js?v=0.7.4"></script> -->
<script src="js/rm-datepicker.js"></script>
<script>
	var app = angular.module("myApp", [ "rmDatepicker" ]);

	/* Datepicker global configuration */
	app.config([ "rmDatepickerConfig", function(rmDatepickerConfig) {
		rmDatepickerConfig.mondayStart = true;
		rmDatepickerConfig.initState = "month";
	} ]);
</script>
<script>
	(function() {

		var app = angular.module("myApp");

		var MyCtrl = function($scope) {

			/* Datepicker local configuration */
			$scope.rmConfig1 = {
				mondayStart : false,
				initState : "month", /* decade || year || month */
				maxState : "decade",
				minState : "month",
				decadeSize : 12,
				monthSize : 42, /* "auto" || fixed nr. (35 or 42) */
				min : new Date('2000-11-21'),
				max : new Date('2023-11-21'),
				format : "yyyy-MM-dd" /* https://docs.angularjs.org/api/ng/filter/date */
			};

			$scope.oDate1 = new Date('2015-12-12');
			$scope.oDate2 = new Date();
		};
		app.controller("MyCtrl", [ '$scope', MyCtrl ]);

	}());

	// Init waves (OPTIONAL) :)
	// window.onload = Waves.init();
</script>
<!-- ---------------------------------------------------------------- -->
<!-- -----------------다음 주소 api ----------------------------------------->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- ------------------------------------------------------------------------- -->
<!-- -------------------------ID 중복확인에 대한 ajax--------------------------------- -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#id").blur(function() {
			var idReg = /^[a-zA-z]+[a-zA-z0-9]{5,13}$/g;
			if (idReg.test(join.id.value))
				callAjax();
			else {
				$("#ajaxReturn").html("6~14자 사이의 영문 대소문자와 숫자만 사용가능합니다");
			}
		});
		$("#name").blur(function() {
			if (join.name.value.length != 0)
				$("#nameReturn").html("");
			else {
				$("#nameReturn").html("이름을 입력해주세요.");
			}
		});

		$("#hp2").blur(function() {
			if (join.hp2.value.length != 0)
				$("#hpReturn").html("");
			else {
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#hp3").blur(function() {
			if (join.hp3.value.length != 0)
				$("#hpReturn").html("");
			else {
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#em1").blur(function() {
			if (join.em1.value.length != 0)
				$("#emReturn").html("");
			else {
				$("#emReturn").html("이메일을 입력하세요.");
			}
		});
	});

	function callAjax() {

		$.ajax({
			type : "post",
			url : "./confirmId.jsp",
			data : {

				id : $('#id').val()
			},
			success : whenSuccess,
			error : whenError
		});
	}
	var confirmid = "";
	function whenSuccess(resdata) {

		var x = document.getElementById("ajaxReturn");
		$("#ajaxReturn").html(resdata);

		if (resdata.includes("이미 사용중인 ID입니다")) {
			document.join.hidden.value = "0";
			x.style.color = "red";
		}

		else {
			document.join.hidden.value = "1";
			x.style.color = "blue";
			confirmid = join.id.value;

		}
	}
	function whenError() {
		alert("Error");
	}

	//	<!--js 파일 분리가 안돼서 어쩔수없이 이곳에 사용한 용병가입 창 js 파일 2020.01.09-->
	function yongjoinsubmit() {

		var y_b_namelen = yongjoin.y_b_name.value.length

		if (y_b_namelen <= 0) {
			alert("이름을 입력하세요.");
			yongjoin.y_b_name.focus();
		} else {
			document.yongjoin.submit();
		}

	}
</script>
<!-- 비밀번호 체크 ajax -->
<script type="text/javascript">
	function callAjax2() {
		if (join.pw.value != join.pwch.value) {
			$("#pwReturn").html("비밀번호가 일치하지 않습니다");
		} else {
			$("#pwReturn").html("");
		}
	}
</script>

<script language="javascript">
<!--
	var oTbl;
	//Row 추가
	function insRow() {
		
		oTbl = document.getElementById("addTable"); //테이블아이디 가져옴
		var oRow = oTbl.insertRow(); //행추가
		oRow.onmouseover = function() {
			oTbl.clickedRowIndex = this.rowIndex
		}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		var oCell = oRow.insertCell(); //행추가

		//삽입될 Form Tag
		var frmTag = "<div class=col-xs-10><input type=text class=formInput id=y_2 name=y_2 style=width:700px; height:20px; font-size: 18px;></div> ";
		frmTag += "<div class=col-xs-2><input type=button value='삭제'class= signbutton 'signbutton5' name=addButton2 onClick='removeRow()' style='cursor:hand'></div>";

		oCell.innerHTML = frmTag; //추가되는 속성변경 
	}
	//Row 삭제
	function removeRow() {
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}

	function frmCheck() { //입력안된 텍스트 값 
		var frm = document.form;

		for (var i = 0; i <= frm.elements.length - 1; i++) {
			if (frm.elements[i].name == "addText") {
				if (!frm.elements[i].value) {
					alert("텍스트박스에 값을 입력하세요!");
					frm.elements[i].focus();
					return;
				}
			}
		}
	}
</script>

<!-- 한글글씨체적용 /아이디찾기 제목-->
<link rel="stylesheet" href="css/galboardstyle.css">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
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
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr"
					width="100%" height="100%" frameborder="0" style="border: 0;"
					allowfullscreen=""></iframe>
			</div>
		</div>


	</div>
	<section id="main">


		<section id="mainright">
			<div id="matList">

				<div class="container" id="formOutterWrapper">
					<center>
						<div class="writeboardtitle"
							style="text-align: center; font-size: 50px;">구장 등록</div>

					</center>
					<div class="container" id="formInnerWrapper">
						<form name="yongjoin" id="materialForm" class="form" method="post"
							action="yongsignInsert.jsp?fn=1&yid=<%=uss%>" role="form"
							autocomplete="off">
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<select name="y_b_ground" class=formInput>
										<option value="">지점선택</option>
										<option>동대문점</option>
										<option>안산 고진점</option>
										<option>서수원점</option>
										<option>일산점</option>
										<option>대전 탄방점</option>
										<option>동대전점</option>
										<option>부산 가야점</option>
										<option>울산 남구점</option>
										<option>창원점</option>
										<option>전주 완산점</option>
										<option>울산 북구점</option>
										<option>GLOBAL ARENA(Japan)</option>
										<option>부산 북구점</option>
										<option>Seogwipo. JEJU</option>
										<option>가천대학교 운동장</option>
									</select>
								</div>

							</div>
														<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="GROUND_NAME">구장명</label> <input
										type="text" class="formInput" id="GROUND_NAME" name="GROUND_NAME"
										style="font-size: 18px;" >
								</div>

							</div>
						
							
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<label class="labels" for="GROUND_SIZE">구장 크기</label> <input
										type="text" class="formInput" id="GROUND_SIZE" name="GROUND_SIZE"
										style="font-size: 18px;" >
								</div>
								<div class="col-xs-1">
									<label class="labels" for="">위치</label>
								</div>
								<div class="col-xs-3">
									<select class="formInput" id="y_b_tel1" name="y_b_tel1">
										<option value="">선택</option>
										<option>실내</option>
										<option>실외</option>
									
									</select>
								</div>
							
							</div>
								<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<label class="labels" for="GROUND_WEEKDAYDAYTIME_CHARGE">주중 주간요금</label> <input
										type="text" class="formInput" id="GROUND_WEEKDAYDAYTIME_CHARGE" name="GROUND_WEEKDAYDAYTIME_CHARGE"
										style="font-size: 18px;" >
								</div>
												<div class="col-xs-4">
									<label class="labels" for="GROUND_WEEKDAYNIGHT_CHARGE">주중 야간요금</label> <input
										type="text" class="formInput" id="GROUND_WEEKDAYNIGHT_CHARGE" name="GROUND_WEEKDAYNIGHT_CHARGE"
										style="font-size: 18px;" >
								</div>
								
							</div>
														<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<label class="labels" for="GROUND_WEEKENDDAYTIME_CHARGE">주중 주간요금</label> <input
										type="text" class="formInput" id="GROUND_WEEKENDDAYTIME_CHARGE" name="GROUND_WEEKENDDAYTIME_CHARGE"
										style="font-size: 18px;" >
								</div>
												<div class="col-xs-4">
									<label class="labels" for="GROUND_WEEKENDNIGHT_CHARGE">주중 야간요금</label> <input
										type="text" class="formInput" id="GROUND_WEEKENDNIGHT_CHARGE" name="GROUND_WEEKENDNIGHT_CHARGE"
										style="font-size: 18px;" >
								</div>
								
							</div>
		
		
                         
                       
                       


							<div class="form-group" style="height: 200px;">
								<div class="col-xs-2"></div>
									<div class="col-xs-8">
									<select name="GROUND_AVAILABLEDATE" class=formInput>
										<option value="">구장 사용가능 일정표</option>
										<option>주중</option>
										<option>주말</option>
										<option>연중무휴</option>
						
									</select>
								</div>

							</div>
							
							
							

							<input type="hidden" id="yId" name="yId" value="<%=logid%>" />
							<div class="form-group" style="">
								<div class="col-xs-4" style="font-size: 14px;"></div>

								<div class="col-xs-4" style="margin-left: 45px;">

									<input type="button" value="등록" class="signbutton signbutton5"
										onClick="yongjoinsubmit()"
										style="font-size: 18px; width: 140px; letter-spacing: 5px;">
									<input type="button" value="취소"
										class="signbutton signbuttoncancel"
										style="font-size: 18px; width: 140px; letter-spacing: 5px;"
										onClick="script: location.href='yonglist_1.jsp'">
								</div>


							</div>



						</form>
					</div>
				</div>
				<script src="https://code.jquery.com/jquery-2.2.3.min.js"
					integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="
					crossorigin="anonymous"></script>
				<script src="js/materialForm.js"></script>
			</div>

		</section>


	</section>



	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
</body>
</html>