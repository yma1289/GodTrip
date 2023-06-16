package kr.co.godtrip.attraction;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	

		
	
///////////////////////////////
	//상세보기
	@RequestMapping("/attraction/attractionDetail/{tour_code}")
	public ModelAndView attractionDetail(@PathVariable String tour_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionDetail");
		mav.addObject("attraction", attractionDao.attractionDetail(tour_code));
		return mav;
	}//attractionDetail() end 
	
	
	//삭제
		@RequestMapping("/attraction/attractionDelete")
		public String attractionDelete(String tour_code, HttpServletRequest req) {
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
		
	///////////////////////////
		

		
	
	
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
	//Map사용
	
	//수정
	@RequestMapping("/attraction/attractionUpdate")

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
