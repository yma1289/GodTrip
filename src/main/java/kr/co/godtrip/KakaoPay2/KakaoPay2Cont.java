package kr.co.godtrip.KakaoPay2;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/kakaoPay")
public class KakaoPay2Cont {
public KakaoPay2Cont() {}

@Autowired
KakaoPay2DAO kakaoPay2DAO;

@RequestMapping("/kakaoPayTest2")
public String kakaoPayTest2() {
	return "kakaoPay/kakaoPayTest2";
}

//결제 창 띄우기
@RequestMapping(value = "/payment", method = RequestMethod.POST)
@ResponseBody
public String kakaoPay2() {
	try {
	URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
	HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
	connection.setRequestMethod("POST");
	connection.setRequestProperty("Authorization", "KakaoAK 94766b9c5e00dac01357021fab4e8eba "); // 어드민 키
	connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
	
	String parameter = "cid=TC0ONETIME" // 가맹점 코드 테스트용코드 실제코드를 이용하려면 https://admin.portone.io/에서 가맹점 코드를 등록
			+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
			+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
			+ "&item_name=초코파이" // 상품명
			+ "&quantity=1" // 상품 수량
			+ "&total_amount=5000" // 총 금액
			+ "&vat_amount=200" // 부가세
			+ "&tax_free_amount=0" // 상품 비과세 금액
			+ "&approval_url=http://localhost:9095/kakaoPay/kakaoPayTest2" // 결제 성공 시 경로는 알아서 조절
			+ "&fail_url=http://localhost:9095/kakaoPay/kakaoPayTest2" // 결제 실패 시
			+ "&cancel_url=http://localhost:9095/kakaoPay/kakaoPayTest2"; // 결제 취소 시
	OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
	DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
	dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
	dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)

	int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
	InputStream receive; // 받다
	
	if(result == 200) {
		receive = connection.getInputStream();
	}else {
		receive = connection.getErrorStream(); 
	}
	// 읽는 부분
	InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
	BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
	// 받는 부분
	return change.readLine();
	
	//오류 발생시 메세지 띄우기
	}catch(MalformedURLException e){
		e.printStackTrace();
		
	}catch(IOException e){
		e.printStackTrace();
	}
	
	return "";
}

//결제 정보를 승인 해주려면
//값을 저장해서 비교? 테이블 생성 필요한가?...


}
