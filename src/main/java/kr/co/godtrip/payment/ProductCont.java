package kr.co.godtrip.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class ProductCont {
	
	public ProductCont() {
		System.out.println("-----ProductCont() 객체생성됨");
	}
	
	@Autowired
	ProductDAO productDao;
	
	@RequestMapping("/productDetail")
	public String productDetail() {
		return "payment/productDetail";
	}
	
	
}
