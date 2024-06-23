package kosmo.team.project.dto;

public class MemberSearchDTO {
	
	private int selectPageNo;   // 선택한 페이지 번호 관련 파값 저장 변수
	private int rowCntPerPage;  // 페이지 당 보여줄 행의 개수 관련 파값 저장 변수
	private int begin_rowNo;    // 테이블 검색 시 시작행 번호 저장 변수 선언.
	private int end_rowNo;      // 테이블 검색 시 끝행 번호 저장 변수 선언.
	
	
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
