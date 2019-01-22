<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Date" %>
<%
	Date date = new Date();
	String year = date.toString();
%>
<%= year.substring(0, 3) %>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/admin/order/getOrderList.do"><font color="black">우리집고양이</font></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="/admin/order/getOrderList.do">주문관리</a></li>
				<li class="dropdown"><a href="#about" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">상품관리<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/admin/product/productList.do">상품목록</a></li>
						<li><a href="/admin/product/productRegForm.do">상품등록</a></li>
					</ul>
				</li>
				<li><a href="/admin/memberList.do">회원관리</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">통계관리<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/admin/memberStatus">회원통계</a></li>
						<li><a href="/admin/order/salesStats.do?year=&o_state=구매확정">매출통계</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터 관리<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/admin/qna/getQnaList.do">1 : 1 문의 관리</a></li>
						<li><a href="/admin/faq/getFaqList.do">FAQ 게시판 관리</a></li>
						<li><a href="/admin/notice/getNoticeList.do">공지사항 게시판 관리</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판 관리<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/admin/careinfo/careinfoList.do">반려묘 관리법 정보 게시판</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><font>[${ adminId }]</font><span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/mdlist/allmdlist.do">사용자페이지</a></li>
						<li><a href="/admin/adminLogout.do">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>