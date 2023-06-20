package kr.co.godtrip.review;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.google.gson.JsonObject;

@Controller
@RequestMapping("/")
public class ReviewCont {

	public ReviewCont() {
		System.out.println("------ReviewCont 객체 생성됨");
	}
	
		@Autowired
		ReviewDAO reviewDao;
	
			@RequestMapping("/reviewList")
			public String reviewList() {
			return "review/reviewList";
		 }
			@RequestMapping("/reviewForm")
			public String reviewForm() {
			return "review/reviewForm";
		 }
			
			
			@PostMapping("/reviewcreate")
			public void reviewcreate(HttpServletRequest req,@RequestParam Map<String, Object> map) {
				System.out.println(map.get("title"));
				System.out.println(map.get("content"));
				String title= req.getParameter("title");
				String summernote=req.getParameter("summernote");
				System.out.println(title);
				System.out.println(summernote);
			}
			
			
			@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
			@ResponseBody
			public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req )  {
				JsonObject jsonObject = new JsonObject();
				
		        /*
				 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
				 */
				
				// 내부경로로 저장
				ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("summernote_image/"); 

				String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				File targetFile = new File(path + savedFileName);
				try {
					InputStream fileStream = multipartFile.getInputStream();
					FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
					jsonObject.addProperty("url", "/summernote_image/"+savedFileName); //파일이 있는 위치
					jsonObject.addProperty("responseCode", "success");
						
				} catch (IOException e) {
					FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
					jsonObject.addProperty("responseCode", "error");
					e.printStackTrace();
				}
				String a = jsonObject.toString();
				return a;
			}

	}//class end


			    
		
	
	

