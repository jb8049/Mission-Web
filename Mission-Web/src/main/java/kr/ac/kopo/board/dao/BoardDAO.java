package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	
	// t_board sequence (게시판의 pk) 추출
	public int selectNo() {
		
		int no = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("select seq_t_board_no.nextval from dual ");
		// seq_t_board_no는 게시물의 pk, nextval을 통해 새로운 게시물 번호를 불러옴
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				) {
				
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					no = rs.getInt(1);  // 컬럼한 개 뿐이니까
					
				}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return no;
		
	}
	
	
	// 게시글 등록
	public void insert(BoardVO board) {   

		StringBuilder sql = new StringBuilder();

		sql.append(" insert into t_board(no, title, writer, content) ");
		sql.append(" values(?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			int loc = 1;
			
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());

			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

	}
	
	// 게시판 조회
	public List<BoardVO> selectAll() {
		
		List<BoardVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
	 	sql.append(" select no,title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	 	sql.append(" from t_board ");
	 	sql.append(" order by no desc ");

	 	// try문에 들어오는 것과 안들어오는 것 차이 정확히 뭐임? auto closable
		try(
				Connection conn =new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int no = rs.getInt("no");
		 		String title = rs.getString("title"); 
		 		String writer = rs.getString("writer");
		 		String regDate = rs.getString("reg_date");
		 		
		 		BoardVO board = new BoardVO();
		 		board.setNo(no);
		 		board.setTitle(title);
		 		board.setWriter(writer);
		 		board.setRegDate(regDate);
				
				list.add(board);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return list;
		
	}
	
	// 상세 게시글 조회
	
	public BoardVO selectOne(int no) {
		
		BoardVO board = new BoardVO();
		StringBuilder sql = new StringBuilder();
		
		sql.append(" select no,title, writer, content, view_cnt ");
		sql.append("  , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append(" from t_board ");
		sql.append(" where no = ? ");
		
		try(
				Connection conn =new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setInt(1, no);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				int boardNo = rs.getInt("no"); // EL로 해보자!
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content =rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				board.setNo(boardNo);
				board.setTitle(title);
				board.setWriter(writer);
				board.setContent(content);
				board.setViewCnt(viewCnt);
				board.setRegDate(regDate);
				
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return board;

	}
	
	
	// 상세 게시글 삭제
	public void delete(int no) {
		
		StringBuilder sql = new StringBuilder();

		sql.append(" delete from t_board ");
		sql.append(" where no=? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, no);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	// 상세 게시글 수정 전 조회하기
	public BoardVO modifyChk(int no){
		
		BoardVO board = new BoardVO();
		StringBuilder sql = new StringBuilder();

		sql.append(" select * from t_board ");
		sql.append(" where no= ? ");
		
		
		
		
		try (Connection conn = new ConnectionFactory().getConnection();
			// 열고 닫기 할 수 있는 괄호()
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
			
	 		String title = rs.getString("title");
	 		String content = rs.getString("content");
	 		
	 		board.setTitle(title);
	 		board.setContent(content);
	 		board.setNo(no);  // modifyjsp에서 활용하기 위해 설정함
	 		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}
	
	
	// 상세 게시글 수정
	
	public void modify(BoardVO board) {
		

		StringBuilder sql = new StringBuilder();
		
		sql.append(" update t_board set title=?, content=? ");
		sql.append(" where no = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
				
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getContent());
				pstmt.setInt(3, board.getNo());
				
				pstmt.executeUpdate();
			
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	public void viewCount(BoardVO board) {
		
		// update해주어야함
		
		StringBuilder sql = new StringBuilder();
		
		sql.append(" update t_board set view_cnt = view_cnt + 1 ");
		sql.append(" where no=? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
				
			pstmt.setInt(1, board.getNo());
			pstmt.executeUpdate();			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	///////////////////////////////////////////////////////////////////////////
	////////////	t_board_file 테이블의 CRUD
	///////////////////////////////////////////////////////////////////////////
	
	public void insertFile(BoardFileVO fileVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board_file(no, board_no, file_ori_name ");
		sql.append("     , file_save_name, file_size) ");
		sql.append(" values(seq_t_board_file_no.nextval, ?, ?, ?, ?) ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				){
			
				int loc = 1; // 후위 증가
				pstmt.setInt(loc++, fileVO.getBoardNo());
				pstmt.setString(loc++, fileVO.getFileOriName());
				pstmt.setString(loc++, fileVO.getFileSaveName());
				pstmt.setInt(loc++, fileVO.getFileSize());
				
				pstmt.executeUpdate();
				
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardFileVO> selectFileByNo(int boardNo){
		
		List<BoardFileVO> fileList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		
		sql.append(" select NO, FILE_ORI_NAME, FILE_SAVE_NAME, FILE_SIZE ");  // 구분자 역할을 하는 시퀀스 번호도 가져옴
  		sql.append(" from t_board_file ");
  		sql.append(" where board_no=? ");
  		
  		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				
  		) {
  			
  			pstmt.setInt(1, boardNo);
  			
  			ResultSet rs = pstmt.executeQuery();
			
  			while(rs.next()) { // 게시물에 대한 첨부파일이 최대 2개가 있으니까
  				
  				BoardFileVO fileVO =  new BoardFileVO();
  				fileVO.setNo(rs.getInt("no"));
  				fileVO.setFileOriName(rs.getString("file_ori_name"));
  				fileVO.setFileSaveName(rs.getString("file_save_name"));
  				fileVO.setFileSize(rs.getInt("file_size"));
  				
  				fileList.add(fileVO);
  				
  			}

			
		}catch (Exception e) {
			e.printStackTrace();
		}
  		
  		return fileList;
		
	}
	
	/*
	 * public static void main(String[] args) { BoardDAO dao = new BoardDAO();
	 * List<BoardFileVO> fileList = dao.selectFileByNo(19); for(BoardFileVO file :
	 * fileList) { System.out.println(file); }
	 * 
	 * }
	 */
}
