<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js">
	
</script>
<script type="text/javascript" src="/resources/include/js/join.js"></script>
<title></title>
</head>
<body>
	<div>
		<div>비밀번호를 변경합니다.</div>
		<input type="hidden" id="m_id" name="m_id"
			value="<%=(String) request.getParameter("m_id")%>">
			<input type="hidden" id="m_number" name="m_number"
			value="<%=(String) request.getParameter("m_number")%>">
		<div>
			<input type="password" name="m_password" id="m_password"
				placeholder="비밀번호 재 입력"> <input type="password"
				name="passwordChk" id="passwordChk" placeholder="변경할 비밀번호 입력">
			<br>
		</div>
		<div id="password"></div>
		<div>
			<input type="button" value="변경하기" id="joinBtn" disabled="disabled">
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#passwordChk").keyup(function() {
			$("#password").empty()
			if ($("#m_password").val() == $("#passwordChk").val()) {
				$("#password").append("비밀번호 일치").css("color", "blue");
			} else {
				$("#password").append("비밀번호 불 일치").css("color", "red");
			}
		});
		if ($("#passwordChk").val() != null) {
			$("#m_password").keyup(function() {
				$("#password").empty()
				if ($("#m_password").val() == $("#passwordChk").val()) {
					$("#password").append("비밀번호 일치").css("color", "blue");
				} else {
					$("#password").append("비밀번호 불 일치").css("color", "red");
				}
			});
		}

		$("#joinBtn").click(function() {
			$.ajax({
				url : "/member/passwordmodifi",
				type : "post",
				data : {
					"m_id" : $("#m_id").val(),
					"m_password" : $("#m_password").val(),
					"m_number":$("#m_number").val()
				},
				success : function(result) {
					if (result == 1) {
						alert("비밀번호 변경완료");
						location.href = "/member/login";
					} else {
						alert("비밀번호 변경 실패");
					}
				}
			});
		});

	});
</script>
</html>