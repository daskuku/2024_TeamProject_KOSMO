package kosmo.team.project.dto;

public class AdminCommunitySearchDTO {

	private String searchType1; // 장터 페이지 전체(all), 글작성자(writer), 제목(title), 내용(content)
	private String keyword1; // 장터 페이지 검색어
	private String tabType; // 장터 페이지 전체, 판매, 나눔을 구분하기 위한 변수

	private int selectPageNo; // 선택한 페이지 번호 관련 파값 저장 변수
	private int rowCntPerPage; // 페이지 당 보여줄 행의 개수 관련 파값 저장 변수
	private int begin_rowNo; // 테이블 검색 시 시작행 번호 저장 변수 선언.
	private int end_rowNo; // 테이블 검색 시 끝행 번호 저장 변수 선언.

	public String getSearchType1() {
		return searchType1;
	}

	public void setSearchType1(String searchType1) {
		this.searchType1 = searchType1;
	}

	public String getKeyword1() {
		return keyword1;
	}

	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}

	public String getTabType() {
		return tabType;
	}

	public void setTabType(String tabType) {
		this.tabType = tabType;
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
