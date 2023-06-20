package kr.co.godtrip.roomreservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository

public class RoomreservationDAO {

	@Autowired
    SqlSession sqlSession;
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("roomreservation.insert", map); 
	}
	
	public List<Map<String, Object>>list(String room_code){
		return sqlSession.selectList("roomreservation.list", room_code);
	}
}
