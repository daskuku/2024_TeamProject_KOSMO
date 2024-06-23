package kosmo.team.project.dto;

import java.util.List;

public class StadiumDTO {
	
	
	
	
	private int stadium_no;
	private String stadium_name;
	private String sido_name;
	private String sigungu_name;
	private String detailed_address;
	private String reg_date;
	private String content;
	private String stadium_status;
	private List<String> time_range;
	private int m_no;
	
	private String imagename;

	public int getStadium_no() {
		return stadium_no;
	}

	public void setStadium_no(int stadium_no) {
		this.stadium_no = stadium_no;
	}

	public String getStadium_name() {
		return stadium_name;
	}

	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}

	public String getSido_name() {
		return sido_name;
	}

	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}

	public String getSigungu_name() {
		return sigungu_name;
	}

	public void setSigungu_name(String sigungu_name) {
		this.sigungu_name = sigungu_name;
	}

	public String getDetailed_address() {
		return detailed_address;
	}

	public void setDetailed_address(String detailed_address) {
		this.detailed_address = detailed_address;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStadium_status() {
		return stadium_status;
	}

	public void setStadium_status(String stadium_status) {
		this.stadium_status = stadium_status;
	}

	public List<String> getTime_range() {
		return time_range;
	}

	public void setTime_range(List<String> time_range) {
		this.time_range = time_range;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	
}
