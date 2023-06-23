package kr.co.godtrip.roomreservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.godtrip.hotel.HotelDAO;


@Controller
@RequestMapping("/")
public class RoomreservationCont {
	
	
	@Autowired
	RoomreservationDAO roomreservationDao;
	
	public RoomreservationCont(){
		System.out.println("------Roomreservation 객체 생성");
	}
	
	
	
	@GetMapping("/roomreservationinsert")
	public ModelAndView roomreservationinsert(HttpServletRequest req){
		//String id=req.getParameter("id"); //나중에 이부분으로 고쳐야 함
		String id="young12"; //임시 아이디
		String room_code=req.getParameter("room_code");
        Map<String, Object> map=new HashMap<>();
        map.put("id", id);
        map.put("room_code", room_code);
		roomreservationDao.insert(map);
		
		 ModelAndView mav = new ModelAndView();
		    mav.setViewName("redirect:/cartlist"); // 리다이렉트로 이동
		    mav.addObject("room_code", room_code); // room_code를 ModelAndView에 추가하여 전달
		    return mav;
	}
	
	@RequestMapping("/cartlist")
	public ModelAndView roomreservationList(HttpServletRequest req) {
		String room_code = req.getParameter("room_code");		
		System.out.println(room_code);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("payment/productDetail");
		mav.addObject("list", roomreservationDao.list(room_code));
		return mav;
	}

}//class end
