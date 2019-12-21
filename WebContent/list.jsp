<%@page import="lee.myoung.jae.control.BoardController"%>
<%@page import="lee.myoung.jae.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<Board> boardList = new BoardController().selectList();
%>
    
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전주코딩학원</title>
	<link rel="stylesheet" href="./css/css.css">
</head>
<body>
	<div id="wrap">
		<div id="headerWrap"></div>
		<div id="containerWrap">
			<div class="contTitle">
				<div>
					<strong>추천도서</strong>
					<p>
						"책은 위대한 천재가 인류에게 남긴 유산이다."
						<span>- 에디슨</span>
					</p>
				</div>
			</div>
			<div class="board_list_wrap">
				<div class="board_list_type1">
					<%for(int i=0; i<boardList.size(); i++) {%>
					<%Board board = boardList.get(i); %>
					<div class="item">
						<div class="image"><a href="#"><img src="./img/1.jpeg" alt="사진"></a></div>
						<div class="cont">
							<div class="category">학원소식</div>
							<div class="title"><a href="./view.jsp?id=<%=board.getId()%>"><%=board.getTitle() %></a></div>
							<div class="etc">
								<span><%=board.getWriter() %></span>
								<span><%=board.getWdate() %></span>
							</div>
						</div>
					</div>
					<%} %>
				</div>
				<div class="page_wrap">
					<a href="javascript:pageGo(1)" class="bt first">맨 처음 페이지로 가기</a>
					<a href="javascript:pageGo(1)" class="bt prev">이전 페이지로 가기</a>
					<a href="javascript:pageGo(1)" class="num on">1</a>
					<a href="javascript:pageGo(1)" class="num">2</a>
					<a href="javascript:pageGo(1)" class="num">3</a>
					<a href="javascript:pageGo(1)" class="bt next">다음 페이지로 가기</a>
					<a href="javascript:pageGo(1)" class="bt last">마지막 페이지로 가기</a>
				</div>
				<div class="bt_wrap">
					<a href="./list.jsp" class="bt1 on">목록</a>
					<a href="./write.html" class="bt1">글쓰기</a>
				</div>
			</div>
		</div>
		<div id="footerWrap"></div>
	</div>
</body>
</html>
    