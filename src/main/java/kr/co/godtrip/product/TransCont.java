package kr.co.godtrip.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping()
public class TransCont {
	public TransCont() {
		System.out.println("-----TransCont()객체 생성됨");
	}//end
	
	@Autowired
	TransDAO transDao;
	
	@RequestMapping("/product/transproList")
	public ModelAndView transproList() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("product/transproList");
		mav.addObject("transproList", transDao.transproList());
		return mav;
	}//list() end
	
	 
}//class end
