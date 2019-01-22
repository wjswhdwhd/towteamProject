<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>리뷰 작성 페이지</title>
<style>
.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('/resources/include/images/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label{
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>


<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/star.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#r_insertBtn").click(function() {
			if (!chkSubmit($('#r_title'), "제목을"))
				return;
			else if (!chkSubmit($('#r_content'), "내용을"))
				return;
			else {
				if ($('#file').val() != "") {
					if (!chkFile($('#file')))
						return;
				}
				$("#r_writeForm").attr({
					"method" : "post",
					"action" : "/review/reviewInsert"
				});
				$("#r_writeForm").submit();
			}
		});

		$("#r_cancelBtn").click(function() {
			window.location.href = "/review/reviewList";
		});

		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});

		var starRating = function() {
			var $star = $(".star-input"), $result = $star.find("output>b");
			$(document).on("focusin", ".star-input>.input", function() {
				$(this).addClass("focus");
			}).on("focusout", ".star-input>.input", function() {
				var $this = $(this);
				setTimeout(function() {
					if ($this.find(":focus").length === 0) {
						$this.removeClass("focus");
					}
				}, 1000);
			}).on("change", ".star-input :radio", function() {
				$result.text($(this).next().text());
			}).on("mouseover", ".star-input label", function() {
				var $checked = $star.find(":checked");
				if ($checked.length === 0) {
					$result.text("0");
				} else {
					$result.text($checked.next().text());
				}
			});
		};
		starRating();
	});
</script>
</head>
<body>
	<%
		int p_number = (Integer) session.getAttribute("p_number");
	%>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>리뷰 작성 페이지</h3>
		</div>
		<div class="contentTB">
			<form id="r_writeForm" name="r_writeForm"
				enctype="multipart/form-data">
				<table id="reviewWrite">
					<tr>
						<td>*적립혜택 : 리뷰 등록 시 마일리지 300점이 지급됩니다.</td>
					<tr>
						<td class="product_name">상품명</td>
						<td><%-- <%=session.getAttribute("p_name")%><input type="hidden"
							name="p_number" id="p_number"
							value=<%=p_number%> --%></td>
					</tr>
					<tr>
						<td class="product_starrate">평점</td>
						<td><div class="star-input">
								<span class="input"> <input type="radio"
									name="r_starrate" id="p1" value="1"> <label for="p1">1</label>
									<input type="radio" name="r_starrate" id="p2" value="2">
									<label for="p2">2</label> <input type="radio" name="r_starrate"
									id="p3" value="3"> <label for="p3">3</label> <input
									type="radio" name="r_starrate" id="p4" value="4"> <label
									for="p4">4</label> <input type="radio" name="r_starrate"
									id="p5" value="5"> <label for="p5">5</label>
								</span>
								<output for="star-input">
									<b>0</b>점
								</output>
							</div></td>
					</tr>
					<tr>
						<td class="title">제목</td>
						<td><input type="text" name="r_title" id="r_title"></td>
					</tr>
					<tr>
						<td class="content">내용</td>
						<td><input type="text" name="r_content" id="r_content"></td>
					</tr>
					<tr>
						<td class="fileupload">첨부파일</td>
						<td><input type="file" name="file" id="file"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="contentBtn">
			<input type="button" value="등록" id="r_insertBtn"> <input
				type="button" value="취소" id="r_cancelBtn">
		</div>
	</div>
</body>
</html>