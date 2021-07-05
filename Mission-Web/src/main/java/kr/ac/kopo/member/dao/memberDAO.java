package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.member.vo.memberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class memberDAO {
	
	// 회원가입
	public void signUp(memberVO member) {
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("insert into t_member (id, name, password, email_id, email_domain, ");
		sql.append(" tel1, tel2, tel3, post, basic_addr,detail_addr, type, reg_date) ");
		sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate) ");
		
				
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				) {
				
				int loc = 1;
				pstmt.setString(loc++,member.getId());
				pstmt.setString(loc++,member.getName());
				pstmt.setString(loc++,member.getPassword());
				pstmt.setString(loc++,member.getEmailId());
				pstmt.setString(loc++,member.getEmailDomain());
				pstmt.setString(loc++,member.getTel1());
				pstmt.setString(loc++,member.getTel2());
				pstmt.setString(loc++,member.getTel3());
				pstmt.setString(loc++,member.getPost());
				pstmt.setString(loc++,member.getBasicAddr());
				pstmt.setString(loc++,member.getDetailAddr());
				pstmt.setString(loc++,member.getType());
				
				
				pstmt.executeUpdate();
				
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public List<memberVO> selectAll(){
		
		
//		memberVO member = new memberVO(); //처음에 이것을 여기에 선언함, rs.next() 돌 때마다 새로운 객체 만들어야함!!
		// memberList.add(member) member객체의 값이 들어가는게 아니라, '주소값'이 들어간다!!
		// 하나의 객체로 값을 add하니까, memberList에 들어있는 각각의 값의 주소는 동일함..
		// 마지막에 업데이트된 member객체의 값이 memberList 전체에 출력됨
		// 900x라는 주소값을 가지는 member객체, memberList에는 주소값이 들어있다!!
		
		
		List<memberVO> memberList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		
		sql.append(" select id, name, email_id as email, basic_Addr as addr, tel1||'-'||tel2||'-'||tel3 as telphone from t_member ");
		
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
				
				
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					String id = rs.getString("id");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String addr = rs.getString("addr");
					String telphone = rs.getString("telphone");
					
				    memberVO member = new memberVO(); // 반복문 돌릴 때마다 새로운 객체 만들고, 이 객체를 memberList에 넣어야지..
					
					member.setId(id);
					member.setName(name);
					member.setEmail(email);
					member.setAddr(addr);
					member.setTelphone(telphone);
					
					memberList.add(member);
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return memberList;
	}
	
	
//	상세 게시물 조회 게시물 번호 전달받아서
	public memberVO selectOne(String memberId) {
		
		
		//넘겨받은 회원 번호로, 조회 후 객체에 값 넣기 ,  이 객체를 다시 돌려주기
		
		
		
		StringBuilder sql = new StringBuilder();
		memberVO member = new memberVO();
		
		sql.append(" select id, name, password, EMAIL_ID||'@'||EMAIL_DOMAIN as email, ");
		sql.append(" tel1||'-'||tel2||'-'||tel3 as telphone, post, BASIC_ADDR||' '||DETAIL_ADDR as addr, ");
		sql.append(" type, reg_date from t_member where id=?" );
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				) {
			
				pstmt.setString(1, memberId);
				
				
				ResultSet rs = pstmt.executeQuery();
				
				rs.next();
				
				String id = rs.getString("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String telphone = rs.getString("telphone");
				String post = rs.getString("post");
				String addr = rs.getString("addr");
				String type = rs.getString("type");
				String reg_date = rs.getString("reg_date");
				
				
				member.setId(id);
				member.setName(name);
				member.setPassword(password);
				member.setEmail(email);
				member.setTelphone(telphone);
				member.setPost(post);
				member.setAddr(addr);
				member.setType(type);
				member.setRegDate(reg_date);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return member;
		

	}
}
