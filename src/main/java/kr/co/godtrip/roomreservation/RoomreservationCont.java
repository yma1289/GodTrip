package kr.co.godtrip.roomreservation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView roomreservationinsert(HttpServletRequest req, HttpSession session) throws ParseException{
		//String id=req.getParameter("id"); //나중에 이부분으로 고쳐야 함
		String id=(String) session.getAttribute("s_id"); //임시 아이디
		String room_code=req.getParameter("room_code");
		String departure_Date=req.getParameter("departure_Date");
		String arrival_Date=req.getParameter("arrival_Date");	
		//체크인 시간 20230623
		//체크아웃 시간 20230625 데이터베이스에 저장	
		//위의 출발시간과 도착시간에서 - 기호 삭제하기
		//departure_Date=departure_Date.replaceAll("-", "");
		//arrival_Date=arrival_Date.replaceAll("-", "");

		
		int room_price=Integer.parseInt(req.getParameter("room_price")); 
		
		//도착일-출발일 구하기 로직
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    Date a_parseDate = format.parse(departure_Date);
	    Date b_parseDate = format.parse(arrival_Date);
	    Date a_sqlDate = new java.sql.Date(a_parseDate.getTime());
	    Date b_sqlDate = new java.sql.Date(b_parseDate.getTime());
	    int resultTime = (int)(b_parseDate.getTime() - a_parseDate.getTime()) / (24 * 60 * 60 * 1000);
	    if(a_sqlDate.getTime()<b_sqlDate.getTime()) {
	    	System.out.println("굿");
	    }
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
		
		
		  //int cnt=dao.~~~();
		 ModelAndView mav = new ModelAndView();
		 	mav.setViewName("redirect:/cartlist"); // 리다이렉트로 이동
		    mav.addObject("room_code", room_code); // room_code를 ModelAndView에 추가하여 전달
		    mav.addObject("departure_Date",departure_Date);
		    mav.addObject("arrival_Date",arrival_Date);
		    mav.addObject("totalpay",totalpay);
		    //mav.addObject("cnt",cnt);
		    //session.setAttribute("cnt", cnt);
		    //jsp에서 session.getAttribute(cnt);
		    return mav;
	}
	
	@RequestMapping("/cartlist")
	public ModelAndView roomreservationList(HttpServletRequest req,HttpSession session) {
		String room_code = req.getParameter("room_code");		
		String departure_Date=req.getParameter("departure_Date");	
		String arrival_Date=req.getParameter("arrival_Date");
		    String id = (String)session.getAttribute("s_id");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("payment/productDetail");
			
			//항공장바구니에 있는거 list에 담아서 불러오기
			List<Map<String, Object>>list=roomreservationDao.list(id);
			mav.addObject("list",list);
			mav.addObject("departure_Date",departure_Date);
			mav.addObject("room_code",room_code);
			mav.addObject("arrival_Date",arrival_Date);
			
			List<Map<String, Object>> transList = roomreservationDao.transList(id);
			mav.addObject("departure_Date", departure_Date);
			mav.addObject("transList", transList);
			
			return mav;
	}

}//class end
