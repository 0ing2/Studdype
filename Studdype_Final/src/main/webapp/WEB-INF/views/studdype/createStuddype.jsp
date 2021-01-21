<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ComunityHome</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<!-- <link rel="stylesheet" href="./resources/css/studdype/createStuddype/createStuddype.css"> -->
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<style type="text/css">
@charset "UTF-8";
.main-section {
	display: block;
	position: relative;
	width: 60%;
	margin: 0px auto;
}

#main-contrainer {
	position: relative;
	width: 100%;
	hight: 100%;
	margin: 0px auto;
	margin-top: 5%;
}

#mainleft {
	position: relative;
	float: left;
	width: 50%;
}

#mainright {
	position: relative;
	float: right;
	width: 50%;
	padding-left: 5%;
}

#image-section {
	width: 100%;
	height: 400px;
	text-align:center;
	border: 2px solid #f8f9fa;
}

#studyMainPhoto {
	width:100%;
	height:400px;
}

#mainbottom {
	clear: both;
}

#btndiv {
	text-align: center;
}

input#fileinput {
	margin-top: 6.5%;
}

button.submitBtn {
	background: #fff;
	color: #7362DE;
	border: 1px solid #7362DE;
	box-shadow: 0 0 15px 5px #eaebf2;
	margin-top: 40px;
	padding-bottom: 50px;
	width: 300px;
	height: 50px;
	line-height: 52px;
	padding: 0;
	font-size: 20px;
	font-weight: 600;
	border-radius: 50px;
	transition: all 0.3s ease-in-out;
	cursor: pointer;
}

/* 흰색 버튼에서 hover 시 보라색으로 변경 */
input.submitBtn:hover, button.submitBtn:hover {
	background: #7362DE;
	color: #fff;
}


label {
	color: #7362DE;
	font-weight: bold;
}

</style>

<script type="text/javascript">
	var sel_files = [];

	$(function() {
		// 시 미선택 시 구/군은 숨김 
		$("#selectLocationGu option").hide();

		// 시 option 선택 시 해당 시에 대한 구/군 리스트 보여주기 (전에 보여준 구/군은 다시 숨김)
		$("#selectLocationSi").change(function() {
			var selectSi = $("#selectLocationSi option:selected").val();

			$("#selectLocationGu option").hide();
			$("." + selectSi).show();

		});

		// 파일 선택 시 걸리는 함수
		$("#fileinput").change(function() {
			readURL(this);
		});
		
		// 스터디 최대인원 포커스 아웃 시 문자 확인 및 border 값 변경
		$("#maxcnt_id").focusout(function() {
			var maxcnt = $(this).val();
			if(isNaN(maxcnt)) {
				alert("숫자만 입력하세요.");
				$("input#maxcnt_id").css('border', '3px solid red');
				$(this).val("");
			}else {
				$(this).css('border', '1px solid #ced4da');
			}
		});
		
		/////////////// border 값 및 값 비우기 처리 함수////////////////////////
		// 최대인원
		$("#maxcnt_id").focusin(function() {
			$(this).css('border', '3px solid #6610f2');
			$(this).val("");
		});
		
		// 스터디 이름 
		$("#mem_name_id").focusin(function() {
			$(this).css('border', '3px solid #6610f2');
			$(this).val("");
		});
		$("#mem_name_id").focusout(function() {
			$(this).css('border', '1px solid #ced4da');
		});
		
		// 한줄 소개
		$("#info_id").focusin(function() {
			$(this).css('border', '3px solid #6610f2');
		});
		$("#info_id").focusout(function() {
			$(this).css('border', '1px solid #ced4da');
		});
		
		// 카테고리
		$("#category_id").focusin(function() {
			$(this).css('border', '3px solid #6610f2');
		});
		$("#category_id").focusout(function() {
			$(this).css('border', '1px solid #ced4da');
		});
		
		// 지역 (시)
		$("#selectLocationSi").focusin(function() {
			$(this).css('border', '3px solid #6610f2');
		});
		$("#selectLocationSi").focusout(function() {
			$(this).css('border', '1px solid #ced4da');
		});
		
		// 지역(구)
		$("#selectLocationGu").focusin(function() {
			$(this).css('border', '3px solid #6610f2');
		});
		$("#selectLocationGu").focusout(function() {
			$(this).css('border', '1px solid #ced4da');
		});
		
		// 상세 소개글
		$("#content_id").focusin(function() {
			$(this).css('border', '3px solid #6610f2');
		});
		$("#content_id").focusout(function() {
			$(this).css('border', '1px solid #ced4da');
		});
		///////////////////////////////////////////////////////////////
		
		// 헤더 메뉴 선택 시 h1태그 이름 변경
		var menuName = $(".active").text().trim();
		$(".hero-text h1").text(menuName);
		$(".justify-content-center").css({"background-image":"url('resources/assets/img/img_study2.png')"
									,"background-size":"contain"});
		
	});
	
	// 이미지 미리보기 함수
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				
				if(e.target.result.substring(5,10) == 'image') {
					$("#image-section").empty();
					$("#image-section").append("<img id='studyMainPhoto' src='"+e.target.result+"' />");
				}else {
					alert("이미지 확장자만 업로드 가능합니다.");
					$("#fileinput").val("");	// 보통 브라우저에서 file 값 초기화 방법
					$("#fileinput").replaceWith($("#fileinput").clone(true));	// IE version 초기화방법
					$("#image-section").empty();
					return false;
				}
				
			}
			
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	// submit 조건 검사
	function frmsubmit() {
		var mem_name = $("#mem_name_id").val();
		var info = $("#info_id").val();
		var category = $("#category_id option:selected").val();
		var locationSi = $("#selectLocationSi option:selected").val();
		var locationGu = $("#selectLocationGu option:selected").val();
		var maxcnt = $("#maxcnt_id").val();
		var content = $("#content_id").val();
		
		var errorMsg = "";
		
		if(mem_name == "" || mem_name == null || mem_name == undefined ||
						( mem_name != null && typeof mem_name == "object" && !Object.keys(mem_name).length )) {
			$("#mem_name_id").css('border', '1.5px solid red');
			errorMsg += "스터디 이름 / ";
		}
		if(info == "" || info == null || info == undefined ||
				( info != null && typeof info == "object" && !Object.keys(info).length )) {
			$("#info_id").css('border', '1.5px solid red');
			errorMsg += "한줄 소개 / "
		}
		if(category == "카테고리 분류") {
			$("#category_id").css('border', '1.5px solid red');
			errorMsg += "카테고리 / ";
		}
		if(locationSi == "(시 단위)") {
			$("#selectLocationSi").css('border', '1.5px solid red');
			errorMsg += "지역(시) / ";
		}
		if(locationGu == "(구/군 단위)") {
			$("#selectLocationGu").css('border', '1.5px solid red');
			errorMsg += "지역(구/군) / ";
		}
		if(maxcnt == "" || maxcnt == null || maxcnt == undefined ||
				( maxcnt != null && typeof maxcnt == "object" && !Object.keys(maxcnt).length )) {
			$("#maxcnt_id").css('border', '1.5px solid red');
			errorMsg += "최대 인원 / ";
		}
		if(content == "" || content == null || content == undefined ||
				( content != null && typeof content == "object" && !Object.keys(content).length )) {
			$("#content_id").css('border', '1.5px solid red');
			errorMsg += "상세 소개글 ";
		}
		
		if(!(errorMsg == null) && !(errorMsg == "")) {
			alert(errorMsg+"항목을 모두 기입해주세요. (스터디 대표사진은 미입력 가능)");
			return false;
		}
		
	} // submit 종료
	
</script>
</head>
<body>
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<!--main conternt 섹션-->
	<div class="main-section">
		<form method="post" enctype="multipart/form-data" action="createStuddype.do"
				 onsubmit='return frmsubmit();' autocomplete="off" >
			<input type="hidden" name="leader_no" value="${login.mem_no }">
			<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
			<div id="main-contrainer">
			<!-- 메인 왼쪽 영역 -->
				<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
				<div id="mainleft">
					<div class="form-group">
						<label>스터디 이름</label><input type="text" class="form-control"
							name="s_name" placeholder="스터디 이름" id="mem_name_id">
					</div>

					<div class="form-group" >
						<label>스터디 한줄 소개</label><input type="text" class="form-control"
							name="s_info" placeholder="스터디 한줄 소개" id="info_id">
					</div>

					<div>
						<label>스터디 카테고리</label><select class="form-control" id="category_id"
							name="cate_no">
							<option>카테고리 분류</option>
							<c:forEach var="category" items="${catedtos }">
								<option value="${category.cate_no }">${category.cate_name }</option>
							</c:forEach>
						</select>
					</div>

					<div>
						<label>스터디 지역(시)</label> <select class="form-control"
							name="si_no" id="selectLocationSi">
							<option>(시 단위)</option>
							<c:forEach var="locationsi" items="${sidtos}">
								<option value="${locationsi.si_no }">${locationsi.si_name }</option>
							</c:forEach>
						</select>
					</div>

					<div>
						<label>스터디 지역(구/군)</label> <select class="form-control"
							name="gu_no" id="selectLocationGu">
							<option>(구/군 단위)</option>
							<c:forEach var="locationgu" items="${ gudtos}">
								<option class="${locationgu.si_no }"
									value="${locationgu.gu_no }">${locationgu.gu_name }</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="s_maxcnt">스터디 최대 인원</label> <input type="text"
							class="form-control" name="s_maxcnt" placeholder="2인 이상" id="maxcnt_id">
					</div>

				</div>

				<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
			<!-- 메인 오른쪽 영역(이미지) -->
				<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
				<div id="mainright">
					<div class="form-group" id="file">
						<label>스터디 대표사진</label>
						<div id="image-section">
							<img style="position:relative; top:20%; width:200px; height:200px;" id="image_section" src="./resources/assets/img/icon_photoUpload.png" />
						</div>
						<input type="file" name="file" id="fileinput">
					</div>
				</div>
				<!-- --------------------------------------------------------------------------------------------------------------------------------- -->

				<!-- 메인 하단 영역 -->
				<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
				<div id="mainbottom">
					<label>스터디 상세 소개글</label>
					<textarea class="form-control" rows="10" cols="3" name="s_content" id="content_id"
						placeholder="스터디 상세 소개글"></textarea>
				</div>
				<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
			</div>
			<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
			<div id="btndiv">
				<button type="submit" class="submitBtn">스터디 생성</button>
			</div>
		</form>

	</div>

	<jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>
</body>
</html>