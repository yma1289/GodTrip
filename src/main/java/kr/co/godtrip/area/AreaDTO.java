package kr.co.godtrip.area;

public class AreaDTO {
	private String area_code;
	private String area_name;
	private String latitude;
	private String longitude;
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "AreaDTO [area_code=" + area_code + ", area_name=" + area_name + ", latitude=" + latitude
				+ ", longitude=" + longitude + "]";
	}
	
	
}
