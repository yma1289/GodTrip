package kr.co.godtrip.roomreservation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/")
public class RoomreservationCont {
	
	
	@Autowired
	RoomreservationDAO roomreservationDao;
	
	public RoomreservationCont(){
		System.out.println("------Roomreservation 객체 생성");
	}
	
	
	
	@GetMapping("/roomreservationinsert")
	public ModelAndView roomreservationinsert(HttpServletRequest req) throws ParseException{
		//String id=req.getParameter("id"); //나중에 이부분으로 고쳐야 함
		String id="young12"; //임시 아이디
		String room_code=req.getParameter("room_code");
		String departure_Date=req.getParameter("departure_Date");
		String arrival_Date=req.getParameter("arrival_Date");
		int room_price=Integer.parseInt(req.getParameter("room_price")); 
		
		//도착일-출발일 구하기 로직
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    java.util.Date a_parseDate = format.parse(departure_Date);
	    java.util.Date b_parseDate = format.parse(arrival_Date);
	    java.sql.Date a_sqlDate = new java.sql.Date(a_parseDate.getTime());
	    java.sql.Date b_sqlDate = new java.sql.Date(b_parseDate.getTime());
	    int resultTime = (int)(b_parseDate.getTime() - a_parseDate.getTime()) / (24 * 60 * 60 * 1000);
	    
	    //총가격
	    if(resultTime==0) {
	    	resultTime=1;
	    }
		int totalpay=room_price*resultTime;
		
        Map<String, Object> map=new HashMap<>();
        map.put("id", id);
        map.put("room_code", room_code);
        map.put("departure_Date", departure_Date);
        map.put("arrival_Date", arrival_Date);
        map.put("totalpay", totalpay);
		roomreservationDao.insert(map);
		
		 ModelAndView mav = new ModelAndView();
		 	mav.setViewName("redirect:/cartlist"); // 리다이렉트로 이동
		    mav.addObject("room_code", room_code); // room_code를 ModelAndView에 추가하여 전달
		    mav.addObject("departure_Date",departure_Date);
		    mav.addObject("arrival_Date",arrival_Date);
		    mav.addObject("totalpay",totalpay);
		    return mav;
	}
	
	@RequestMapping("/cartlist")
	public ModelAndView roomreservationList(HttpServletRequest req) {
		String room_code = req.getParameter("room_code");		
		String departure_Date=req.getParameter("departure_Date");
		String arrival_Date=req.getParameter("arrival_Date");
		
	    
	    
			ModelAndView mav = new ModelAndView();
			mav.setViewName("payment/productDetail");
			
			//항공장바구니에 있는거 list에 담아서 불러오기
			List<Map<String, Object>>list=roomreservationDao.list(room_code);
			mav.addObject("list",list);
			mav.addObject("departure_Date",departure_Date);
			return mav;
	}

}//class end
