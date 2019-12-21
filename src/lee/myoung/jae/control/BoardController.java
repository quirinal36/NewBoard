package lee.myoung.jae.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import lee.myoung.jae.db.DBConn;
import lee.myoung.jae.vo.Board;

public class BoardController {
	final static Logger logger = Logger.getLogger(BoardController.class.getSimpleName());
	
	/**
	 * 게시판 입력하는 함수
	 * @param input
	 * @return
	 */
	public int insert(Board input) {
		int result = 0;
		
		DBConn db = new DBConn();
		
		try(Connection conn = db.getConnection()){
			// 데이터베이스 쿼리문 만들기
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO new_board (title, writer, content)")
				.append(" ")
				.append("VALUES (?,?,?)");
			
			// 쿼리문에 게시판 정보 (제목, 글쓴이, 내용) 물음표에 맞게 집어넣기
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, input.getTitle());
			pstmt.setString(2, input.getWriter());
			pstmt.setString(3, input.getContent());
			
			logger.info(pstmt.toString());
			
			// 데이터베이스 쿼리문 실행하기
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Board> selectList(){
		List<Board> result = new ArrayList<Board>();
		DBConn db = new DBConn();
		try (Connection conn = db.getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT id, title, writer, content, wdate FROM new_board ");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery(); // 쿼리문 실행
			while(rs.next()) {
				Board item = new Board();
				item.setId(rs.getInt("id"));
				item.setTitle(rs.getString("title"));
				item.setWriter(rs.getString("writer"));
				item.setContent(rs.getString("content"));
				item.setWdate(rs.getString("wdate"));
				
				result.add(item);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Board selectOne(Board input) {
		DBConn db = new DBConn();
		try (Connection conn = db.getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT id, title, writer, content, wdate FROM new_board WHERE id = ?");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, input.getId());
			
			ResultSet rs = pstmt.executeQuery(); // 쿼리문 실행
			if(rs.next()) {
				input.setTitle(rs.getString("title"));
				input.setWriter(rs.getString("writer"));
				input.setContent(rs.getString("content"));
				input.setWdate(rs.getString("wdate"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return input;
	}
	
	public int deleteBoard(Board input) {
		int result = 0;
		DBConn db = new DBConn();
		try (Connection conn = db.getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM new_board WHERE id = ?");
			
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, input.getId());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateBoard(Board input) {
		int result = 0;
		DBConn db = new DBConn();
		try (Connection conn = db.getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE new_board SET title=?, content=? WHERE id = ?");
			
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, input.getTitle());
			pstmt.setString(2, input.getContent());
			pstmt.setInt(3, input.getId());
			
			logger.info(pstmt.toString());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
}
