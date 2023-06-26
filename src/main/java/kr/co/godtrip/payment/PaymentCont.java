package kr.co.godtrip.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class PaymentCont {
	public PaymentCont() {
		System.out.println("-----PaymentCont() 객체생성됨");
	}
	
	@Autowired
	PaymentDAO paymentDao;
	
	@RequestMapping("/paymentForm")
	   public String paymentForm(HttpServletRequest req,HttpSession session) {
	      String id=(String)session.getAttribute("s_id");
	      paymentDao.roomDelete(id);
	      paymentDao.transDelete(id);
	      return "payment/paymentForm";
	   }//paymentForm() end
	   
	
	
}//paymentCont() end
	
	
	
	
	
	
	

