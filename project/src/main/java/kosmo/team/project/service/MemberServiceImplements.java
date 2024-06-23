package kosmo.team.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kosmo.team.project.dao.MemberDAO;
import kosmo.team.project.dto.MatchingDTO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.TeamDTO;
import kosmo.team.project.dto.bookingDTO;

@Service
@Transactional
public class MemberServiceImplements implements MemberService {
	
	
	@Autowired
	private MemberDAO memberDAO;

	public int insertMember(MemberDTO memberDTO)
	{

		int memberCnt = this.memberDAO.insertMember(memberDTO);
		
		int mem_detail = this.memberDAO.insertDetail(memberDTO);
		
		int mem_record = this.memberDAO.insertRecoed(memberDTO);
		
		return memberCnt;
	}
	
	public int getmid(Map<String,String> mid)
	{

		int memberCnt = this.memberDAO.getmid(mid);
		
		
		return memberCnt;
	}
	
	public MemberDTO updateMem(String mid)
	{
		MemberDTO updateMem = this.memberDAO.updateMemForm(mid);
		
		return updateMem;
	}
	
	//마이페이지에 있는 내 정보 가져오기
	public MemberDTO getMyInfo(int m_no)
	 {
		 MemberDTO getMyInfo = this.memberDAO.getMyInfo(m_no);
		 
		 return getMyInfo;
		 
	 }
	//마이페이지에 있는 내 기록 가져오기
	public MemberDTO getMyStat(String mid)
	{
		 MemberDTO getMyStat = this.memberDAO.getMyStat(mid);
		 
		 return getMyStat;
	}
	
	public int updateMem(MemberDTO memberDTO)
	{
		int updateMem = this.memberDAO.updateMem(memberDTO);
		
		return updateMem;
	}
	
	public List<bookingDTO> getBookedStadium(int m_no) {
		
		List<bookingDTO> getBookedStadium = this.memberDAO.getBookedStadium(m_no);
		
		return getBookedStadium;
	}
	//팀 생성
	public int registTeam(TeamDTO teamDTO){
		
		int registTeam = this.memberDAO.registTeam(teamDTO);
		
		int firstTeamMem = this.memberDAO.firstTeamMem(teamDTO);
		
		if(registTeam > 1) {
			return 2;
		}
		return registTeam;
	}

    //승낙테이블의 개수가 몇개인지 확인
    public int getWaitingCnt(int m_no) {
    	int getWaitingCnt = this.memberDAO.getWaitingCnt(m_no);
    	
    	return getWaitingCnt;
    }
    
    //용병 승낙테이블의 개수가 몇개인지 확인
    public int getMercWaitingCnt(int m_no) {
  		int getMercWaitingCnt = this.memberDAO.getMercWaitingCnt(m_no);
  		
  		return getMercWaitingCnt;
  	}
    
    //팀원승낙 대기인원 정보가져오기
    public List<TeamDTO> getWaitingList(int m_no){
  		List<TeamDTO> getWaitingList = this.memberDAO.getWaitingList(m_no);
  		 return getWaitingList;
  	 }
    

	//팀원승낙 수락 할때
	 public int regTeamMem(TeamDTO teamDTO){
		 int regTeamMem = this.memberDAO.regTeamMem(teamDTO);
		 int delWaitingList = this.memberDAO.delWaitingList(teamDTO);
		 return regTeamMem;
	 }
	 
	//팀원승낙 거절 할때
	 public int refuseTeamMem(TeamDTO teamDTO) {
		 int delWaitingList = this.memberDAO.delWaitingList(teamDTO);
		 return delWaitingList;
		 
	 }
	 
	//마이페이지에 있는 내 정보에서 팀을 클릭하면 팀 멤버목록 출력.
	 public List<TeamDTO> getTeamInfo(int m_no) {
		
		 List<TeamDTO> getTeamInfo = this.memberDAO.getTeamInfo(m_no);
		
		return getTeamInfo;
	}
	 
	 
	//내가 팀장일때 매칭 신청이 들어왔을때
	public int getmatchWaitingCnt(int m_no) {
		int getmatchWaitingCnt = this.memberDAO.getmatchWaitingCnt(m_no);
		return getmatchWaitingCnt;
		
	}
	

	//매칭승낙 대기팀 정보 가져오기
	public List<MatchingDTO> getMatchWaitingList(int m_no){
		List<MatchingDTO> getMatchWaitingList = this.memberDAO.getMatchWaitingList(m_no);
		 return getMatchWaitingList;
	 }
	
	//매칭수락
	public int matchReg(TeamDTO teamDTO) {
		int matchReg = this.memberDAO.matchReg(teamDTO);
		int updateChecking = this.memberDAO.updateChecking(teamDTO);
		int delMatch = this.memberDAO.delMatch(teamDTO);
		return matchReg;
	}
	
	//다음 경기 일정 가져오기
	public List<TeamDTO> getTeamMatchDay(int m_no){
		//수락팀에서
		List<TeamDTO> getTeamMatchDay_match = this.memberDAO.getTeamMatchDay_match(m_no);
		if(getTeamMatchDay_match.isEmpty() == true)
		{
			List<TeamDTO> getTeamMatchDay_vs = this.memberDAO.getTeamMatchDay_vs(m_no);
			return getTeamMatchDay_vs;
		}
		return getTeamMatchDay_match;
	}
	
	//용병승낙 대기인원 정보가져오기
	public List<TeamDTO> getWaitingHiredList(int m_no){
		List<TeamDTO> getWaitingHiredList = this.memberDAO.getWaitingHiredList(m_no);
		return getWaitingHiredList;
	}
	
	//용병승낙 수락 할때
	public int regHired(TeamDTO teamDTO) {
		 int regHired = this.memberDAO.regHired(teamDTO);
		 int delHired = this.memberDAO.delHired(teamDTO);
		 return regHired;
		 
	 }
	//용병승낙 거절 할때
	public int refuseHired(TeamDTO teamDTO) {
		int delHired = this.memberDAO.delHired(teamDTO);
		return delHired;
	 }
	
	//팀에 속해있는 용병 목록 가져오기
	public List<TeamDTO> getHiredList(int m_no){
		 List<TeamDTO> getHiredList = this.memberDAO.getHiredList(m_no);
		 return getHiredList;
	 }
	
	//레슨승낙 수락 할때
	public int regLesson(TeamDTO teamDTO) {
		 int regLesson = this.memberDAO.regLesson(teamDTO);
		 int delLesson = this.memberDAO.delLesson(teamDTO);
		 return regLesson;
	}
	
	//레슨승낙 거절 할때
	public int refuseLesson(TeamDTO teamDTO) {
		int delLesson = this.memberDAO.delLesson(teamDTO);
		return delLesson;
	}
	
	//레슨승낙 대기인원 정보가져오기
	public List<TeamDTO> getWaitingLessonList(int m_no){
		 List<TeamDTO> getWaitingLessonList = this.memberDAO.getWaitingLessonList(m_no);
		 return getWaitingLessonList;
	}
	
	 //나의 레슨을 듣는 인원목록 가져오기
	public List<TeamDTO> getLessonList(int m_no){
		 List<TeamDTO> getLessonList = this.memberDAO.getLessonList(m_no);
		 return getLessonList;
	 }
}
