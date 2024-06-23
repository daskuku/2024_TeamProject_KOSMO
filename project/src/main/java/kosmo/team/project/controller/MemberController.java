package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.MatchingDTO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.TeamDTO;
import kosmo.team.project.dto.bookingDTO;
import kosmo.team.project.service.MatchingService;
import kosmo.team.project.service.MemberService;

@Controller
public class MemberController {
	

    @Autowired
    private MemberService memberService;
	
    	//회원가입창
		@RequestMapping(value = "/memberRegForm.do")
	    public ModelAndView memberRegForm() {
	    	
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("memberRegForm.jsp");
	    	
	        return mav;
	    }
		
		//회원가입 시도
		@RequestMapping( value="/memberRegProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		
		public Map<String,String> memberRegProc(MemberDTO memberDTO)
		{
		    
			Map<String,String> resultMap = new HashMap<String,String>();
			
			int memberCnt = this.memberService.insertMember(memberDTO);
		
			resultMap.put("result", memberCnt+"");
		
			return resultMap;
		}
		
		
		@RequestMapping( value="/midFindProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int midFindProc(@RequestParam(value="mid")String mid)
		{
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("mid", mid);
		
		int memberCnt = this.memberService.getmid(map);
	
		return memberCnt;
		}
		
		
		@RequestMapping(value = "/memUpdateForm.do")
		  public ModelAndView memUpdateForm(@RequestParam(value="mid")String mid ) {

			 MemberDTO memberDTO = this.memberService.updateMem(mid);
		     ModelAndView mav = new ModelAndView();

		     mav.setViewName("/myPage/memUpdateForm.jsp");
		     mav.addObject("memberDTO", memberDTO);

		     return mav;
		  }
		
		//마이페이지 관련 컨트롤러
		@RequestMapping(value = "/myPageForm.do")
		  public ModelAndView myPageForm(@RequestParam(value="mid")String mid, @RequestParam(value="m_no")int m_no, TeamDTO teamDTO) {
			
			//마이페이지에 있는 내 정보 가져오기, 오라클 실행결과물을 myInfo라는 변수에 저장
			 MemberDTO myInfo = this.memberService.getMyInfo(m_no);
			 
			//마이페이지에 있는 내 정보에서 팀을 클릭하면 팀 멤버목록 출력.
			 List<TeamDTO> teamInfo = this.memberService.getTeamInfo(m_no);
			 
			//마이페이지에 있는 내 기록 가져오기, 오라클 실행결과물을 myStat라는 변수에 저장
			 MemberDTO myStat = this.memberService.getMyStat(mid);
			 
			//내가 팀장일때 팀원모집 승낙 대기인원이 있을때
			 int WaitingCnt = this.memberService.getWaitingCnt(m_no);
			 
			//내가 팀장일때 용병모집 승낙 대기인원이 있을때
			 int mercWaitingCnt = this.memberService.getMercWaitingCnt(m_no);
			 
			//팀원승낙 대기인원 정보가져오기
			 List<TeamDTO> waitList = this.memberService.getWaitingList(m_no);
			 
			//용병승낙 대기인원 정보가져오기
			 List<TeamDTO> waitHiredList = this.memberService.getWaitingHiredList(m_no);
			 
			//레슨승낙 대기인원 정보가져오기
			 List<TeamDTO> waitLessonList = this.memberService.getWaitingLessonList(m_no);
			 
			//팀에 속해있는 용병 목록 가져오기
			 List<TeamDTO> getHiredList = this.memberService.getHiredList(m_no);
			 
			//매칭승낙 대기팀 정보 가져오기
			 List<MatchingDTO> matchWaitingList = this.memberService.getMatchWaitingList(m_no);
			 
			//예약한 경기장 가져오기
			 List<bookingDTO> bookedStadium = this.memberService.getBookedStadium(m_no);
			 
			//다음 경기 일정 가져오기
			 List<TeamDTO> getTeamMatchDay = this.memberService.getTeamMatchDay(m_no);
			 
			//내가 팀장일때 매칭 신청이 들어왔을때
			 int matchWaitingCnt = this.memberService.getmatchWaitingCnt(m_no);

		    //나의 레슨을 듣는 인원목록 가져오기
			 List<TeamDTO> getLessonList = this.memberService.getLessonList(m_no);
			 
			 
			 
			 
		     ModelAndView mav = new ModelAndView();

		     mav.setViewName("/myPage/myPageForm.jsp");
		     //myInfo에 저장한 결과물을 페이지에서 requestScope를 사용해 얻어낼수 있게 설정
		     mav.addObject("myInfo", myInfo);
		     //myStat에 저장한 결과물을 페이지에서 requestScope를 사용해 얻어낼수 있게 설정
		     mav.addObject("myStat", myStat);
		     //bookedStadium에 저장한 결과물을 페이지에서 requestScope를 사용해 얻어낼수 있게 설정
		     mav.addObject("bookedStadium", bookedStadium);
		     //팀원승낙대기중인 인원이 있나 확인 
		     mav.addObject("WaitingCnt", WaitingCnt);
		     //용병승낙대기중인 인원이 있나 확인 
		     mav.addObject("mercWaitingCnt", mercWaitingCnt);
		     //매칭대기중인 팀이 있나 확인 
		     mav.addObject("matchWaitingCnt", matchWaitingCnt);
		     //팀원승낙대기중인 인원목록
		     mav.addObject("waitList", waitList);
		     //용병승낙대기중인 인원목록
		     mav.addObject("waitHiredList", waitHiredList);
		     //레슨승낙대기중인 인원목록
		     mav.addObject("waitLessonList", waitLessonList);
		     //매칭대기중인 팀 목록
		     mav.addObject("matchWaitingList", matchWaitingList);
		     //내팀 정보
		     mav.addObject("teamInfo", teamInfo);
		     //내팀 용병 정보
		     mav.addObject("getHiredList", getHiredList);
		     //다음경기 일정 가져오기
		     mav.addObject("getTeamMatchDay", getTeamMatchDay);
		     //나의 레슨을 듣는 인원목록 가져오기
		     mav.addObject("getLessonList", getLessonList);

		     return mav;
		  }
		
		@RequestMapping( value="/memUpdateProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		
		public Map<String,String> memUpdateProc(MemberDTO memberDTO)
		{
		    
			Map<String,String> resultMap = new HashMap<String,String>();
			
			int memberCnt = this.memberService.updateMem(memberDTO);
		
			resultMap.put("result", memberCnt+"");
		
			return resultMap;
		}
		
		
		//팀 생성
		@RequestMapping( value="/registTeamProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String,String> registTeamProc(TeamDTO teamDTO)
		{
			Map<String,String> resultMap = new HashMap<String,String>();
			
			int teamRegCnt = this.memberService.registTeam(teamDTO);
		
			resultMap.put("result", teamRegCnt+"");
		
			return resultMap;
		}
		
		//팀 수락/거절
		@RequestMapping( value="/regTeamMemberProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String,String> regTeamMemberProc(TeamDTO teamDTO)
		{
			Map<String,String> resultMap = new HashMap<String,String>();
			
			if(teamDTO.getReg() == 1)
			{
				//승낙 수락 할때
				 int approveMem = this.memberService.regTeamMem(teamDTO);
				 resultMap.put("result", approveMem+"");
			}
			 
			if(teamDTO.getRefuse() == 1)
			{
				//승낙 거절 할때
				 int refuseMem = this.memberService.refuseTeamMem(teamDTO);
				 resultMap.put("refuse", refuseMem+"");
			}
		
			return resultMap;
		}
		
		//매칭 수락/거절
		@RequestMapping( value="/matchingTeamProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String,String> matchingTeamProc(TeamDTO teamDTO)
		{
			Map<String,String> resultMap = new HashMap<String,String>();
			
			int approveMatch = this.memberService.matchReg(teamDTO);
			resultMap.put("approveMatch", approveMatch+"");
		
			return resultMap;
		}
		
		//용병 수락/거절
		@RequestMapping( value="/regHiredProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String,String> regHiredProc(TeamDTO teamDTO)
		{
			Map<String,String> resultMap = new HashMap<String,String>();
			
			if(teamDTO.getReg() == 1)
			{
				//승낙 수락 할때
				 int approveHired = this.memberService.regHired(teamDTO);
				 
				 resultMap.put("result", approveHired+"");
			}
			 
			if(teamDTO.getRefuse() == 1)
			{
				//승낙 거절 할때
				 int refuseHired = this.memberService.refuseHired(teamDTO);
				 resultMap.put("refuse", refuseHired+"");
			}
		
			return resultMap;
		}
		
		//레슨 수락/거절
		@RequestMapping( value="/reglessonProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String,String> reglessonProc(TeamDTO teamDTO)
		{
			Map<String,String> resultMap = new HashMap<String,String>();
			
			if(teamDTO.getReg() == 1)
			{
				//승낙 수락 할때
				 int approveLesson = this.memberService.regLesson(teamDTO);
				 
				 resultMap.put("result", approveLesson+"");
			}
			 
			if(teamDTO.getRefuse() == 1)
			{
				//승낙 거절 할때
				 int refuseLesson = this.memberService.refuseLesson(teamDTO);
				 resultMap.put("refuse", refuseLesson+"");
			}
		
			return resultMap;
		}
		
		
		
	
		
}