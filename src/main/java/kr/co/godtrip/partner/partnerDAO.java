package kr.co.godtrip.partner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class partnerDAO {
public partnerDAO() {
	
}

@Autowired
SqlSession sqlSession;

		//호텔 등록
		public void hotelinsert(Map<String, Object> map) {
			sqlSession.insert("partner.hotelinsert", map); 
		}//insert() end
		
		//객실 등록
		public void detailinsert(Map<String, Object> map) {
			sqlSession.insert("partner.detailinsert",map);
		}
		
		//호텔 리스트 출력
		 public List<Map<String, Object>>hotellist(String p_id){
				return sqlSession.selectList("partner.hotellist",p_id);
		}
		 
		//객실 리스트 출력 
		public List<Map<String, Object>>hoteldetailList(String hotel_code){
			return sqlSession.selectList("partner.hoteldetailList",hotel_code);
		}
		
		//예약된 객실 일정 출력
		public List<Map<String, Object>>roomcheck(String room_code){
			return sqlSession.selectList("partner.roomcheck",room_code);
		}
		 
		 //숙박 정보 삭제하기
		 public void hoteldelete(String hotel_code) {
			 sqlSession.delete("partner.hoteldelete",hotel_code);
		 }
		 
		 //객실 정보 삭제하기 
		 public void roomdelete(String room_code) {
			 sqlSession.delete("partner.roomdelete",room_code);
		 }
		

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
			 sqlSession.update("partner.update",map);
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
					
					partnerDTO mDto=new partnerDTO();
					mDto.setP_name(p_name);
					mDto.setP_email(p_email);
					mDto.setP_passwd(p_passwd);
					System.out.println(mDto.toString());
					int cnt= sqlSession.update("partner.renewPW", mDto);
					
				    return cnt;
				}
				
///////////////////////////////////////////////////////////////////////////////////////////////
	
	public List<Map<String, Object>> F_infoList(String p_id) {
		return sqlSession.selectList("partner.F_infoList", p_id);
	}//F_infoList() end
	
	
	public List<Map<String, Object>> T_infoList(String p_id) {
		return sqlSession.selectList("partner.T_infoList", p_id);
	}//T_infoList() end
	
	
	public void F_infoInsert(Map<String, Object> map) {
		sqlSession.insert("partner.F_infoInsert", map);
	}//F_infoInsert() end
	
	
	public void T_infoInsert(Map<String, Object> map) {
		sqlSession.insert("partner.T_infoInsert", map);
	}//T_infoInsert() end
	
	
	public void F_proInsert(Map<String, Object> map) {
		sqlSession.insert("partner.F_proInsert", map);
	}//F_proInsert() end
	
	
	public void T_proInsert(Map<String, Object> map) {
		sqlSession.insert("partner.F_proInsert", map);
	}//T_proInsert() end
	
	
	public List<Map<String, Object>> F_proList(String p_id) {
		return sqlSession.selectList("partner.F_proList", p_id);
	}//F_proList() end
	
	
	public List<Map<String, Object>> T_proList(String p_id) {
		return sqlSession.selectList("partner.T_proList", p_id);
	}//T_proList() end
	
	
	public void F_infoDelete(String trans_code) {
		sqlSession.delete("partner.F_infoDelete", trans_code);
	}//F_infoDelete() end
	
	
	public void T_infoDelete(String trans_code) {
		sqlSession.delete("partner.T_infoDelete", trans_code);
	}//T_infoDelete() end
	
	
	public void F_proDelete(String transpro_code) {
		sqlSession.delete("partner.F_proDelete", transpro_code);
	}//F_proDelete() end
	
	
	public void T_proDelete(String transpro_code) {
		sqlSession.delete("partner.T_proDelete", transpro_code);
	}//T_proDelete() end
	
}
