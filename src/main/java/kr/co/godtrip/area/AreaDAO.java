package kr.co.godtrip.area;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AreaDAO {
	public AreaDAO() {
		System.out.println("-----AreaDAO() 객체생성됨");
	}
	
	@Autowired
	SqlSession sqlSession;
	
	public void areaList(AreaDTO dto) {
		sqlSession.insert("area.serviceForm", dto);
	}
	
	
	
}
