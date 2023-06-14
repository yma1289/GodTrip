package kr.co.godtrip.hotel;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/hotel")
public class HotelCont {

	public HotelCont() {
		System.out.println("------HotelCont() 객체 생성됨");
	}
	@Autowired
	HotelDAO hotelDao;
	
	@RequestMapping("/hotelForm")
	public String hotelForm() {
	return "hotel/hotelForm";
	}
	
	 // 부모페이지 .jsp에서 <a href="/hotelList?area_code=여기에클릭한지역코드출력"></a>
	
	 //호텔정보 가져오기 + 지역정보
	 @RequestMapping("/hotelList")
	    public ModelAndView list(HttpServletRequest req) {
		 	//지역코드
		 	//String area_code=req.getParameter("area_code"); //나중에 이부분으로 고쳐야 함
		    String area_code="G0001"; //지금은 임시로 제주지역코드로 테스트
		    String area_name="";
		    if(area_code.equals("G0001")) {
		    	area_name="제주도";
		    }else if(area_code.equals("G0002")) {
		    	area_name="부산광역시";
		    }else if(area_code.equals("G0003")) {
		    	area_name="대구광역시";
		    }else if(area_code.equals("G0007")) {
		    	area_name="서울";
		    }//if end 
		    
		    
		    
	        ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hotelList");
	        mav.addObject("list",hotelDao.list(area_code));//DB에서 where 칼럼명 like 
	        mav.addObject("area_code",area_code);
	        mav.addObject("area_name",area_name);
	        return mav;
	 }//list() end
	 

	
	 
	 //호텔 검색
	 @RequestMapping("/search")
	    public ModelAndView search(@RequestParam(defaultValue = "") String hotel_Name) {
	    	ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hotelList");
	        mav.addObject("hotel_Name",hotel_Name);//검색어
	        mav.addObject("list", hotelDao.search(hotel_Name));
	        return mav;
	 }//search() end
	 
	 //호텔 타입 분류
	 @RequestMapping("/search2")
	    public ModelAndView search2(String hotel_Type) {
	    	ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hotelList");
	        mav.addObject("hotel_Type",hotel_Type);		//호텔타입
	        mav.addObject("list", hotelDao.search2(hotel_Type)); //검색 결과 리스트도 함께 전달
	        return mav;
	    }//search() end
	 
	 //호텔입력
	@RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
    		          ,@RequestParam MultipartFile img
    		          ,HttpServletRequest req) {
    	
    	 System.out.println(map);
    	//System.out.println(map.get("product_name"));
    	//System.out.println(map.get("price"));
    	//System.out.println(map.get("description"));
    	
    	//주의사항 : 파일업로드할 때 리네임 되지 않음    	
    	//업로드된 파일은 /storage 폴더에 저장
    	
    	String filename="-";
    	long filesize=0;
    	if(img != null && !img.isEmpty()) { //파일이 존재한다면
    		filename=img.getOriginalFilename();
    		filesize=img.getSize();
    		try {
    			
    			ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("/storage");  //실제 물리적인 경로
    			img.transferTo(new File(path + "\\" + filename)); //파일저장
    			
    		}catch (Exception e) {
    			e.printStackTrace(); //System.out.println(e);
			}//try end    		
    	}//if end
    	
    	map.put("filename", filename);
    	map.put("filesize", filesize);
    	
    	hotelDao.insert(map);

    	return "redirect:/hotel/hotelList";
    	
    }//insert() end
	
	
	
	 
	 
	
	
}
