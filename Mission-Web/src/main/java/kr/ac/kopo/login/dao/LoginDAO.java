package kr.ac.kopo.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.login.vo.LoginVO;
import kr.ac.kopo.util.ConnectionFactory;

public class LoginDAO {
	
	/**
	 * 사용자가 입력한 ID, PASSWORD로 로그인 여부 판단
	 * @return 해당 LoginVO
	 * @param loginVO 로그인 시 입력한 id, password를 포함
	 * DAO란 DB를 사용해 데이터를 조회하거나 조작하는 기능을 전담하도록 만든 오브젝트 (Data Access Object)
	 */
	
	public LoginVO login(LoginVO loginVO) {  // id와 password를 가지고 있는 LoginVO가 날아옴
		
		//  if(rs.next()) 이후 다시 올라옴
		
		LoginVO userVO = null ;  // 로그인 성공하면, userVO가 id, name을 기억해야함

		// auto클로저블(자동으로 pstmt,conn을 열고 닫음) 인터페이스를 상속받지 않기 때문에, try문 밖에다 해줘야함
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select id,name,type ");
		sql.append(" from t_member ");
		sql.append(" where id = ? and password = ? ");
		
		// 1.7버전의 try catch 사용
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
		){ //여기가 try 블럭
			
		   pstmt.setString(1, loginVO.getId());
		   pstmt.setString(2, loginVO.getPassword());
		   
		   ResultSet rs = pstmt.executeQuery();
		   
		   if(rs.next()) {
			   
			   userVO = new LoginVO();   // DB를 조회해보니, 사용자가 입력한 아이디와 비밀번호가 존재함
			   userVO.setId(rs.getString("id"));  // LoginVO userVO 객체에 id, name, type 정보 담아서 return
			   userVO.setName(rs.getString("name"));
			   userVO.setType(rs.getString("type"));
		   }
		  
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		 return userVO; // if(rs.next())가 false이면, userVO = null 이 반환됨
	}
	
}














