package kr.co.godtrip.product;

public class TransDTO {
	private String transpro_code;
	private String trans_code;
	private String departure_Date;
	private String departure_Time;
	private String arrival_Time;
	private String departure_code;
	private String arrival_code;
	private int Price;
	private String seat;
	private String p_id;
	
	public String getTranspro_code() {
		return transpro_code;
	}
	public void setTranspro_code(String transpro_code) {
		this.transpro_code = transpro_code;
	}
	public String getTrans_code() {
		return trans_code;
	}
	public void setTrans_code(String trans_code) {
		this.trans_code = trans_code;
	}
	public String getDeparture_Date() {
		return departure_Date;
	}
	public void setDeparture_Date(String departure_Date) {
		this.departure_Date = departure_Date;
	}
	public String getDeparture_Time() {
		return departure_Time;
	}
	public void setDeparture_Time(String departure_Time) {
		this.departure_Time = departure_Time;
	}
	public String getArrival_Time() {
		return arrival_Time;
	}
	public void setArrival_Time(String arrival_Time) {
		this.arrival_Time = arrival_Time;
	}
	public String getDeparture_code() {
		return departure_code;
	}
	public void setDeparture_code(String departure_code) {
		this.departure_code = departure_code;
	}
	public String getArrival_code() {
		return arrival_code;
	}
	public void setArrival_code(String arrival_code) {
		this.arrival_code = arrival_code;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}	
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	
	@Override
	public String toString() {
		return "TransDTO [transpro_code=" + transpro_code + ", trans_code=" + trans_code + ", departure_Date="
				+ departure_Date + ", departure_Time=" + departure_Time + ", arrival_Time=" + arrival_Time
				+ ", departure_code=" + departure_code + ", arrival_code=" + arrival_code + ", Price=" + Price
				+ ", seat=" + seat + ", p_id=" + p_id + "]";
	}	
}
