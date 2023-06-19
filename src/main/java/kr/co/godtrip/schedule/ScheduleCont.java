package kr.co.godtrip.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/schedule")
public class ScheduleCont {

	public ScheduleCont() {
		System.out.println("-----ScheduleCont() 객체생성됨");
	}
	
    @Autowired
    ScheduleService scheduleService;

    @PostMapping("/save")
    @ResponseBody
    public String saveSchedule(@RequestParam("date") String date) { 
        try {
            scheduleService.saveSchedule(date);
            return "success";
        } catch(Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @GetMapping("/scheduleForm")
    public String scheduleForm() {
        return "schedule/scheduleForm";
    }
    
    
    
}
