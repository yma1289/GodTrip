package kr.co.godtrip.service;

import java.util.Date;

public class ServiceDTO {
    private int cno;
    private String c_code;
    private String title;
    private String content;
    private Date regdate;
    private String id;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ServiceDTO [cno=" + cno + ", c_code=" + c_code + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", id=" + id + "]";
	}
    
    
	
}
