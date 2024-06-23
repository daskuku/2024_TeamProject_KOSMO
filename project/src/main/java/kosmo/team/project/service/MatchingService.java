package kosmo.team.project.service;

import java.util.List;
import java.util.Map;

import kosmo.team.project.dto.MatchingDTO;
import kosmo.team.project.dto.MatchingSearchDTO;



public interface MatchingService {

	//이곳은 인터페이스. 메소드의 이름만 정의해주고 이 메소드의 기능은 MatchingServiceImpl 쪽에서 만들어줄거임.
	//매칭 게시물 가져오기
	List<MatchingDTO> getMatchingList(MatchingSearchDTO matchingSearchDTO);
	
	//매칭 상세보기 
	MatchingDTO getMatchingDetail(int match_no);
	
	//새글쓰기
	int regMatchingBoard(MatchingDTO matchingDTO);
	
	//수정,삭제를 위한 게시물 가져오기
	MatchingDTO getUpdelBoard(int match_no);
	
	//게시물 수정
	int updateMatching(MatchingDTO matchingDTO);
	
	//게시물 삭제
	int deleteMatching(MatchingDTO matchingDTO);
	
	//게시물 검색 개수 가져오기
	int getMatchListCnt(MatchingSearchDTO matchingSearchDTO );
	
    // 주석 
    // 매칭 새글쓰기 m_no를 받아 경기장명 셀렉트박스에 적용할 데이터 로드
	public List<MatchingDTO> machingStadiumSelectBoxLoad(MatchingDTO dto);

    // 주석 
    // 매칭 새글쓰기 m_no, stadium_no를 받아 경기날짜 셀렉트박스에 적용할 데이터 로드	
	public List<MatchingDTO> machingDaySelectBoxLoad(MatchingDTO dto);
	
	// 주석 
    // 매칭 새글쓰기 m_no, stadium_no를 받아 경기시간 셀렉트박스에 적용할 데이터 로드
	public List<MatchingDTO> machingTimeSelectBoxLoad(MatchingDTO dto);	
	
	//승낙 대기 리스트로 팀정보 넘어감
	int regWaitingList(MatchingDTO matchingDTO);
	
}
