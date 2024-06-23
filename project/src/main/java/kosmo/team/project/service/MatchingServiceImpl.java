package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.MatchingDAO;
import kosmo.team.project.dto.MatchingDTO;
import kosmo.team.project.dto.MatchingSearchDTO;



@Service
@Transactional
public class MatchingServiceImpl implements MatchingService {
   
   @Autowired
   private MatchingDAO matchingDAO;
   
   //매칭 게시물 가져오기
   //MatchingService 라는 인터페이스에 있는 메소드의 기능을 이곳에서 설정
   public List<MatchingDTO> getMatchingList(MatchingSearchDTO matchingSearchDTO){
      
      //getMatchingList 라는 변수에 matchingDAO쪽에 있는 getMatchingList 메소드의 실행결과를 저장
      List<MatchingDTO> getMatchingList = this.matchingDAO.getMatchingList(matchingSearchDTO);
      
      //변수에 저장된 값을 나를 호출한 놈에게 돌려준다. 즉, controller쪽에서 날 부른놈이 getMatchingList에 저장된 값을 받게 된다.
      return getMatchingList;
   }
   
   //매칭 상세보기
   public MatchingDTO getMatchingDetail(int match_no) {
      //게시물 조회수 증가
      int matchingDetailCnt = this.matchingDAO.matchingDetailCnt(match_no);
      //getMatchingDetail 라는 변수에 matchingDAO쪽에 있는 getMatchingDetail 메소드의 실행결과를 저장
      MatchingDTO getMatchingDetail = this.matchingDAO.getMatchingDetail(match_no);
      //변수에 저장된 값을 나를 호출한 놈에게 돌려준다.
      return getMatchingDetail;
   }
   
   
   //새글쓰기
   public int regMatchingBoard(MatchingDTO matchingDTO) {
      //regMatchingBoard 라는 변수에 matchingDAO쪽에 있는 regMatchingBoard 메소드의 실행결과를 저장
      int regMatchingBoard = this.matchingDAO.regMatchingBoard(matchingDTO);
      //변수에 저장된 값을 나를 호출한 놈에게 돌려준다.
      return regMatchingBoard;
   }
   
   //수정,삭제를 위한 게시물 가져오기
   public MatchingDTO getUpdelBoard(int match_no) {
      
      //getUpdelBoard 라는 변수에 matchingDAO쪽에 있는 getUpdelBoard 메소드의 실행결과를 저장
      MatchingDTO getUpdelBoard = this.matchingDAO.getUpdelBoard(match_no);
      //변수에 저장된 값을 나를 호출한 놈에게 돌려준다.
      return getUpdelBoard;      
   }
   
   
   //게시물 수정
   public int updateMatching(MatchingDTO matchingDTO) {
      //updateMatching 라는 변수에 matchingDAO쪽에 있는 updateMatching 메소드의 실행결과를 저장
      int updateMatching = this.matchingDAO.updateMatching(matchingDTO);
      //변수에 저장된 값을 나를 호출한 놈에게 돌려준다.
      return updateMatching;
   }
   
   //게시물 삭제
   public int deleteMatching(MatchingDTO matchingDTO) {
      //deleteMatching 라는 변수에 matchingDAO쪽에 있는 deleteMatching 메소드의 실행결과를 저장
      int deleteMatching = this.matchingDAO.deleteMatching(matchingDTO);
      //변수에 저장된 값을 나를 호출한 놈에게 돌려준다.
      return deleteMatching;
   }
   
   //게시물 검색 개수 가져오기
   public int getMatchListCnt(MatchingSearchDTO matchingSearchDTO ) {
      
      int getMatchListCnt = this.matchingDAO.getMatchListCnt(matchingSearchDTO);
      
      return getMatchListCnt;
   }
   
    // 주석 
    // 매칭 새글쓰기 m_no를 받아 경기장명 셀렉트박스에 적용할 데이터 로드
   @Override
   public List<MatchingDTO> machingStadiumSelectBoxLoad(MatchingDTO dto) {
      return matchingDAO.machingStadiumSelectBoxLoad(dto);
   }
   
   // 주석 
    // 매칭 새글쓰기 m_no, stadium_no를 받아 경기날짜 셀렉트박스에 적용할 데이터 로드
   @Override
   public List<MatchingDTO> machingDaySelectBoxLoad(MatchingDTO dto) {
      return matchingDAO.machingDaySelectBoxLoad(dto);
   }
   
   // 주석 
    // 매칭 새글쓰기 m_no, stadium_no를 받아 경기시간 셀렉트박스에 적용할 데이터 로드
   @Override
   public List<MatchingDTO> machingTimeSelectBoxLoad(MatchingDTO dto) {
      return matchingDAO.machingTimeSelectBoxLoad(dto);
   }
   
   //승낙 대기 리스트로 팀정보 넘어감
   public int regWaitingList(MatchingDTO matchingDTO) {
	  int member11 = this.matchingDAO.checkMember11(matchingDTO);
	  if(member11 < 11)
	  {
		  return 3;
	  }
      int checkOverLapMatchCnt = this.matchingDAO.checkOverLapMatchCnt(matchingDTO);
      if(checkOverLapMatchCnt == 1)
      {
         return 2;
      }
      int regWaitingList = this.matchingDAO.regWaitingList(matchingDTO);
      return regWaitingList;
   }
}