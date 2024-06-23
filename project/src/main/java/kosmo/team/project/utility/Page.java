package kosmo.team.project.utility;

import java.util.Map;
import java.util.HashMap;

public final class Page 
{
	/**
	 * 검색 화면에서 필요한 [페이징 처리 관련 데이터]를 HashMap 객체에 저장해 객체의 메모리 위치 주소를 리턴하는 메소드
	 * @param selectPageNo	선택한 페이지 번호
	 * @param rowCntPerPage	페이지 당 보여줄 검색 행의 개수
	 * @param totCnt		검색 결과물 개수
	 * @return	map [페이징 처리 관련 데이터]를 저장할 HashMap 객체
	 */
	public static Map<String, Integer> getPagingMap(
				int selectPageNo
			,	int rowCntPerPage
			,	int totCnt
	)
	{
		// ------------------------------------------------------
		// [페이징 처리 관련 데이터]를 저장할 HashMap 객체 생성하기
		// ------------------------------------------------------
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		try 
		{
			// ------------------------------------------------------
			// ------------------------------------------------------
			// 만약에 선택한 페이지 번호가 0 이하면 1로 보정하기
			// ------------------------------------------------------
			if (selectPageNo <= 0) { selectPageNo = 1; }
			
			// ------------------------------------------------------
			// 한 화면에 보여줄 페이지 번호의 개수 저장하기 (예: 10개, 15개, 20개 행의 개수)
			// 만약에 매개변수로 들어오는 선택한 페이지 번호가 0 이하면 10로 보정하기
			// ------------------------------------------------------
			if (rowCntPerPage <= 0) { rowCntPerPage = 10; }
			
			int pageNoCntPerPage = 10;			
			// ------------------------------------------------------
			
			// ------------------------------------------------------
			// 만약에 매개변수로 들어오는 검색행의 개수가 0개 이면
			// 즉 페이징 처리할 데이터가 없으면
			// HashMap 객체에 [페이징 처리 관련 데이터]를 주로 0으로 세팅하기
			// ------------------------------------------------------
			if (totCnt == 0)
			{
				// -----------
				map.put("selectPageNo", selectPageNo);			// 선택한 페이지 번호
				map.put("rowCntPerPage", rowCntPerPage);		// 한 화면에 보여줄 행의 개수
				map.put("totCnt", totCnt);						// 검색행의 총 개수
				map.put("pageNoCntPerPage", pageNoCntPerPage);	// 한 화면에 보여줄 페이지 번호의 개수
				// -----------
				map.put("last_pageNo", 0);						// 마지막 페이지 번호
				// -----------
				map.put("begin_rowNo", 0);						// DB 입장에서 볼 때 검색할 시작 행의 번호
				map.put("end_rowNo", 0);						// DB 입장에서 볼 때 검색할 마지막 행의 번호
				// -----------
				// 개인적으로 필요해서 만들어 놓은거야.
				map.put("begin_serialNo_asc", 0);				// 화면에서 필요한 시작 정순 일련 번호 예 1페이지 249번, 9페이지 109번
				map.put("begin_serialNo_desc", 0);				// 화면에서 필요한 시작 역순 일련 번호
				// -----------
				map.put("begin_pageNo", 0);						// 화면에서 필요한   시작 페이징 번호
				map.put("end_pageNo", 0);						// 화면에서 필요한 마지막 페이징 번호
				// -----------
				
				// -----------------------------------------------------
				// HashMap 객체 리턴하기
				// -----------------------------------------------------
				return map;
			}
			// -----------------------------------------------------
			// -----------------------------------------------------
			// 마지막 페이지 번호 구하기. 선택한 페이지 번호 보정하기
			// -----------------------------------------------------
			int last_pageNo = totCnt / rowCntPerPage;
			
			// 아래 처럼도 가능
			// int last_pageNo = totCnt / rowCntPerPage + ( totCnt % rowCntPerPage == 0 ? 0 : 1 );
			// int last_pageNo = (int)( Math.ceil( totCnt * 1.0 / rowCntPerPage ) );
			
			if (totCnt % rowCntPerPage > 0) { last_pageNo++; }
			
			if (last_pageNo < selectPageNo) { selectPageNo = last_pageNo; }

			// -----------------------------------------------------
			// -----------------------------------------------------
			// DB 에서 사용한 마지막 행 번호 구하기
			// -----------------------------------------------------
			int end_rowNo = selectPageNo * rowCntPerPage;
			// -----------------------------------------------------
			// DB 에서 사용한   시작 행 번호 구하기
			// -----------------------------------------------------
			int begin_rowNo = end_rowNo - rowCntPerPage + 1;
			
			if (end_rowNo > totCnt) { end_rowNo = totCnt; }
			// -----------------------------------------------------
			// -----------------------------------------------------
			// 화면에서 보여줄 시작 페이지 번호 구하기
			// -----------------------------------------------------
			int begin_pageNo = (int) Math.floor( ( selectPageNo - 1 ) / pageNoCntPerPage ) * pageNoCntPerPage + 1;
			// -----------------------------------------------------
			// 화면에서 보여줄 마지막 페이지 번호 구하기
			// -----------------------------------------------------
			int end_pageNo = begin_pageNo + pageNoCntPerPage - 1;
			
			if (end_pageNo > last_pageNo) { end_pageNo = last_pageNo; }
			// -----------------------------------------------------
			// -----------------------------------------------------
			// HashMap 객체에 위에서 구한 [페이징 처리 관련 데이터]를 최종 저장하기
			// -----------------------------------------------------
			map.put("selectPageNo", selectPageNo);				// 선택한 페이지 번호 저장하기
			map.put("rowCntPerPage", rowCntPerPage);			// 한 화면에 보여지는 행의 개수 저장하기
			map.put("totCnt", totCnt);							// 검색된 총 개수
			map.put("pageNoCntPerPage", pageNoCntPerPage);		// 한 화면에 보여지는 페이지번호의 개수 저장하기
			// --------------
			map.put("last_pageNo", last_pageNo);				// 마지막 페이지번호 저장하기
			// --------------
			map.put("begin_rowNo", begin_rowNo);				// 오라클 입장에서 검색할 시작행 번호 저장하기
			map.put("end_rowNo", end_rowNo);					// 오라클 입장에서 검색할   끝행 번호 저장하기
			// -----------
			map.put("begin_serialNo_asc", begin_rowNo);					// 화면에서 시작하는 정순 일련번호 저장하기	(1,2,3,4,5)			
			map.put("begin_serialNo_desc", totCnt - begin_rowNo + 1);	// 화면에서 시작하는 역순 일련번호 저장하기	(100,99,98,97)
			// -----------
			map.put("begin_pageNo", begin_pageNo);				// 화면에서 보여지는 시작 페이지 번호 저장하기
			map.put("end_pageNo", end_pageNo);					// 화면에서 보여지는 마지막 페이지 번호 저장하기
			// -----------------------------------------------------
			
			return map;
			
		}
		catch (Exception ex) {
			return new HashMap<String, Integer>( );
		}
	}
	
}
