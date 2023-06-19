package kr.co.godtrip.attraction;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.godtrip.member.MemberDAO;
import kr.co.godtrip.member.MemberDTO;

@Controller
@RequestMapping
public class AttractionCont {

	public AttractionCont() {
		System.out.println("----AttractionCont() 객체생성됨");
	}
	

	@Autowired
	AttractionDAO attractionDao;
	

	@RequestMapping("/attraction/attractionForm")
	public String attractionForm(){
		return "attraction/attractionForm";
	}
	
	

	//목록list
	@RequestMapping("/attraction/attractionList")
	public ModelAndView list() {	
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionList");
		mav.addObject("attractionList", attractionDao.list());
		
		return mav;
	}//list() end 
		
		
	@RequestMapping("/attraction/attractioninsert")
	public String insert(
						 @RequestParam Map<String, Object> map //map이 text정보 받는다(form.jsp에서 만든 text)
						,HttpServletRequest req
						,@RequestParam MultipartFile img)throws Exception {
		//AttractionDTO 객체에 입력된 값들이 자동으로 바인딩됨
		
		
		
		String p_ID="bnb56";
		int d=(int)(Math.random()) *1000 + 1;
		String tour_code="T" +d;
		
	  
		 
		String filename="-";
		long filesize=0;
		if(img !=null&& !img.isEmpty()) {//파일존재한다면
			filename=img.getOriginalFilename();
    		filesize=img.getSize();
    		try {
    			ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("/storage");  //실제 물리적인 경로
    			img.transferTo(new File(path + "\\" + filename)); //파일저장

			} catch (Exception e) {
				e.printStackTrace();   //System.out.println(e);과 같은 명령어

			}//try end 
		
		}//if end 
		map.put("filename", filename);
		map.put("filesize", filesize);
		
		attractionDao.attractioninsert(map);
		
		System.out.println(filename);
		System.out.println(filesize);
		
		
		
		return "redirect:/attraction/attractionList";  //행추가 완료 후 목록이동
	}//insert() end 
	

		
	

	//상세보기dto

	@RequestMapping("/attraction/attractionDetail")
	public ModelAndView attractionDetail(String tour_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionDetail");
		mav.addObject("attraction", attractionDao.attractionDetail(tour_code));
		return mav;
	}//attractionDetail() end 
	
	
	

	/*
	 //상세보기 map사용
	//참조 attractionList.jsp
	//<a href="<c:url value='/attraction/attractionDetail?tour_code=${dto.tour_code}' />">
	@RequestMapping("/attraction/attractionDetail")
	public ModelAndView attractionDetail(String tour_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionDetail");
		mav.addObject("attraction", attractionDao.attractionDetail(tour_code));
		return mav;
	}//attractionDetail() end 
		*/
	
	
	//삭제
	@RequestMapping("/attraction/attractionDelete")
	public String attractionDelete(@RequestParam String tour_code, HttpServletRequest req) {

		
		//삭제하고자 하는 파일명 가져오기
		String filename=attractionDao.filename(tour_code);
		
		//첨부된 파일 삭제하기
		if(filename != null && !filename.equals("-")){  //파일이 존재한다면~
			ServletContext application=req.getSession().getServletContext();
			String path=application.getRealPath("/storage");   //실제 물리적인 경로
			File file=new File(path + "\\" + filename);
			if(file.exists()) {        //파일에 다 모아놓고 -> 파일이존재한다면
				file.delete();			//그 파일 다 삭제해라~
			}//if end 
		}//if end 
		
		attractionDao.attractionDelete(tour_code);  //테이블 행 삭제
		
		return "redirect:/attraction/attractionList";
		
	}//delete() end 
	
	
	//검색 search
	@RequestMapping("/attraction/search")
	public ModelAndView search(@RequestParam(defaultValue = "")String tour_name) {//name="tour_name"의 값이 없으면 defaultValue 를 공백으로 줌
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionList");
		mav.addObject("attractionList", attractionDao.search(tour_name));
		//1.DAO에가서 controller에 있는 search부른다
		//2.DAO search()는 attraction.search반환(mapper에 있는)
		//3.mapper에 파라미터타입 String
		mav.addObject("tour_name", tour_name);
		//mav에 받아온 검색어를 저장해놨다가(검색전) 다시 list페이지를 불러올 때 넘겨받은 값을 준다(검색후) 
		return mav;
	}
	
	

		
	///////////////////////////
	
	//뷰단보여주기	
	@GetMapping("/attraction/attractionUpdate")
	public String attractionUpdate(@RequestParam String tour_code
								, HttpServletRequest req
								,Model model
								) throws Exception{
		//상세내용조회
		AttractionDTO attraction=attractionDao.attractionDetail(tour_code);
		//상세내용을 수정페이지에 전달
		model.addAttribute("attraction", attraction);
		//String test = tour_code;
		//System.out.println("test ===============" + test);
		
		return "attraction/attractionUpdate";
	}
	
	
	//수정 dto	
		@RequestMapping("/attraction/attractionUpdate")
		public String attractionUpdate(@ModelAttribute AttractionDTO attractionDTO
		                     , @RequestParam MultipartFile img
		                     , HttpServletRequest req) {

		    String filename = "-";
		    long filesize = 0;
		    if (img != null && !img.isEmpty()) {
		        filename = img.getOriginalFilename();
		        filesize = img.getSize();
		        try {
		            ServletContext application = req.getSession().getServletContext();
		            String path = application.getRealPath("/storage");
		            img.transferTo(new File(path + "\\" + filename));
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    } else {
		        String tour_code = attractionDTO.getTour_code();
		        AttractionDTO attraction = attractionDao.attractionDetail(tour_code);
		        filename = attraction.getFilename();
		        filesize = attraction.getFilesize();
		    }

		    attractionDTO.setFilename(filename);
		    attractionDTO.setFilesize((int) filesize);
		    attractionDao.attractionUpdate(attractionDTO);
		    return "redirect:/attraction/attractionList";
		}
		
	
	/*
	//수정 Map사용 (gtp수정코드)
	//수정된폼넘긴거(질문할것-> 수정 한 뒤 수정버튼누르면 수정안되고 그냥 list페이지로 넘어감)
	@PostMapping("/attraction/attractionUpdate")
	public String update(@RequestParam Map<String, Object> map,
	                     @RequestParam MultipartFile img,
	                     HttpServletRequest req) {

	    String filename = "-";
	    long filesize = 0;
	    if (img != null && !img.isEmpty()) { //파일이 존재한다면~
	        filename = img.getOriginalFilename();
	        filesize = img.getSize();
	        try {
	            ServletContext application = req.getSession().getServletContext();
	            String path = application.getRealPath("/storage");//실제물리적인경로
	            img.transferTo(new File(path + "\\" + filename));//파일저장
	        } catch (Exception e) {
	            e.printStackTrace();//system.out.println;과 같은것
	        }//try end
	    } else {
	        if (map.containsKey("tour_code")) {
	            String tour_code = map.get("tour_code").toString();
	            Map<String, Object> attraction = attractionDao.attractionDetail(tour_code);
	            filename = attraction.get("FILENAME").toString();
	            filesize = Long.parseLong(attraction.get("FILESIZE").toString());
	        }
	    }
	    
	    map.put("filename", filename);
	    map.put("filesize", filesize);
	    attractionDao.attractionUpdate(map);
	    return "redirect:/attraction/attractionList";
	}
	*/
	

	/*
	
	//수정 Map사용 (gtp수정코드)
	@PostMapping("/attraction/attractionUpdate")

	public String update(@RequestParam Map<String, Object> map
						, @RequestParam MultipartFile img
						,HttpServletRequest req) {

		String filename="-";
		long filesize=0;
		if(img !=null && !img.isEmpty()) {//파일이 존재한다면
			filename=img.getOriginalFilename();
			filesize=img.getSize();
			try {
				ServletContext application=req.getSession().getServletContext();
				String path=application.getRealPath("/storage");   //실제 물리적인 경로
				img.transferTo(new File(path+ "\\" + filename));   //파일저장
				
				
			}catch (Exception e) {
				e.printStackTrace();   //System.out.println(e);과 같은 명령어
			}//try end 
		}else{
			String tour_code=map.get("tour_code").toString();
			Map<String, Object>attraction=attractionDao.attractionDetail(tour_code);
			filename=attraction.get("FILENAME").toString();
			filesize=Long.parseLong(attraction.get("FILESIZE").toString());

			
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		attractionDao.attractionUpdate(map);
		return "redirect:/attraction/attractionList";
	}//update()end
	
	*/
	
	
	

		
	
	
	
	
	
	
	
	
	
}//class end 
