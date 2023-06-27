package kr.co.godtrip.product;

import java.util.List;

public class TransinfoDTO {
	private String trans_code;
	private String FT_code;
	private String trans_name;
	private String filename;
	private long filesize;
	private String p_id;
	private List<TransproDTO> transpro;
	
	public String getTrans_code() {
		return trans_code;
	}
	public void setTrans_code(String trans_code) {
		this.trans_code = trans_code;
	}
	public String getFT_code() {
		return FT_code;
	}
	public void setFT_code(String fT_code) {
		FT_code = fT_code;
	}
	public String getTrans_name() {
		return trans_name;
	}
	public void setTrans_name(String trans_name) {
		this.trans_name = trans_name;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public List<TransproDTO> getTranspro() {
		return transpro;
	}
	public void setTranspro(List<TransproDTO> transpro) {
		this.transpro = transpro;
	}
	
	@Override
	public String toString() {
		return "TransinfoDTO [trans_code=" + trans_code + ", FT_code=" + FT_code + ", trans_name=" + trans_name
				+ ", filename=" + filename + ", filesize=" + filesize + ", p_id=" + p_id + ", transpro=" + transpro
				+ "]";
	}
		
}