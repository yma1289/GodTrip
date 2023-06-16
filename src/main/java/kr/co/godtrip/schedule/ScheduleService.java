package kr.co.godtrip.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {

	@Autowired
    ScheduleDAO scheduleDAO;
    
    public void saveSchedule(String date) throws Exception {
        scheduleDAO.saveSchedule(date);
    }
    
    
}
