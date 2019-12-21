<%@page import="lee.myoung.jae.control.BoardController"%>
<%@page import="lee.myoung.jae.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String param1 = request.getParameter("id");
	Board param = new Board();
	param.setId(Integer.parseInt(param1));
	
	BoardController control = new BoardController();
	Board board = control.selectOne(param);
%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전주코딩학원</title>
	<link rel="stylesheet" href="./css/css.css">
	<script src="./js/jquery-1.12.1.min.js"></script>
    <script type="text/javascript">
		function updateBoard(){
			var url = $("form").attr("action");
			var param = $("form").serialize();

			$("form").submit();
		}
	</script>
</head>
<body>
	<div id="wrap">
		<div id="headerWrap"></div>
		<div id="containerWrap">
            <div class="contTitle">
                <div>
                    <strong>학원소식</strong>
                    <p>
                        "위대한 일을 해낼 수 없다면 작은 일을 위대하게 행하라."
                        <span>- 마틴 루터 킹</span>
                    </p>
                </div>
            </div>
			<div class="board_write_wrap">
                <div class="board_write">
                    <form action="./edit.jsp" method="post">
                        <dl>
                            <dt>카테고리</dt>
                            <dd>
                                <select name="boardType">
                                    <option value="1">학원소식</option>
                                    <option value="2">공지사항</option>
                                    <option value="3">개강안내</option>
                                </select>
                            </dd>
                        </dl>
                        <dl class="title">
                            <dt>제목</dt>
                            <dd><input type="text" placeholder="제목 입력" name="title" value="<%=board.getTitle()%>"></dd>
                        </dl>
                        <dl class="content">
                            <dd>
                            	<textarea name="content" id="ir1" rows="10" cols="100" style="width:766px; height:412px;">
                            		<%=board.getContent().trim() %>
                            	</textarea>
                            </dd>
                        </dl>
                        <dl class="image">
                            <dt>사진</dt>
                            <dd>
                                <input type="button" value="사진 등록" class="bt2">
                                <ul>
                                    <li>
                                        <span>파일명.jpg</span>
                                        <input type="button" value="삭제" class="bt_del">
                                    </li>
                                </ul>
                            </dd>
                        </dl>
                        <input type="hidden" name="id" value="<%=board.getId() %>"/>
                    </form>
                </div>
				<div class="bt_wrap">
					<a href="javascript:updateBoard();" class="bt1 on">저장</a>
					<a href="#" class="bt1">취소</a>
				</div>
			</div>
		</div>
		<div id="footerWrap"></div>
	</div>
</body>
</html>