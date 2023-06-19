package kr.co.godtrip.area;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping()
public class AreaCont {
	public AreaCont() {
		System.out.println("-----AreaCont() 객체생성됨");
	}
	
	@Autowired
	AreaDAO areaDao;
	
	@RequestMapping("/area/areaForm")
	public String areaForm() {
	    return "area/areaForm";
	}
	
	
	
	
}
