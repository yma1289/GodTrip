package kr.co.godtrip.product;

public class TransRsvDTO {
	private int transrs_no;
	private String transpro_code;	
	private String id;
	private String transrs_seatno;
	private String rsvdate;
	
	public int getTransrs_no() {
		return transrs_no;
	}
	public void setTransrs_no(int transrs_no) {
		this.transrs_no = transrs_no;
	}
	public String getTranspro_code() {
		return transpro_code;
	}
	public void setTranspro_code(String transpro_code) {
		this.transpro_code = transpro_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTransrs_seatno() {
		return transrs_seatno;
	}
	public void setTransrs_seatno(String transrs_seatno) {
		this.transrs_seatno = transrs_seatno;
	}
	public String getRsvdate() {
		return rsvdate;
	}
	public void setRsvdate(String rsvdate) {
		this.rsvdate = rsvdate;
	}
	
	@Override
	public String toString() {
		return "TransRsvDTO [transrs_no=" + transrs_no + ", transpro_code=" + transpro_code + ", id=" + id
				+ ", transrs_seatno=" + transrs_seatno + ", rsvdate=" + rsvdate + "]";
	}
		
}


