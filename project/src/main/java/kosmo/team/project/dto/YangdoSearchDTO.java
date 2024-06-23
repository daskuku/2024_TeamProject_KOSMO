package kosmo.team.project.dto;

import java.util.List;

public class YangdoSearchDTO {


	private String Stadiumkeyword1;
	private String Stadiumkeyword2;
	private String orand;
	private int sido;
	private int sigungu;
	private List<String> status;
	 // 선택한 페이지 번호 관련 파값 저장 변수
    private int selectPageNo;
    // 페이지 당 보여줄 행의 개수 관련 파값 저장 변수
    private int rowCntPerPage;
    // 테이블 검색 시 시작행 번호 저장 변수 선언.
    private int begin_rowNo;
    // 테이블 검색 시 끝행 번호 저장 변수 선언.
    private int end_rowNo;
	public String getStadiumkeyword1() {
		return Stadiumkeyword1;
	}
	public void setStadiumkeyword1(String stadiumkeyword1) {
		Stadiumkeyword1 = stadiumkeyword1;
	}
	public String getStadiumkeyword2() {
		return Stadiumkeyword2;
	}
	public void setStadiumkeyword2(String stadiumkeyword2) {
		Stadiumkeyword2 = stadiumkeyword2;
	}
	public String getOrand() {
		return orand;
	}
	public void setOrand(String orand) {
		this.orand = orand;
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
	public List<String> getStatus() {
		return status;
	}
	public void setStatus(List<String> status) {
		this.status = status;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public int getBegin_rowNo() {
		return begin_rowNo;
	}
	public void setBegin_rowNo(int begin_rowNo) {
		this.begin_rowNo = begin_rowNo;
	}
	public int getEnd_rowNo() {
		return end_rowNo;
	}
	public void setEnd_rowNo(int end_rowNo) {
		this.end_rowNo = end_rowNo;
	}
	

	
	
	
}
