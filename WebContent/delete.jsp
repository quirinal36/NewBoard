<%@page import="lee.myoung.jae.control.BoardController"%>
<%@page import="lee.myoung.jae.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 받아와 문자열->숫자 변환하기
	String strId = request.getParameter("id");
	int id = Integer.parseInt(strId);
	
	// 2. board 객체 만들어, id 값을 지정하기
	Board board = new Board();
	board.setId(id);
	
	// 3. deleteBoard() 메소드에 board 객체 전달하기
	BoardController control = new BoardController();
	int result = control.deleteBoard(board);
%>
<script type="text/javascript">
	alert("삭제가 완료되었습니다.");
	window.location.replace("list.jsp");
</script>