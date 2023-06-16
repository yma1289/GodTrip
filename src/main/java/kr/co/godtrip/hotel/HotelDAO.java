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
	
	 //호텔 검색
	 public List<Map<String, Object>> search(String hotel_Name){
	    	return sqlSession.selectList("hotel.search", "%" + hotel_Name.toUpperCase() + "%");
	 }//search() end
	 
	//호텔 타입 분류
	 public List<Map<String, Object>> search2(String hotel_Type){   	
	    	return sqlSession.selectList("hotel.search2", hotel_Type);
	 }//search() end
	 
	 //객실입력
	 public void detailinsert(Map<String, Object>map) {
		 sqlSession.insert("hotel.detailinsert",map);
	 }
	 
	 public int totalRowCount() {
	        return sqlSession.selectOne("hotel.totalRowCount");
	    }
	 
	 
	
}//class end
