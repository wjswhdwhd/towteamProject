<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<title></title>
<style type="text/css">
#wapper {
	width: 100%;
}

#wapper #accountId {
	width: 500px;
	margin: auto;
}
</style>
</head>
<body>
	<div id="wapper">
		<div id="accountId">
			<div>아이디 찾기</div>
			<div>
				<input type="email" id="email" placeholder="회원가입시 입력 한 E-mail"><input
					type="button" id="sendEmail" value="제출">
				<div id="idSection"></div>
				<input type="button" value="되돌아가기" onclick="history.go(-1);">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(document).on("click", ".pwFind", function() {
				var m_number = $(this).attr("data-num");
				var m_id = $(this).attr("data-value");
				location.href="/sendMail/password?m_number="+m_number+"&m_id="+m_id;
			});
			$("#email").change(function() {
				$("#selectMemberId").empty();
			});
			$("#sendEmail").on("click", function() {
				$.ajax({
					type : "post",
					url : "/sendMail/id",
					data : "email=" + $("#email").val(),
					error : function() {
						alert("네트워크 에러!");
						return false;
					},
					success : function(result) {
						if (result != null) {
							$(result).each(function() {
								var m_id = this.m_id;
								var m_number = this.m_number;
								addItem(m_id, m_number);
							});
						} else {
							addItem("해당 이메일로 가입한 아이디가 존재하지 않습니다.");
						}
					}
				});
			});
		});
		function addItem(m_id, m_number) {
			var span = $("<span>");
			span.addClass("idSpan");
			
			var li = $("<li>");
			li.addClass("idLi");
			li.html("ID : " + m_id);
			
			var button = $("<input>");
			button.attr("data-num", m_number);
			button.attr("data-value", m_id);
			button.attr("type", "button");
			button.attr("value", "비밀번호찾기");
			button.addClass("btn btn-default pwFind");
			
			span.append(li).append(button);
			$("#idSection").append(span);
		};
	</script>
</body>
</html>