package kr.co.godtrip.payment;

import java.sql.Timestamp;

public class PaymentDTO {
public PaymentDTO() {} 
	    
		private String merchant_uid;//주문번호  
        private String pg;   //결제사
        private String payMethod; //결제방식  
        private String productName; //상품이름
        private String id;
        private int amount;  //총 결제금액 
        private String orderDate;	//결제 날짜
        private int totalpay;			//교통 최종 결제 금액
        private int totalpay1 ;			//숙박 최종 결제 금액
        private String room_code;			//숙박 코드
        private String transpro_code;  //교통 코드
        private String departureDate; //도착일
        private String arrivalDate;
		public String getMerchant_uid() {
			return merchant_uid;
		}
		public void setMerchant_uid(String merchant_uid) {
			this.merchant_uid = merchant_uid;
		}
		public String getPg() {
			return pg;
		}
		public void setPg(String pg) {
			this.pg = pg;
		}
		public String getPayMethod() {
			return payMethod;
		}
		public void setPayMethod(String payMethod) {
			this.payMethod = payMethod;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}
		public String getOrderDate() {
			return orderDate;
		}
		public void setOrderDate(String orderDate) {
			this.orderDate = orderDate;
		}
		public int getTotalpay() {
			return totalpay;
		}
		public void setTotalpay(int totalpay) {
			this.totalpay = totalpay;
		}
		public int getTotalpay1() {
			return totalpay1;
		}
		public void setTotalpay1(int totalpay1) {
			this.totalpay1 = totalpay1;
		}
		public String getRoom_code() {
			return room_code;
		}
		public void setRoom_code(String room_code) {
			this.room_code = room_code;
		}
		public String getTranspro_code() {
			return transpro_code;
		}
		public void setTranspro_code(String transpro_code) {
			this.transpro_code = transpro_code;
		}
		public String getDepartureDate() {
			return departureDate;
		}
		public void setDepartureDate(String departureDate) {
			this.departureDate = departureDate;
		}
		public String getArrivalDate() {
			return arrivalDate;
		}
		public void setArrivalDate(String arrivalDate) {
			this.arrivalDate = arrivalDate;
		}
		
		@Override
		public String toString() {
			return "PaymentDTO [merchant_uid=" + merchant_uid + ", pg=" + pg + ", payMethod=" + payMethod
					+ ", productName=" + productName + ", id=" + id + ", amount=" + amount + ", orderDate=" + orderDate
					+ ", totalpay=" + totalpay + ", totalpay1=" + totalpay1 + ", room_code=" + room_code
					+ ", transpro_code=" + transpro_code + ", departureDate=" + departureDate + ", arrivalDate="
					+ arrivalDate + "]";
		}
		
		
              
        
}
