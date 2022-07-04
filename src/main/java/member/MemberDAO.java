package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MemberDAO {
	
	Connection con; //연결된 객체 저장
	PreparedStatement ps; //명령어 전송 객체
	ResultSet rs; //결과 저장 객체
	
	public MemberDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("생성자 실행");
	}
	
	public int userChk(String id, String pwd) {
		System.out.println("dao id : " + id);
		System.out.println("dao pwd : " + pwd);
		//입력한 아이디가 일치하면 데이터를 가져오고, 아이디가 일치하지 않으면 데이터를 가져오지 않는다.
		String sql = "select * from members where id = ?";
		int result=0;
		
		try {
			ps = con.prepareStatement(sql);
			//select * from members where id = 'aaa'
			ps.setString(1, id);
			rs = ps.executeQuery(); //결과값을 가져와서 저장
			if(rs.next()) {
				System.out.println("해당 아이디는 존재합니다");
				if(pwd.equals( rs.getString("pwd"))) { //사용자가 입력한 값과 DB에서 값을 비교
					System.out.println("로그인 성공");
					result = 1;
				} else {
					System.out.println("비밀번호 틀림");
					result = 0;
				}
			} else {
				System.out.println("아이디가 존재하지 않습니다.");
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<MemberDTO> getMember() {
		String sql = "select * from members";
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				MemberDTO dto = new MemberDTO();
				dto.setId( rs.getString("id") );
				dto.setPwd( rs.getString("pwd") );
				dto.setName( rs.getString("name") );
				dto.setAddr( rs.getString("addr") );
				dto.setTel( rs.getString("tel") );
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public int saveMember(String id, String pwd, String name, String addr, String tel) {
		String sql = "insert into members(id, pwd, name, addr, tel) values (?,?,?,?,?)";
		int result = 0;
		
			try {
				ps = con.prepareStatement(sql);
				
				ps.setString(1, id);
				ps.setString(2, pwd);
				ps.setString(3, name);
				ps.setString(4, addr);
				ps.setString(5, tel);
				
				result = ps.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
	}
	
	public MemberDTO getInfo(String id) {
		String sql = "select * from members where id = ?";
		MemberDTO dto = new MemberDTO();
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
