package kosmo.team.project.dto;

import java.util.List;

public class RecruitLessonDTO {
	
	private int m_no;
	private int recruitment_no;
	private String title;
	private String nickname;
	private String content;
	private int readcount;
	private String reg_date;
	private String money;
	private int sido;
	private int sigungu;
	private String sido_c;
	private String sigungu_c;
	private List<String> day;
	private List<String> time;
   	private int sido_id;
   	private int sigungu_id;
   	
   	
   	//레슨모집관련 확인
   	private int writer;
	
   	
   	
   	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getRecruitment_no() {
		return recruitment_no;
	}
	public void setRecruitment_no(int recruitment_no) {
		this.recruitment_no = recruitment_no;
	}
	public String getTitle() {
		return title; 
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public int getSido() {
		return sido;
	}
	public void setSido(int sido) {
		this.sido = sido;
	}
	public int getSigungu() {
		return sigungu;
	}
	public void setSigungu(int sigungu) {
		this.sigungu = sigungu;
	}
	public String getSido_c() {
		return sido_c;
	}
	public void setSido_c(String sido_c) {
		this.sido_c = sido_c;
	}
	public String getSigungu_c() {
		return sigungu_c;
	}
	public void setSigungu_c(String sigungu_c) {
		this.sigungu_c = sigungu_c;
	}
	public List<String> getDay() {
		return day;
	}
	public void setDay(List<String> day) {
		this.day = day;
	}
	public List<String> getTime() {
		return time;
	}
	public void setTime(List<String> time) {
		this.time = time;
	}
	public int getSido_id() {
		return sido_id;
	}
	public void setSido_id(int sido_id) {
		this.sido_id = sido_id;
	}
	public int getSigungu_id() {
		return sigungu_id;
	}
	public void setSigungu_id(int sigungu_id) {
		this.sigungu_id = sigungu_id;
	}
}
