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
	 public List<Map<String, Object>> list2(Map<String, Object> map){
	  	    return sqlSession.selectList("hotel.list2",map);
	 }//list() end
	
	 //총 호텔갯수 가져오기
	 public int totalRowCount(Map<String, Object>map) {
	        return sqlSession.selectOne("hotel.totalRowCount",map);
	    }
	 
	
	 
	

}//class end
