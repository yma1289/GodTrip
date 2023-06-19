package kr.co.godtrip.schedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {
	
	public ScheduleDAO() {
		System.out.println("-----ScheduleDAO() 객체생성됨");
	}
    @Autowired
    SqlSession sqlSession;

    public void saveSchedule(String date) throws Exception {
        sqlSession.insert("schedule.saveSchedule", date);
    }
}
