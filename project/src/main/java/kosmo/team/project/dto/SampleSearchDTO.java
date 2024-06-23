package kosmo.team.project.dto;

import java.util.List;

public class SampleSearchDTO {

	private String orand;
	private String keyword1; // 검색 키워드 관련 파라미터값 저장 변수
	private String keyword2;
	private List<String> date; // 오늘, 어제 체크박스 날짜 검색
	private String sort;

	private int selectPageNo; // 선택한 페이지 번호 관련 파라미터값 저장 변수
	private int rowCntPerPage; // 페이지 당 보여줄 행의 개수 관련 파라미터값 저장 변수
	private int begin_rowNo; // 테이블 검색 시 시작행 번호 저장 변수 선언.
	private int end_rowNo; // 테이블 검색 시 끝행 번호 저장 변수 선언.

	private String minYear;
	private String minMonth;
	private String maxYear;
	private String maxMonth;

	public String getMinYear() {
		return minYear;
	}

	public void setMinYear(String minYear) {
		this.minYear = minYear;
	}

	public String getMinMonth() {
		return minMonth;
	}

	public void setMinMonth(String minMonth) {
		this.minMonth = minMonth;
	}

	public String getMaxYear() {
		return maxYear;
	}

	public void setMaxYear(String maxYear) {
		this.maxYear = maxYear;
	}

	public String getMaxMonth() {
		return maxMonth;
	}

	public void setMaxMonth(String maxMonth) {
		this.maxMonth = maxMonth;
	}

	public String getOrand() {
		return orand;
	}

	public void setOrand(String orand) {
		this.orand = orand;
	}

	public String getKeyword1() {
		return keyword1;
	}

	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	public List<String> getDate() {
		return date;
	}

	public void setDate(List<String> date) {
		this.date = date;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
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
