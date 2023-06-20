package kr.co.godtrip.partner;

public class partnerDTO {
	private String p_id;
	private String p_passwd;
	private String p_name;
	private String p_tel;
	private String p_email;
	private String p_info;
	private String p_level;
		
	public partnerDTO() {}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_passwd() {
		return p_passwd;
	}

	public void setP_passwd(String p_passwd) {
		this.p_passwd = p_passwd;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_tel() {
		return p_tel;
	}

	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public String getP_level() {
		return p_level;
	}

	public void setP_level(String p_level) {
		this.p_level = p_level;
	}

	@Override
	public String toString() {
		return "partnerDTO [p_id=" + p_id + ", p_passwd=" + p_passwd + ", p_name=" + p_name + ", p_tel=" + p_tel
				+ ", p_email=" + p_email + ", p_info=" + p_info + ", p_level=" + p_level + "]";
	}

	
	

}

	