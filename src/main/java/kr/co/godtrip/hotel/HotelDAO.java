package kr.co.godtrip.hotel;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository

public class HotelDAO {

	public HotelDAO() {
		System.out.println("---HotelDAO 객체 생성");
	}
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
	
    //호텔db값 가져오기
	 public List<Map<String, Object>> list(Map<String, Object> map){
     	    return sqlSession.selectList("hotel.list", map);
     }//list() end
	
	//객실db값 가져오기
	 public List<Map<String, Object>> list2(String hotel_code){
  	    return sqlSession.selectList("hotel.list2",hotel_code);
	 }//list() end
	 
	//호텔입력
	 public void insert(Map<String, Object> map) {
	    	sqlSession.insert("hotel.insert", map); 
	 }//insert() end	 
	

	 //객실입력
	 public void detailinsert(Map<String, Object>map) {
		 sqlSession.insert("hotel.detailinsert",map);
	 }
	 
	 //총 호텔갯수 가져오기
	 public int totalRowCount(Map<String, Object>map) {
	        return sqlSession.selectOne("hotel.totalRowCount",map);
	    }
	 
	 //숙박 정보 삭제하기
	 public void delete(String hotel_code) {
		 sqlSession.delete("hotel.delete",hotel_code);
	 }
	 
	 public List<Map<String, Object>>partnerlist(String p_id){
		return sqlSession.selectList("hotel.partnerlist",p_id);
	 }
	 
}//class end
