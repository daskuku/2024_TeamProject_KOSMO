package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.AdminCommunitySearchDTO;
import kosmo.team.project.dto.AdminSearchDTO;
import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.MemberSearchSettingDTO;
import kosmo.team.project.dto.MemberSearchShowHideSettingDTO;
import kosmo.team.project.dto.PlayerRecordDTO;
import kosmo.team.project.dto.SidoSearchSettingDTO;
import kosmo.team.project.dto.SidoSearchShowHideSettingDTO;
import kosmo.team.project.dto.Stadim2DTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;
import kosmo.team.project.service.AdminService;
import kosmo.team.project.utility.Page;

@Controller
public class AdminController {

	private final String adminFolder = "/admin/";

	@Autowired
	private AdminService adminService;

	
	
	
	
	@RequestMapping("/adminForm.do")

	public ModelAndView adminForm(AdminSearchDTO adminSearchDTO, MemberSearchSettingDTO memberSearchSettingDTO,SidoSearchSettingDTO sidoSearchSettingDTO ,HttpSession session  ) {
		
		
		// 세션에서 사용자 아이디를 가져옴
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}
		
		
		
		
//		int[] no = {5, 8, 3, 2};
//		int tmp = 0;
//
//		for (int i = 0; i < no.length - 1; i++) {
//		    for (int j = 0; j < no.length - 1; j++) {
//		        if (no[j] > no[j + 1]) {
//		            tmp = no[j];       // Store the value of no[j] in tmp
//		            no[j] = no[j + 1]; // Assign the value of no[j+1] to no[j]
//		            no[j + 1] = tmp;   // Assign the value in tmp to no[j+1]
//		        }
//		    }
//		}
//		// 정렬된 배열 출력
//		for (int i = 0; i < no.length; i++) {
//			System.out.print(no[i] + " ");
//		}
//		
		
		
		
		// admin인 경우에만 회원 목록 조회 수행
		int memberListAllCnt = this.adminService.getMemberListAllCnt();

		int memberListCnt = this.adminService.getMemberListCnt(adminSearchDTO);
			
		
		Map<String, Integer> memberMap = Page.getPagingMap(

				adminSearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, adminSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, memberListCnt // 검색 결과물 개수

		);

		adminSearchDTO.setSelectPageNo((int) memberMap.get("selectPageNo"));
		adminSearchDTO.setRowCntPerPage((int) memberMap.get("rowCntPerPage"));
		adminSearchDTO.setBegin_rowNo((int) memberMap.get("begin_rowNo"));
		adminSearchDTO.setEnd_rowNo((int) memberMap.get("end_rowNo"));
			
		
	    // System.out.println("gender: " + adminSearchDTO.getAgeRange());
		//System.out.println("maxDate1: " + adminSearchDTO.getMaxDate());
		
		List<MemberDTO> memberList = this.adminService.getMemberList(adminSearchDTO);
		//System.out.println("maxDate2: " + adminSearchDTO.getMaxDate());
		List<MemberSearchSettingDTO> memberSearchSettingList = this.adminService.getMemberSearchSettingList(memberSearchSettingDTO);
		
		
		List<MemberSearchSettingDTO> memberShowHideSettingList = this.adminService.getMemberShowHideSettingList(memberSearchSettingDTO);
		
		
		List<SidoSearchSettingDTO> sidoSearchSettingList = this.adminService.getSidoSearchSettingList(sidoSearchSettingDTO);
		
		List<SidoSearchSettingDTO> sidoShowHideSettingList = this.adminService.getSidoShowHideSettingList(sidoSearchSettingDTO);
		
		

		//System.out.println("Sigungu  " + adminSearchDTO.getSigungu());
		//System.out.println("Keyword2  " + adminSearchDTO.getKeyword2());
		
		//System.out.println("minDate: " + adminSearchDTO.getMinDate());

		
		ModelAndView mav = new ModelAndView();

		mav.addObject("memberList", memberList);
		mav.addObject("memberSearchSettingList", memberSearchSettingList);
		
		mav.addObject("memberShowHideSettingList", memberShowHideSettingList);
		
		mav.addObject("sidoSearchSettingList", sidoSearchSettingList);
		
		mav.addObject("sidoShowHideSettingList", sidoShowHideSettingList);
		
		mav.addObject("memberListCnt", memberListCnt);
		mav.addObject("memberListAllCnt", memberListAllCnt);
		mav.addObject("memberMap", memberMap);
		mav.setViewName(adminFolder + "adminForm.jsp");

		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/MemberSettingProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
		public Map<String, String> MemberSettingProc(
				MemberSearchShowHideSettingDTO memberSearchShowHideSettingDTO
	
		) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();


		int updateMemberSearchShowHideSetting = this.adminService.updateMemberSearchShowHideSetting(memberSearchShowHideSettingDTO);



		resultMap.put("result", updateMemberSearchShowHideSetting + "");


		return resultMap;
	}
	
	
	
	@RequestMapping(value = "/SidoSettingProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
		public Map<String, String> SidoSettingProc(
				SidoSearchShowHideSettingDTO sidoSearchShowHideSettingDTO
	
		) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();


		List<String> updateSidoSearchShowHideSetting = this.adminService.updateSidoShowHideSetting(sidoSearchShowHideSettingDTO);



		resultMap.put("result", updateSidoSearchShowHideSetting + "");


		return resultMap;
	}
	
	
	
	

	@RequestMapping(value = "/adminMemberDetailForm.do")
	public ModelAndView adminMemberDetailForm(
			@RequestParam(value = "m_no") int m_no

			, HttpSession session

	) {

		// 세션에서 사용자 아이디를 가져옴
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}

		// BoardDTO boardDTO = this.boardService.getBoard(b_no, true);
		MemberDTO memberDTO = this.adminService.getMember(m_no);

		PlayerRecordDTO playerRecordDTO = this.adminService.getPlayerRecord(m_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("memberDTO", memberDTO);

		mav.addObject("playerRecordDTO", playerRecordDTO);

		// System.out.println(memberDTO.getGender());
		mav.setViewName(adminFolder + "adminMemberDetailForm.jsp");

		return mav;

	}

	@RequestMapping(value = "/memberDetailUpDelForm.do")

	public ModelAndView memberDetailUpDelForm(
			@RequestParam(value = "m_no") int m_no

			, HttpSession session

	) {
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}

		MemberDTO memberDTO = this.adminService.getMemberForUpDel(m_no);

		PlayerRecordDTO playerRecordDTO = this.adminService.getRecordUpDel(m_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("memberDTO", memberDTO);

		mav.addObject("playerRecordDTO", playerRecordDTO);

		mav.setViewName(adminFolder + "memberDetailUpDelForm.jsp");

		return mav;

	}

	@RequestMapping(value = "/adminMemberUpProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
		public Map<String, String> adminMemberUpProc(
				MemberDTO memberDTO, PlayerRecordDTO playerRecordDTO
	
		) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		// -------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기
		// -------------------------------------------
		int memberUpCnt = this.adminService.updateMember(memberDTO);
		int playerRecordUpCnt = this.adminService.updatePlayerRecord(playerRecordDTO);
		//System.out.println(memberDTO.getNickname());
		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기기
		// -------------------------------------------
		resultMap.put("result", memberUpCnt + "");
		resultMap.put("result2", playerRecordUpCnt + "");

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}

	@RequestMapping(value = "/adminMemberDelProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> adminMemberDelProc(
			MemberDTO memberDTO, PlayerRecordDTO playerRecordDTO

	) {
		Map<String, String> resultMap = new HashMap<String, String>();

		int memberDelCnt = this.adminService.deleteMember(memberDTO);
		int PlayerRecordDelCnt = this.adminService.deletePlayerRecord(playerRecordDTO);

		resultMap.put("result", memberDelCnt + "");
		resultMap.put("result2", PlayerRecordDelCnt + "");

		return resultMap;
	}

	// ------------------------------------------------------------------
	// 공지사항
	// ------------------------------------------------------------------

	@RequestMapping("/adminNoticeBoardForm.do")
	public ModelAndView adminNoticeBoardForm(AdminSearchDTO adminSearchDTO, HttpSession session) {
		// 세션에서 사용자 아이디를 가져옴
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}
		// admin인 경우에만 회원 목록 조회 수행
		int noticeBoardListAllCnt = this.adminService.getNoticeBoardAllCnt();

		int noticeBoardListCnt = this.adminService.getNoticeBoardListCnt(adminSearchDTO);

		Map<String, Integer> noticeBoardMap = Page.getPagingMap(

				adminSearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, adminSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, noticeBoardListCnt // 검색 결과물 개수

		);

		adminSearchDTO.setSelectPageNo((int) noticeBoardMap.get("selectPageNo"));
		adminSearchDTO.setRowCntPerPage((int) noticeBoardMap.get("rowCntPerPage"));
		adminSearchDTO.setBegin_rowNo((int) noticeBoardMap.get("begin_rowNo"));
		adminSearchDTO.setEnd_rowNo((int) noticeBoardMap.get("end_rowNo"));
		
		

		List<CommunityDTO> noticeBoardList = this.adminService.getNoticeBoardList(adminSearchDTO);


		
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("noticeBoardList", noticeBoardList);

		mav.addObject("noticeBoardListCnt", noticeBoardListCnt);

		mav.addObject("noticeBoardListAllCnt", noticeBoardListAllCnt);

		mav.addObject("noticeBoardMap", noticeBoardMap);

		mav.setViewName(adminFolder + "adminNoticeBoardForm.jsp");

		return mav;
	}

	// 공지사항상세보기 < 여기 작업이다
	@RequestMapping(value = "/adminNoticeboardDetailForm.do")
	public ModelAndView adminNoticeboardDetailForm(
			// --------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// 저런식으러 선언하면 파라미터는 필수로 들어와야한다 아니면 예외가 터짐
			// 사실 숫자 문자지만 정수로 바꿔서 들어오는거다.
			// --------------------------------------
			@RequestParam(value = "b_no") int b_no

	) {

		// BoardDTO boardDTO = this.boardService.getBoard(b_no, true);
		CommunityDTO communityDTO = this.adminService.getNoticeBoard(b_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("communityDTO", communityDTO);

		mav.setViewName(adminFolder + "adminNoticeboardDetailForm.jsp");

		return mav;

	}

	@RequestMapping(value = "/adminNoticeboardUpDelForm.do")

	public ModelAndView adminNoticeboardUpDelForm(
			@RequestParam(value = "b_no") int b_no

	) {

		// BoardDTO boardDTO = this.boardService.getBoard(b_no,false);
		CommunityDTO communityDTO = this.adminService.getNoticeBoardForUpDel(b_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("communityDTO", communityDTO);

		mav.setViewName(adminFolder + "adminNoticeboardUpDelForm.jsp");

		return mav;

	}

	@RequestMapping(value = "/adminNoticeboardUpProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> adminNoticeboardUpProc(
			CommunityDTO communityDTO

	) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		// -------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기
		// -------------------------------------------
		int noticeboardUpCnt = this.adminService.updateNoticeBoard(communityDTO);

		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기
		// -------------------------------------------
		resultMap.put("result", noticeboardUpCnt + "");

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}

	@RequestMapping(value = "/adminNoticeboardDelProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> adminNoticeboardDelProc(

			CommunityDTO communityDTO

	) {
		Map<String, String> resultMap = new HashMap<String, String>();

		int boardDelCnt = this.adminService.deleteNoticeBoard(communityDTO);

		resultMap.put("result", boardDelCnt + "");

		return resultMap;
	}

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// URL 주소 /boardRegForm.do 로 접근하면 호출되는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@RequestMapping(value = "/adminNoticeboardRegForm.do")
	public ModelAndView adminNoticeboardRegForm() {
		// ----------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		// -------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName(adminFolder + "adminNoticeboardRegForm.jsp");
		// ----------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		// ----------------------------------------------------
		return mav;
	}

	@RequestMapping(value = "/adminNoticeboardRegProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> adminNoticeboardRegProc(CommunityDTO communityDTO) {

		Map<String, String> resultMap = new HashMap<String, String>();

		int adminNoticeboardRegCnt = this.adminService.insertNoticeBoard(communityDTO);

		resultMap.put("result", adminNoticeboardRegCnt + "");

		return resultMap;
	}

	
	
	//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
	//경기장
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	
	
	
	@RequestMapping("/adminStadiumForm.do")

	public ModelAndView adminStadiumForm(AdminSearchDTO adminSearchDTO, HttpSession session  ) {
		
		
		// 세션에서 사용자 아이디를 가져옴
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}
		

		
		
		// admin인 경우에만 회원 목록 조회 수행
		int StadiumListAllCnt = this.adminService.getStadiumListAllCnt();

		int StadiumListCnt = this.adminService.getStadiumListCnt(adminSearchDTO);
			
		
		Map<String, Integer> StadiumMap = Page.getPagingMap(

				adminSearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, adminSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, StadiumListCnt // 검색 결과물 개수

		);

		adminSearchDTO.setSelectPageNo((int) StadiumMap.get("selectPageNo"));
		adminSearchDTO.setRowCntPerPage((int) StadiumMap.get("rowCntPerPage"));
		adminSearchDTO.setBegin_rowNo((int) StadiumMap.get("begin_rowNo"));
		adminSearchDTO.setEnd_rowNo((int) StadiumMap.get("end_rowNo"));
			
		

		
		List<Stadim2DTO> stadiumList = this.adminService.getStadiumList(adminSearchDTO);

	
		//System.out.println("minDate: " + adminSearchDTO.getMinDate());

		
		ModelAndView mav = new ModelAndView();

		mav.addObject("stadiumList", stadiumList);

		mav.addObject("StadiumListCnt", StadiumListCnt);
		mav.addObject("StadiumListAllCnt", StadiumListAllCnt);
		mav.addObject("StadiumMap", StadiumMap);
		mav.setViewName(adminFolder + "adminStadiumForm.jsp");

		return mav;
	}
	
	
	
	@RequestMapping(value = "/adminStadiumDetailForm.do")
	public ModelAndView adminStadiumDetailForm(
			// --------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// 저런식으러 선언하면 파라미터는 필수로 들어와야한다 아니면 예외가 터짐
			// 사실 숫자 문자지만 정수로 바꿔서 들어오는거다.
			// --------------------------------------
			@RequestParam(value = "stadium_no") int stadium_no

	) {

		// BoardDTO boardDTO = this.boardService.getBoard(b_no, true);
		Stadim2DTO stadim2DTO = this.adminService.getStadium(stadium_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("stadim2DTO", stadim2DTO);

		mav.setViewName(adminFolder + "adminStadiumDetailForm.jsp");

		return mav;

	}
	
	
	
	@RequestMapping(value = "/adminStadiumUpDelForm.do")

	public ModelAndView adminStadiumUpDelForm(@RequestParam(value = "stadium_no") int stadium_no) {

		// BoardDTO boardDTO = this.boardService.getBoard(b_no,false);
		Stadim2DTO stadim2DTO = this.adminService.getStadiumForUpDel(stadium_no);

		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("stadim2DTO", stadim2DTO);

		mav.setViewName(adminFolder + "adminStadiumUpDelForm.jsp");

		return mav;

	}
	

	@RequestMapping(value = "/adminStadiumUpProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> adminStadiumUpProc(Stadim2DTO stadim2DTO) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		// -------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기
		// -------------------------------------------
		int stadiumUpCnt = this.adminService.updateStadium(stadim2DTO);

		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기
		// -------------------------------------------
		resultMap.put("result", stadiumUpCnt + "");

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}

	@RequestMapping(value = "/adminStadiumDelProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> adminStadiumDelProc(Stadim2DTO stadim2DTO) {
		Map<String, String> resultMap = new HashMap<String, String>();

		int boardDelCnt = this.adminService.deleteStadium(stadim2DTO);

		resultMap.put("result", boardDelCnt + "");

		return resultMap;
	}
	
	
	@RequestMapping(value = "/adminStadiumRegForm.do")
	public ModelAndView adminStadiumRegForm() {
		// ----------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
		// -------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName(adminFolder + "adminStadiumRegForm.jsp");
		// ----------------------------------------------------
		// [ModelAndView 객체] 리턴하기
		// ----------------------------------------------------
		return mav;
	}

	
	
	
	
	@RequestMapping(value = "/adminStadiumRegProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> adminStadiumRegProc(Stadim2DTO stadim2DTO) {

		Map<String, String> resultMap = new HashMap<String, String>();

		int adminStadiumRegCnt = this.adminService.insertStadium(stadim2DTO);

		resultMap.put("result", adminStadiumRegCnt + "");

		return resultMap;
	}

	
	//========================================================================================================================================
	// 대회일정 관련 어드민 페이지
	//========================================================================================================================================
	
	//게시물 페이지
	@RequestMapping(value = "/adminTournamentBoardForm.do")
    public ModelAndView tournamentBoardForm(TournamentSearchDTO tournamentSearchDTO) {
    	
 		int getTournamentListCnt = this.adminService.getTournamentListCnt(tournamentSearchDTO);
 
 		Map<String, Integer> tournamentMap = Page.getPagingMap(
 			tournamentSearchDTO.getSelectPageNo()// 선택한 페이지 번호
			, tournamentSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
			, getTournamentListCnt // 검색 결과물 개수
		);
    	
 		tournamentSearchDTO.setSelectPageNo((int) tournamentMap.get("selectPageNo"));
 		tournamentSearchDTO.setRowCntPerPage((int) tournamentMap.get("rowCntPerPage"));	
 		tournamentSearchDTO.setBegin_rowNo((int) tournamentMap.get("begin_rowNo"));
 		tournamentSearchDTO.setEnd_rowNo((int) tournamentMap.get("end_rowNo"));
	 
    	List<TournamentDTO> tournamentList = this.adminService.getTournamentList(tournamentSearchDTO);
        ModelAndView mav = new ModelAndView();
       
        mav.addObject("tournamentList", tournamentList);
        mav.addObject("tournamentMap", tournamentMap);
        mav.setViewName("/admin/adminTournamentBoardForm.jsp");
        
        return mav;
    }
	
	//상세보기 페이지
	@RequestMapping(value = "/adminTournamentDetailForm.do")
    public ModelAndView tournamentDetailForm(@RequestParam(value="list_no")int list_no) {
		
		TournamentDTO tournamentDetail = this.adminService.getTournamentDetail(list_no);
        ModelAndView mav = new ModelAndView();
       
        mav.setViewName("/admin/adminTournamentBoardDetailForm.jsp");
        mav.addObject("detail", tournamentDetail);
        
        return mav;
    }
	
	//수정 페이지
	@RequestMapping(value = "/adminTournamentBoardUpForm.do")
    public ModelAndView TournamentBoardUpForm(@RequestParam(value="list_no")int list_no) {
		
		TournamentDTO tournamentDetail = this.adminService.getTournamentDetail(list_no);
        ModelAndView mav = new ModelAndView();
       
        mav.setViewName("/admin/adminTournamentBoardUpForm.jsp");
        mav.addObject("detail", tournamentDetail);
        
        return mav;
    }
	
	//대회일정 수정
	@RequestMapping(value = "/upTournamentBoardProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> upTournamentBoardProc(TournamentDTO tournamentDTO) {

		Map<String, String> resultMap = new HashMap<String, String>();
		
		int updateCnt = this.adminService.updateCnt(tournamentDTO);

		resultMap.put("result",  updateCnt+"");

		return resultMap;
	}

	
	//삭제관련
	@RequestMapping(value = "/deleteTournamentProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> deleteTournamentProc(@RequestParam(value="list_no")int list_no) {

		Map<String, String> resultMap = new HashMap<String, String>();
		
		int deleteCnt = this.adminService.deleteBoard(list_no);

		resultMap.put("result",  deleteCnt+"");

		return resultMap;
	}
	
	//새 글쓰기 페이지
	@RequestMapping(value = "/newTournamentBoard.do")
    public ModelAndView newTournamentBoard() {
		
        ModelAndView mav = new ModelAndView();
       
        mav.setViewName("/admin/newTournamentBoard.jsp");
        
        return mav;
    } 
	
	//새글 쓰기
	@RequestMapping(value = "/newTournamentBoardProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> newTournamentBoardProc(TournamentDTO tournamentDTO) {

		Map<String, String> resultMap = new HashMap<String, String>();
		
		int regCnt = this.adminService.regBoard(tournamentDTO);

		resultMap.put("result",  regCnt+"");

		return resultMap;
	}
	
	
	
	
	
	
	
	
     // ----------------------------------------------------------------
		// admin 갤러리 리스트
		// ----------------------------------------------------------------
		/*** 갤러리 페이지 ***/
		@RequestMapping(value = "/adminGallaryForm.do")
		public ModelAndView adminGallaryForm(AdminCommunitySearchDTO communitySearchDTO, HttpSession session) {
			// 세션에서 사용자 아이디를 가져옴
			String userId = (String) session.getAttribute("mid");
			// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
			if (userId == null || !userId.equals("admin")) {
				return new ModelAndView("redirect:/loginForm.do");
			}
			// IMAGEBOARD TABLE 에서 WRITER 컬럼 VARCHAR2 -> NUMBER 바꿔야 하는데 커뮤니티 말고 다른 곳에서도 이테이블
			// 사용하여 컬럼 NUMBER로 변경 보류(갤러리 테이블도 없다)
			// 로그인 하여 닉네임으로 보여주는 것도 작업할 수 없어 '이미지보드 테이블' as "WRITER" 하여 채웠다.

			int communityGallaryBoardListAllCnt = adminService.getCommunityGallaryBoardListAllCnt();
			int communityGallaryBoardListCnt = adminService.getCommunityGallaryBoardListCnt(communitySearchDTO);

			Map<String, Integer> communityGallaryBoardPageMap = Page.getPagingMap(communitySearchDTO.getSelectPageNo() // 선택한
																														// 페이지
																														// 번호
					, 8 // 페이지 당 보여줄 검색 행의 개수
					, communityGallaryBoardListCnt // 검색 결과물 개수
			);

			communitySearchDTO.setSelectPageNo((int) communityGallaryBoardPageMap.get("selectPageNo"));
			communitySearchDTO.setRowCntPerPage((int) communityGallaryBoardPageMap.get("rowCntPerPage"));
			communitySearchDTO.setBegin_rowNo((int) communityGallaryBoardPageMap.get("begin_rowNo"));
			communitySearchDTO.setEnd_rowNo((int) communityGallaryBoardPageMap.get("end_rowNo"));

			List<CommunityDTO> communityGallaryBoardList = adminService
					.getCommunityGallaryBoardList(communitySearchDTO);

			ModelAndView mav = new ModelAndView();

			mav.addObject("communityGallaryBoardList", communityGallaryBoardList);
			mav.addObject("communityGallaryBoardListSize", communityGallaryBoardList.size());
			mav.addObject("communityGallaryBoardListCnt", communityGallaryBoardListCnt);
			mav.addObject("communityGallaryBoardListAllCnt", communityGallaryBoardListAllCnt);
			mav.addObject("communityGallaryBoardPageMap", communityGallaryBoardPageMap);

			mav.setViewName(adminFolder + "adminGallaryForm.jsp");

			return mav;
		}

		/*** admin 갤러리 등록 페이지 ***/
		@RequestMapping(value = "/adminNewCommunityGallaryForm.do")
		public ModelAndView adminNewCommunityGallaryForm(CommunityDTO communityDTO, HttpSession session) {
			// 세션에서 사용자 아이디를 가져옴
			String userId = (String) session.getAttribute("mid");
			// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
			if (userId == null || !userId.equals("admin")) {
				return new ModelAndView("redirect:/loginForm.do");
			}

			ModelAndView mav = new ModelAndView();

			mav.setViewName(adminFolder + "adminNewCommunityGallaryForm.jsp");

			return mav;
		}

		/*** admin 갤러리 새글쓰기 ***/
		@ResponseBody
		@RequestMapping(value = "/adminCommunityGallaryProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		public Map<String, String> adminCommunityGallaryProc(CommunityDTO communityDTO) {

			int result = adminService.insertCommunityGallaryProc(communityDTO);

			Map<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("result", result + "");

			return resultMap;
		}
		
		/*** admin 갤러리 상세보기 ***/
		@RequestMapping(value = "/adminCommunityGallaryDetailForm.do")
		public ModelAndView adminCommunityGallaryDetailForm(@RequestParam(value = "b_no") int b_no, HttpSession session) {
			// 세션에서 사용자 아이디를 가져옴
			String userId = (String) session.getAttribute("mid");
			// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
			if (userId == null || !userId.equals("admin")) {
				return new ModelAndView("redirect:/loginForm.do");
			}
			ModelAndView mav = new ModelAndView();

			CommunityDTO dto = this.adminService.getCommunityGallaryDetailForm(b_no, true);

			mav.addObject("communityDTO", dto);

			mav.setViewName(adminFolder + "adminCommunityGallaryDetailForm.jsp");

			return mav;
		}
		
		/*** admin 갤러리 업데이트/삭제 보기 ***/
		@RequestMapping(value = "/adminCommunityGallaryUpDelForm.do")
		public ModelAndView adminCommunityGallaryUpDelForm(@RequestParam(value = "b_no") int b_no, HttpSession session) {
			// 세션에서 사용자 아이디를 가져옴
			String userId = (String) session.getAttribute("mid");
			// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
			if (userId == null || !userId.equals("admin")) {
				return new ModelAndView("redirect:/loginForm.do");
			}
			ModelAndView mav = new ModelAndView();

			CommunityDTO dto = this.adminService.getCommunityGallaryDetailForm(b_no, false);

			mav.addObject("communityDTO", dto);

			mav.setViewName(adminFolder + "adminCommunityGallaryUpDelForm.jsp");

			return mav;
		}
		
		/*** admin 갤러리 업데이트 처리 ***/
		@ResponseBody
		@RequestMapping(value = "/adminCommunityGallaryUpProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		public Map<String, String> adminCommunityGallaryUpProc(CommunityDTO communityDTO) {

			int marketplaceboardUpCnt = this.adminService.updateCommunityGallaryUpProc(communityDTO);
			
			Map<String, String> resultMap = new HashMap<String, String>();

			resultMap.put("result", marketplaceboardUpCnt + "");
			
			return resultMap;
		}
		
		/*** admin 갤러리 삭제 처리 ***/
		@ResponseBody
		@RequestMapping(value = "/adminCommunityGallaryDelProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		public Map<String, String> adminCommunityGallaryDelProc(CommunityDTO communityDTO) {

			int marketplaceboardDelCnt = this.adminService.deleteCommunityGallaryDelProc(communityDTO);
			
			Map<String, String> resultMap = new HashMap<String, String>();

			resultMap.put("result", marketplaceboardDelCnt + "");

			return resultMap;
		}
		
		/*** 장터 페이지 ***/
		   
		@RequestMapping(value = "/adminMarketplaceBoardForm.do")
		public ModelAndView adminMarketplaceBoardForm(AdminCommunitySearchDTO communitySearchDTO, HttpSession session) {
			// 세션에서 사용자 아이디를 가져옴
			String userId = (String) session.getAttribute("mid");
			// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
			if (userId == null || !userId.equals("admin")) {
				return new ModelAndView("redirect:/loginForm.do");
			}
			ModelAndView mav = new ModelAndView();

			// All-------------------------------------------------------------------------------
			int tabAllMarketplaceBoardListAllCnt = adminService.getTabAllMarketplaceBoardListAllCnt();
			int tabAllMarketplaceBoardListCnt = adminService.getTabAllMarketplaceBoardListCnt(communitySearchDTO);

			Map<String, Integer> tabAllMarketplaceBoardPageMap = Page.getPagingMap(communitySearchDTO.getSelectPageNo() // 선택한
																														// 페이지
																														// 번호
					, 8 // 페이지 당 보여줄 검색 행의 개수
					, tabAllMarketplaceBoardListCnt // 검색 결과물 개수
			);

			communitySearchDTO.setSelectPageNo((int) tabAllMarketplaceBoardPageMap.get("selectPageNo"));
			communitySearchDTO.setRowCntPerPage((int) tabAllMarketplaceBoardPageMap.get("rowCntPerPage"));
			communitySearchDTO.setBegin_rowNo((int) tabAllMarketplaceBoardPageMap.get("begin_rowNo"));
			communitySearchDTO.setEnd_rowNo((int) tabAllMarketplaceBoardPageMap.get("end_rowNo"));

			List<CommunityDTO> tabAllMarketplaceBoardList = adminService.getTabAllMarketplaceBoardList(communitySearchDTO);

			mav.addObject("tabAllMarketplaceBoardList", tabAllMarketplaceBoardList);
			mav.addObject("tabAllMarketplaceBoardListSize", tabAllMarketplaceBoardList.size());
			mav.addObject("tabAllMarketplaceBoardListCnt", tabAllMarketplaceBoardListCnt);
			mav.addObject("tabAllMarketplaceBoardListAllCnt", tabAllMarketplaceBoardListAllCnt);
			mav.addObject("tabAllMarketplaceBoardPageMap", tabAllMarketplaceBoardPageMap);

			// Sale-------------------------------------------------------------------------------
			int tabSaleMarketplaceBoardListAllCnt = adminService.getTabSaleMarketplaceBoardListAllCnt();
			int tabSaleMarketplaceBoardListCnt = adminService.getTabSaleMarketplaceBoardListCnt(communitySearchDTO);

			Map<String, Integer> tabSaleMarketplaceBoardPageMap = Page.getPagingMap(communitySearchDTO.getSelectPageNo() // 선택한
																															// 페이지
																															// 번호
					, 8 // 페이지 당 보여줄 검색 행의 개수
					, tabSaleMarketplaceBoardListCnt // 검색 결과물 개수
			);

			communitySearchDTO.setSelectPageNo((int) tabSaleMarketplaceBoardPageMap.get("selectPageNo"));
			communitySearchDTO.setRowCntPerPage((int) tabSaleMarketplaceBoardPageMap.get("rowCntPerPage"));
			communitySearchDTO.setBegin_rowNo((int) tabSaleMarketplaceBoardPageMap.get("begin_rowNo"));
			communitySearchDTO.setEnd_rowNo((int) tabSaleMarketplaceBoardPageMap.get("end_rowNo"));

			List<CommunityDTO> tabSaleMarketplaceBoardList = adminService.getTabSaleMarketplaceBoardList(communitySearchDTO);

			mav.addObject("tabSaleMarketplaceBoardList", tabSaleMarketplaceBoardList);
			mav.addObject("tabSaleMarketplaceBoardListSize", tabSaleMarketplaceBoardList.size());
			mav.addObject("tabSaleMarketplaceBoardListCnt", tabSaleMarketplaceBoardListCnt);
			mav.addObject("tabSaleMarketplaceBoardListAllCnt", tabSaleMarketplaceBoardListAllCnt);
			mav.addObject("tabSaleMarketplaceBoardPageMap", tabSaleMarketplaceBoardPageMap);

			// -------------------------------------------------------------------------------

			// FreeSharing-------------------------------------------------------------------------------
			int tabFreeSharingMarketplaceBoardListAllCnt = adminService.getTabFreeSharingMarketplaceBoardListAllCnt();
			int tabFreeSharingMarketplaceBoardListCnt = adminService.getTabFreeSharingMarketplaceBoardListCnt(communitySearchDTO);

			Map<String, Integer> tabFreeSharingMarketplaceBoardPageMap = Page
					.getPagingMap(communitySearchDTO.getSelectPageNo() // 선택한 페이지 번호
							, 8 // 페이지 당 보여줄 검색 행의 개수
							, tabFreeSharingMarketplaceBoardListCnt // 검색 결과물 개수
					);

			communitySearchDTO.setSelectPageNo((int) tabFreeSharingMarketplaceBoardPageMap.get("selectPageNo"));
			communitySearchDTO.setRowCntPerPage((int) tabFreeSharingMarketplaceBoardPageMap.get("rowCntPerPage"));
			communitySearchDTO.setBegin_rowNo((int) tabFreeSharingMarketplaceBoardPageMap.get("begin_rowNo"));
			communitySearchDTO.setEnd_rowNo((int) tabFreeSharingMarketplaceBoardPageMap.get("end_rowNo"));

			List<CommunityDTO> tabFreeSharingMarketplaceBoardList = adminService.getTabFreeSharingMarketplaceBoardList(communitySearchDTO);

			mav.addObject("tabFreeSharingMarketplaceBoardList", tabFreeSharingMarketplaceBoardList);
			mav.addObject("tabFreeSharingMarketplaceBoardListSize", tabFreeSharingMarketplaceBoardList.size());
			mav.addObject("tabFreeSharingMarketplaceBoardListCnt", tabFreeSharingMarketplaceBoardListCnt);
			mav.addObject("tabFreeSharingMarketplaceBoardListAllCnt", tabFreeSharingMarketplaceBoardListAllCnt);
			mav.addObject("tabFreeSharingMarketplaceBoardPageMap", tabFreeSharingMarketplaceBoardPageMap);

			mav.setViewName(adminFolder + "adminCommunityMarketplaceBoardForm.jsp");

			return mav;
		}
		
		/*** 장터 Sale 등록 페이지(화면) ***/
		@RequestMapping(value = "/adminNewCommunityMarketplaceSaleBoardForm.do")
		public ModelAndView adminNewCommunityMarketplaceSaleBoardForm(CommunityDTO communityDTO, HttpSession session) {
			// 세션에서 사용자 아이디를 가져옴
			String userId = (String) session.getAttribute("mid");
			// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
			if (userId == null || !userId.equals("admin")) {
				return new ModelAndView("redirect:/loginForm.do");
			}
			ModelAndView mav = new ModelAndView();

			mav.setViewName(adminFolder + "adminNewCommunityMarketplaceSaleForm.jsp");

			return mav;
		}
		
		/*** 장터 Sale 새글쓰기 ***/
	   @ResponseBody
	   @RequestMapping(value = "/adminCommunityMarketplaceSaleBoardRegProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   public Map<String, String> adminCommunityMarketplaceSaleBoardRegProc(CommunityDTO communityDTO) {
	      
	      int result = adminService.insertMarketplaceSaleCommunity(communityDTO);
	      
	      Map<String, String> resultMap = new HashMap<String, String>();
	      resultMap.put("result", result + "");
	      
	      return resultMap;
	   }
		
	   /*** 장터 FreeSharing 등록 페이지(화면) ***/
	   @RequestMapping(value = "/adminNewCommunityMarketplaceFreeSharingBoarForm.do")
	   public ModelAndView adminNewCommunityMarketplaceFreeSharingBoarForm(CommunityDTO communityDTO, HttpSession session) {
		// 세션에서 사용자 아이디를 가져옴
		String userId = (String) session.getAttribute("mid");
		// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
		if (userId == null || !userId.equals("admin")) {
			return new ModelAndView("redirect:/loginForm.do");
		}
	      ModelAndView mav = new ModelAndView();

	      mav.setViewName(adminFolder + "adminNewCommunityMarketplaceFreeSharingForm.jsp");

	      return mav;
	   }
		
	   /*** 장터 FreeSharing 새글쓰기 ***/
	   @ResponseBody
	   @RequestMapping(value = "/adminNewCommunityMarketplaceFreeSharingBoardRegProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   public Map<String, String> adminNewCommunityMarketplaceFreeSharingBoardRegProc(CommunityDTO communityDTO) {
	      
	      int result = adminService.insertMarketplaceFreeSharingCommunity(communityDTO);
	      
	      Map<String, String> resultMap = new HashMap<String, String>();
	      resultMap.put("result", result + "");
	      
	      return resultMap;
	   }
		
		@RequestMapping(value = "/adminCommunityMarketplaceDetailForm.do")
		public ModelAndView adminCommunityMarketplaceDetailForm(@RequestParam(value = "b_no") int b_no,
			@RequestParam(value = "table_name") String table_name, HttpSession session) {
			// 세션에서 사용자 아이디를 가져옴
			String userId = (String) session.getAttribute("mid");
			// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
			if (userId == null || !userId.equals("admin")) {
				return new ModelAndView("redirect:/loginForm.do");
			}
			ModelAndView mav = new ModelAndView();

			if (table_name.equals("sale")) {
				CommunityDTO sale = this.adminService.getCommunityMarketplaceSaleDetailForm(b_no, true);
				mav.addObject("communityDTO", sale);
			} else {
				CommunityDTO freeSharing = this.adminService.getCommunityMarketplaceFreeSharingDetailForm(b_no, true);
				mav.addObject("communityDTO", freeSharing);
			}

			mav.setViewName(adminFolder + "adminMarketplaceDetailForm.jsp");

			return mav;
		}
		
		@RequestMapping(value = "/adminMarketplaceboardUpDelForm.do")
		   public ModelAndView adminMarketplaceboardUpDelForm(@RequestParam(value = "b_no") int b_no, @RequestParam(value = "table_name") String table_name, HttpSession session) {
			// 세션에서 사용자 아이디를 가져옴
			String userId = (String) session.getAttribute("mid");
			// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
			if (userId == null || !userId.equals("admin")) {
				return new ModelAndView("redirect:/loginForm.do");
			}
		      ModelAndView mav = new ModelAndView();
		      
		      if (table_name.equals("sale")) {
		         CommunityDTO sale = this.adminService.getCommunityMarketplaceSaleDetailForm(b_no, false);
		         mav.addObject("communityDTO", sale);
		      }
		      else {
		         CommunityDTO freeSharing = this.adminService.getCommunityMarketplaceFreeSharingDetailForm(b_no, false);
		         mav.addObject("communityDTO", freeSharing);
		      }

		      mav.setViewName(adminFolder + "adminMarketplaceboardUpDelForm.jsp");

		      return mav;
		   }
		
		 /*** 장터 업데이트 ***/
		@ResponseBody
		@RequestMapping(value = "/adminMarketplaceboardUpProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		
		public Map<String, String> adminMarketplaceboardUpProc(CommunityDTO communityDTO) {

			int marketplaceboardUpCnt = 0;
			
			String table_name = communityDTO.getTable_name();
			
			if (table_name.equals("sale")) {
				marketplaceboardUpCnt = this.adminService.updateMarketplaceSaleBoard(communityDTO);
			} else {
				marketplaceboardUpCnt = this.adminService.updateMarketplaceFreeSharingBoard(communityDTO);
			}

			Map<String, String> resultMap = new HashMap<String, String>();

			resultMap.put("result", marketplaceboardUpCnt + "");
			
			return resultMap;
		}
		
		 /*** 장터 삭제 ***/
		   @ResponseBody
		   @RequestMapping(value = "/adminMarketplaceBoardDelProc.do", method = RequestMethod.POST , produces = "application/json;charset=UTF-8")   
		   public Map<String, String> adminMarketplaceBoardDelProc(CommunityDTO communityDTO) {
		      
			  int marketplaceboardDelCnt = 0; 
			  
			  String table_name = communityDTO.getTable_name();
			  
			  if (table_name.equals("sale")) {
					marketplaceboardDelCnt = this.adminService.deleteMarketplaceSaleBoard(communityDTO);
				} else {
					marketplaceboardDelCnt = this.adminService.deleteMarketplaceFreeSharingBoard(communityDTO);
				}
		      
		      Map<String, String> resultMap = new HashMap<String, String>();

		      resultMap.put("result", marketplaceboardDelCnt + "");

		      return resultMap;
		   }
		
		   // ----------------------------------------------------------------
		   // 자유게시판
		   // ----------------------------------------------------------------
		   /*** 자유게시판 페이지 ***/
		   @RequestMapping(value = "/adminFreeBoardForm.do")
		   public ModelAndView adminFreeBoardForm(AdminCommunitySearchDTO communitySearchDTO, HttpSession session) {
				// 세션에서 사용자 아이디를 가져옴
				String userId = (String) session.getAttribute("mid");
				// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
				if (userId == null || !userId.equals("admin")) {
					return new ModelAndView("redirect:/loginForm.do");
				}
		      int freeBoardListAllCnt = this.adminService.getFreeBoardAllCnt();

		      int freeBoardListCnt = this.adminService.getFreeBoardListCnt(communitySearchDTO);

		      Map<String, Integer> freeBoardMap = Page.getPagingMap(

		            communitySearchDTO.getSelectPageNo()// 선택한 페이지 번호
		            , communitySearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
		            , freeBoardListCnt // 검색 결과물 개수

		      );

		      communitySearchDTO.setSelectPageNo((int) freeBoardMap.get("selectPageNo"));
		      communitySearchDTO.setRowCntPerPage((int) freeBoardMap.get("rowCntPerPage"));
		      communitySearchDTO.setBegin_rowNo((int) freeBoardMap.get("begin_rowNo"));
		      communitySearchDTO.setEnd_rowNo((int) freeBoardMap.get("end_rowNo"));

		      List<CommunityDTO> freeBoardList = this.adminService.getFreeBoardList(communitySearchDTO);

		      ModelAndView mav = new ModelAndView();

		      mav.addObject("freeBoardList", freeBoardList);

		      mav.addObject("freeBoardListCnt", freeBoardListCnt);

		      mav.addObject("freeBoardListAllCnt", freeBoardListAllCnt);

		      mav.addObject("freeBoardMap", freeBoardMap);

		      mav.setViewName(adminFolder + "adminCommunityFreeBoardForm.jsp");

		      return mav;
		   }
		
		   /*** 자유게시판 새글쓰기 ***/
		   @RequestMapping(value = "/adminNewCommunityFreeBoardForm.do")
		   public ModelAndView adminNewCommunityFreeBoardForm(CommunityDTO communityDTO, HttpSession session) {
			   // 세션에서 사용자 아이디를 가져옴
				String userId = (String) session.getAttribute("mid");
				// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
				if (userId == null || !userId.equals("admin")) {
					return new ModelAndView("redirect:/loginForm.do");
				}
		      ModelAndView mav = new ModelAndView();

		      mav.setViewName(adminFolder + "adminNewCommunityFreeBoardForm.jsp");

		      return mav;
		   }
		
		   /*** 자유게시판 글 등록 ***/
		   @ResponseBody
		   @RequestMapping(value = "/adminCommunityFreeBoardRegProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   public Map<String, String> adminCommunityFreeBoardRegProc(CommunityDTO communityDTO) {
		      
		      int result = adminService.insertCommunityFreeBoard(communityDTO);
		      
		      Map<String, String> resultMap = new HashMap<String, String>();
		      resultMap.put("result", result + "");
		      
		      return resultMap;
		   }
		
		   /*** 자유게시판 조회수 올리는것 ***/
		   @RequestMapping(value = "/adminUpdateFreeBoardDetailReadCountPlusOne.do")
		   public ModelAndView adminUpdateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO, HttpSession session) {
			   // 세션에서 사용자 아이디를 가져옴
				String userId = (String) session.getAttribute("mid");
				// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
				if (userId == null || !userId.equals("admin")) {
					return new ModelAndView("redirect:/loginForm.do");
				}
			   adminService.updateFreeBoardDetailReadCountPlusOne(detailDTO);

		      return adminCommunityFreeBoardDetail(detailDTO, session);
		   }
		
		   /*** 자유게시판 상세보기 ***/
		   @RequestMapping(value = "/adminCommunityFreeBoardDetail.do")
		   public ModelAndView adminCommunityFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO, HttpSession session) {
			   // 세션에서 사용자 아이디를 가져옴
				String userId = (String) session.getAttribute("mid");
				// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
				if (userId == null || !userId.equals("admin")) {
					return new ModelAndView("redirect:/loginForm.do");
				}
		      CommunityFreeBoardDetailDTO freeBoardDetail = adminService.getFreeBoardDetail(detailDTO);
		      
		      int commentListCount = adminService.getFreeBoardDetailCommentPageListCount(detailDTO);
		      
		      Map<String, Integer> pageMap = Page.getPagingMap(
		               detailDTO.getSelectPageNo()
		            ,   detailDTO.getRowCntPerPage()
		            ,   commentListCount
		      );

		      detailDTO.setSelectPageNo((int) pageMap.get("selectPageNo"));
		      detailDTO.setRowCntPerPage((int) pageMap.get("rowCntPerPage"));
		      detailDTO.setBegin_rowNo((int) pageMap.get("begin_rowNo"));
		      detailDTO.setEnd_rowNo((int) pageMap.get("end_rowNo"));
		      
		      List<CommunityFreeBoardDetailDTO> freeBoardDetailCommentPageList = adminService.getFreeBoardDetailCommentPageList(detailDTO);
		      
		      ModelAndView mav = new ModelAndView();
		      mav.addObject("commentListCount", commentListCount);
		      mav.addObject("pageMap", pageMap);
		      mav.addObject("detailDTO", detailDTO);
		      mav.addObject("freeBoardDetail", freeBoardDetail);
		      mav.addObject("freeBoardDetailCommentList", freeBoardDetailCommentPageList);
		      mav.addObject("freeBoardDetailCommentListSize", freeBoardDetailCommentPageList.size());

		      mav.setViewName(adminFolder + "adminCommunityFreeBoardDetailForm.jsp");      
		      
		      return mav;
		   }
		
		   /*** 자유게시판 댓글 추가, 자유게시판 상세보기 ***/
		   @RequestMapping(value = "/adminCommunityFreeBoardDetailCommentList.do")
		   public ModelAndView adminCommunityFreeBoardDetailCommentList(CommunityFreeBoardDetailDTO detailDTO, HttpSession session) {
		      
			   adminService.insertFreeBoardDetailComment(detailDTO);
		      
		      return adminCommunityFreeBoardDetail(detailDTO, session);
		   }
		
		   /*** 자유게시판 대댓글, 자유게시판 상세보기 ***/
		   @RequestMapping(value = "/adminCommunityFreeBoardDetailCommentOfCommentInsertProc.do")
		   public ModelAndView adminCommunityFreeBoardDetailCommentOfCommentInsertProc(CommunityFreeBoardDetailDTO detailDTO, HttpSession session) {		      
		      
			   adminService.insertFreeBoardDetailCommentToComment(detailDTO);

		      return adminCommunityFreeBoardDetail(detailDTO, session);
		   }
		
		   /*** 자유게시판 수정 삭제 페이지 ***/
		   @RequestMapping(value = "/adminCommunityFreeBoardUpDelForm.do")
		   public ModelAndView adminCommunityFreeBoardUpDelForm(CommunityFreeBoardDetailDTO detailDTO, HttpSession session) {
			   // 세션에서 사용자 아이디를 가져옴
				String userId = (String) session.getAttribute("mid");
				// 사용자 아이디가 admin이 아니라면 로그인 페이지로 리다이렉트
				if (userId == null || !userId.equals("admin")) {
					return new ModelAndView("redirect:/loginForm.do");
				}
		      CommunityDTO communityDTO = adminService.getFreeBoard(detailDTO.getB_no());

		      ModelAndView mav = new ModelAndView();
		      mav.addObject("communityDTO", communityDTO);
		      mav.setViewName(adminFolder + "adminCommunityFreeBoardUpDelForm.jsp");

		      return mav;      
		   }
		
		   /*** 자유게시판 상세보기, 업데이트 ***/
		   @ResponseBody
		   @RequestMapping(value = "/adminCommunityFreeBoardUpdateProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")   
		   public Map<String, String> adminCommunityFreeBoardUpdateProc(CommunityDTO communityDTO) {

		      int updateCount = adminService.updateCommunityFreeBoard(communityDTO);

		      Map<String, String> resultMap = new HashMap<String, String>();
		      resultMap.put("result", updateCount + "");

		      return resultMap;      
		   }
		
		   /*** 자유게시판 상세보기, 삭제 ***/
		   @ResponseBody
		   @RequestMapping(value = "/adminCommunityFreeBoardDelProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")   
		   public Map<String, String> adminCommunityFreeBoardDelProc(CommunityDTO communityDTO) {
		      
		      int boardDeleteCount = adminService.deleteCommunityFreeBoard(communityDTO);

		      Map<String, String> resultMap = new HashMap<String, String>();
		      resultMap.put("result", boardDeleteCount + "");

		      return resultMap;      
		   }

		   /*** 자유게시판 대댓글 수정, 자유게시판 상세보기 ***/
		   @RequestMapping(value = "/adminCommunityFreeBoardDetailCommentOfCommentUpdateProc.do")
		   public ModelAndView adminCommunityFreeBoardDetailCommentOfCommentUpdateProc(CommunityFreeBoardDetailDTO detailDTO, HttpSession session) {
		     
		      adminService.adminCommunityFreeBoardDetailCommentOfCommentUpdateProc(detailDTO);

		     return adminCommunityFreeBoardDetail(detailDTO, session);
		   }

		   /*** 자유게시판 대댓글 삭제, 자유게시판 상세보기 ***/
		   @RequestMapping(value = "/adminCommunityFreeBoardDetailCommentOfCommentDeleteProc.do")
		   public ModelAndView adminCommunityFreeBoardDetailCommentOfCommentDeleteProc(CommunityFreeBoardDetailDTO detailDTO, HttpSession session) {
		     
		      adminService.adminCommunityFreeBoardDetailCommentOfCommentDeleteProc(detailDTO);

		     return adminCommunityFreeBoardDetail(detailDTO, session);
		   }
	
	
	
	
	
	
}
