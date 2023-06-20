package kr.co.godtrip.partner;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.godtrip.member.MemberDTO;

@Repository
public class partnerDAO {
public partnerDAO() {
	
}

@Autowired
SqlSession sqlSession;

		//회원가입
		public void insert(partnerDTO dto) {
			sqlSession.insert("partner.insert",dto);
			System.out.println(dto.toString());
		}

		//중복체크 p_id
		public int duplicateId(String p_id) {
				return sqlSession.selectOne("partner.duplicateId",p_id);
			}
		
		//중복체크 p_email
		public int duplicateemail(String p_email) {
			return sqlSession.selectOne("partner.duplicateEmail",p_email);
		}
		
		//
		public partnerDTO loginProc(String p_id,String p_passwd) {
		    Map<String, String> paramMap = new HashMap<>();
		    paramMap.put("p_id", p_id);
		    paramMap.put("p_passwd", p_passwd);
		    System.out.println(paramMap);
		    return sqlSession.selectOne("partner.loginProc", paramMap);
		    
		}
		
		
		//회원 정보 불러오기
		public partnerDTO select(String p_id) {
			return sqlSession.selectOne("partner.select", p_id);
		}

		
		//회원 정보 업데이트
		public void update(Map<String, Object>map) {
			 sqlSession.update("member.update",map);
		}
		
		
		// 회원 삭제
		public int delete(String p_id, String p_passwd) {
			// 아이디와 비밀번호가 일치하는 회원을 삭제하는 로직 작성
			// 값을 2개 받아와야 하기때문에 map을 사용.
			// 일치하는 경우 1 아니면 0
			Map<String, String> paramMap = new HashMap<>();
			paramMap.put("p_id", p_id);
			paramMap.put("p_passwd", p_passwd);
			int cnt = sqlSession.delete("partner.partnerdelete", paramMap);
			return cnt;
		}
				
				//아이디 찾기-이메일 보내기  
				public partnerDTO findID(String p_email,String p_name) {
					 
					Map<String,Object> paramMap = new HashMap<>();
					paramMap.put("p_email",p_email);
					paramMap.put("p_name", p_name);
					
					return sqlSession.selectOne("partner.findID",paramMap);
				}
				
				//메일 찾기
				public int renewPW(String p_name, String p_email, String p_passwd) {			
					
					MemberDTO mDto=new MemberDTO();
					mDto.setMname(p_name);
					mDto.setEmail(p_email);
					mDto.setPasswd(p_passwd);
					System.out.println(mDto.toString());
					int cnt= sqlSession.update("partner.renewPW", mDto);
					
				    return cnt;
				}		
}
