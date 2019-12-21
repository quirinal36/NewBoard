<%@page import="lee.myoung.jae.control.BoardController"%>
<%@page import="lee.myoung.jae.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int id = Integer.parseInt(request.getParameter("id"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Board board = new Board();
	board.setId(id);
	board.setTitle(title);
	board.setContent(content);
	
	BoardController control = new BoardController();
	int result = control.updateBoard(board);
	
	out.print("result: " + result);	
%>
<script type="text/javascript">
	alert("수정이 완료되었습니다.");
	window.location.replace("./view.jsp?id=<%=board.getId()%>");
</script>