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

import kosmo.team.project.dto.MyRentStaidumTimeDTO;
import kosmo.team.project.dto.MyYangdoStaidumTimeDTO;
import kosmo.team.project.dto.RentStadiumDTO;
import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;
import kosmo.team.project.dto.TimeDTO;
import kosmo.team.project.dto.YangdoDTO;
import kosmo.team.project.dto.YangdoSearchDTO;
import kosmo.team.project.dto.myRentStadiumDTO;
import kosmo.team.project.service.StadiumService;
import kosmo.team.project.utility.Page;

@Controller
public class StadiumController {

	private final String stadiumFolder = "/stadium/";

	@Autowired
	private StadiumService stadiumService;

	@RequestMapping(value = "/stadiumRentForm.do")
	public ModelAndView stadiumRentForm(StadiumSearchDTO stadiumSearchDTO) {

		int StadiumListAllCnt = this.stadiumService.getStadiumListAllCnt();

		int StadiumListCnt = this.stadiumService.getStadiumListCnt(stadiumSearchDTO);

		Map<String, Integer> StadiumMap = Page.getPagingMap(

				stadiumSearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, stadiumSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, StadiumListCnt // 검색 결과물 개수

		);
		stadiumSearchDTO.setSelectPageNo((int) StadiumMap.get("selectPageNo"));
		stadiumSearchDTO.setRowCntPerPage((int) StadiumMap.get("rowCntPerPage"));
		stadiumSearchDTO.setBegin_rowNo((int) StadiumMap.get("begin_rowNo"));
		stadiumSearchDTO.setEnd_rowNo((int) StadiumMap.get("end_rowNo"));

		List<StadiumDTO> stadiumList = this.stadiumService.getStadiumList(stadiumSearchDTO);

		ModelAndView mav = new ModelAndView();

		mav.addObject("stadiumList", stadiumList);
		mav.addObject("StadiumListCnt", StadiumListCnt);
		mav.addObject("StadiumListAllCnt", StadiumListAllCnt);

		mav.addObject("StadiumMap", StadiumMap);

		mav.setViewName(stadiumFolder + "stadiumRentForm.jsp");

		return mav;
	}

	@RequestMapping(value = "/stadiumRentDetailForm.do")
	public ModelAndView stadiumRentDetailForm(
			@RequestParam(value = "stadium_no") int stadium_no

	) {

		// BoardDTO boardDTO = this.boardService.getBoard(b_no, true);
		StadiumDTO stadiumDTO = this.stadiumService.getStadium(stadium_no);

		List<TimeDTO> timeDTO = this.stadiumService.getTime(stadium_no);

		List<String> fullRent = this.stadiumService.getFullRent(stadium_no);

		ModelAndView mav = new ModelAndView();

		mav.addObject("stadiumDTO", stadiumDTO);

		mav.addObject("timeDTO", timeDTO);

		for (int i = 0; i < fullRent.size(); i++) {
			fullRent.set( i, "'" + fullRent.get(i) + "'");
		}

		mav.addObject("fullRent", fullRent);

		mav.setViewName(stadiumFolder + "stadiumRentDetailForm.jsp");

		return mav;

	}

	@RequestMapping(value = "/rentStadiumProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> rentStadiumProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			RentStadiumDTO rentStadiumDTO

	) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		// -------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기

		// -------------------------------------------
		int StadiumRentCnt = this.stadiumService.insertStadiumRent(rentStadiumDTO);

		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기기
		// -------------------------------------------
		resultMap.put("result", StadiumRentCnt + "");

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}

	
	
	
	
	
	@RequestMapping(value = "/stadiumTransferForm.do")
	
	public ModelAndView StadiumTransferForm(YangdoSearchDTO yangdoSearchDTO) {
			
		
		int StadiumYangdoListAllCnt = this.stadiumService.getStadiumYangdoListAllCnt();

		int StadiumYangdoListCnt = this.stadiumService.getStadiumYangdoListCnt(yangdoSearchDTO);

		Map<String, Integer> StadiumYangdoMap = Page.getPagingMap(

				yangdoSearchDTO.getSelectPageNo()// 선택한 페이지 번호
				, yangdoSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
				, StadiumYangdoListCnt // 검색 결과물 개수

		);
		yangdoSearchDTO.setSelectPageNo((int) StadiumYangdoMap.get("selectPageNo"));
		yangdoSearchDTO.setRowCntPerPage((int) StadiumYangdoMap.get("rowCntPerPage"));
		yangdoSearchDTO.setBegin_rowNo((int) StadiumYangdoMap.get("begin_rowNo"));
		yangdoSearchDTO.setEnd_rowNo((int) StadiumYangdoMap.get("end_rowNo"));
		
		List<YangdoDTO> stadiumYangdoList = this.stadiumService.getStadiumYangdoList(yangdoSearchDTO);
		

		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("stadiumYangdoList", stadiumYangdoList);
		

		mav.addObject("StadiumYangdoListCnt", StadiumYangdoListCnt);

		mav.addObject("StadiumYangdoListAllCnt", StadiumYangdoListAllCnt);
		
		
		mav.addObject("StadiumYangdoMap", StadiumYangdoMap);

		mav.setViewName(stadiumFolder + "stadiumTransferForm.jsp");

		return mav;
		
		

	}
		

	//디테일
	
	@RequestMapping(value = "/stadiumTransferDetailForm.do")
	public ModelAndView transferDetailForm(@RequestParam(value = "yangdo_no") int yangdo_no, HttpSession session) {

		Integer checkM_no = (Integer) session.getAttribute("m_no");
		
		if (checkM_no == null) {
	        // 로그인 페이지로 리다이렉트
	        ModelAndView loginRedirect = new ModelAndView("redirect:/loginForm.do");
	        // 로그인이 필요한 메시지를 전달할 수도 있습니다.

	        return loginRedirect;
	    }
		
		
		
		
		YangdoDTO yangdoDTO = this.stadiumService.getStadiumYangdo(yangdo_no);
		
		
	
		
		

		ModelAndView mav = new ModelAndView();
		


		//System.out.println(yangdoDTO.getM_no());
		
		
		mav.addObject("yangdoDTO", yangdoDTO);

		mav.setViewName(stadiumFolder + "stadiumTransferDetailForm.jsp");

		return mav;

	}
	
	
	//업델
	@RequestMapping(value = "/yangdoDetailUpdDeleForm.do")

	public ModelAndView yangdoDetailUpdDeleForm(
			// --------------------------------------
			// "b_no" 라는 파라미터명에 해당하는 파라미터값을 꺼내서
			// 매개변수 b_no 에 저장하고 들어온다.
			// 즉 게시판 고유 번호가 매개변수 b_no 로 들어온다.
			// 저런식으러 선언하면 파라미터는 필수로 들어와야한다 아니면 예외가 터짐
			// 사실 숫자 문자지만 정수로 바꿔서 들어오는거다.
			// --------------------------------------
			@RequestParam(value = "yangdo_no") int yangdo_no
			,@RequestParam(value = "m_no") int m_no

	) {
		
		// BoardDTO boardDTO = this.boardService.getBoard(b_no,false);
		YangdoDTO yangdoDTO = this.stadiumService.getYangdoForUpDel(yangdo_no);

		List<myRentStadiumDTO> myStadiumList = stadiumService.getMyStadiumList(m_no);
		
		
		
		ModelAndView mav = new ModelAndView();
		// --------------------------------
		// [ModelAndView 객체]에
		// 키값 "boardDTO" 에
		// 1행m열의 검색 데이터가 저장된 BoardDTO 객체 붙여 저장하기
		// ModelAndView 객체에 저장된 객체는
		// HttpServletRequest 객체에도 저장된다.
		// --------------------------------
		mav.addObject("yangdoDTO", yangdoDTO);
		mav.addObject("myStadiumList", myStadiumList);

		mav.setViewName(stadiumFolder + "yangdoDetailUpdDeleForm.jsp");

		return mav;

	}
	
//업델에서쓰일 경기장 날짜목록 가져오기
	@RequestMapping(value = "/myStadiumYangdoDate.do", method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MyYangdoStaidumTimeDTO> myStadiumYangdoDate(MyYangdoStaidumTimeDTO myYangdoStaidumTimeDTO) {




		
		
		
        List<MyYangdoStaidumTimeDTO> yangdoDate = stadiumService.getYangdoDate(myYangdoStaidumTimeDTO);
        	
        System.out.println("yangdoDate: " + yangdoDate);



            
        	return yangdoDate;
    }
	
	
	
	
	//업델에서쓰일 경기장 시간목록 가져오기
	@RequestMapping(value = "/myStadiumYangdoTime.do", method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MyYangdoStaidumTimeDTO> myStadiumYangdoTime(MyYangdoStaidumTimeDTO myYangdoStaidumTimeDTO) {




		
		
		
        List<MyYangdoStaidumTimeDTO> yangdotimeRanges = stadiumService.getYangdoTimeRanges(myYangdoStaidumTimeDTO);
        	
        System.out.println("yangdotimeRanges: " + yangdotimeRanges);

        


            
        	return yangdotimeRanges;
    }
	
	
	//삭제
	
	@RequestMapping(value = "/yangdoDelProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> yangdoDelProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			YangdoDTO yangdoDTO

	) {
		Map<String, String> resultMap = new HashMap<String, String>();

		int yangdoDelCnt = this.stadiumService.deleteYangdo(yangdoDTO);

		resultMap.put("result", yangdoDelCnt + "");

		return resultMap;
	}

	
	@RequestMapping(value = "/yangdoAdminDelProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public Map<String, String> yangdoAdminDelProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			YangdoDTO yangdoDTO

	) {
		Map<String, String> resultMap = new HashMap<String, String>();

		int adminYangdoDelCnt = this.stadiumService.deleteAdminYangdo(yangdoDTO);

		resultMap.put("result", adminYangdoDelCnt + "");

		return resultMap;
	}

	
	
	
	
	
	
	@RequestMapping(value = "/yangdoUpProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> yangdoUpProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			YangdoDTO yangdoDTO

	) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		// -------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기
		// -------------------------------------------
		int yangdoUpCnt = this.stadiumService.updateYangdo(yangdoDTO);

		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기
		// -------------------------------------------
		resultMap.put("result", yangdoUpCnt + "");

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 새글쓰기 페이지

	@RequestMapping(value = "/newStadiumTransferForm.do")

	public ModelAndView newStadiumTransferForm(HttpSession session) {
		// 세션에서 m_no 가져오기
		int m_no = (int) session.getAttribute("m_no");

		// m_no를 사용하여 경기장 리스트 가져오는 로직 구현
		List<myRentStadiumDTO> myStadiumList = stadiumService.getMyStadiumList(m_no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("myStadiumList", myStadiumList);
		mav.setViewName(stadiumFolder + "newStadiumTransferForm.jsp");

		return mav;
	}
	
	
	
	

	@RequestMapping(value = "/myStadiumRentDate.do", method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MyRentStaidumTimeDTO> myStadiumRentDate(MyRentStaidumTimeDTO myRentStaidumTimeDTO) {




		
		
		
        List<MyRentStaidumTimeDTO> RentDate = stadiumService.getDate(myRentStaidumTimeDTO);
        	
        System.out.println("RentDate: " + RentDate);



            
        	return RentDate;
    }
	
	
	
	
	
	@RequestMapping(value = "/myStadiumRentTime.do", method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MyRentStaidumTimeDTO> myStadiumRentTime(MyRentStaidumTimeDTO myRentStaidumTimeDTO) {




		
		
		
        List<MyRentStaidumTimeDTO> timeRanges = stadiumService.getTimeRanges(myRentStaidumTimeDTO);
        	
        System.out.println("TimeList: " + timeRanges);

        for (MyRentStaidumTimeDTO timeRange : timeRanges) {
            System.out.println("Time Range: " + timeRange.getTime_range());
        }
        


            
        	return timeRanges;
    }
	
	
	

	// 새글쓰기에서 호출

	@RequestMapping(value = "/stadiumTransferProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> stadiumTransferProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			YangdoDTO yangdoDTO

	) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		int StadiumYangdoCnt = this.stadiumService.insertStadiumYangdo(yangdoDTO);

		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기기
		// -------------------------------------------
		resultMap.put("result", StadiumYangdoCnt + "");
		
		System.out.println("Result: " + resultMap.get("result"));

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//다른사람이 양도 신청 버튼 누를시
	@RequestMapping(value = "/yangdoSincheongProc.do"

			, method = RequestMethod.POST

			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> yangdoSincheongProc(
			// -------------------------
			// 파라미터값이 저장된 [BoardDTO 객체]가 들어올 매개변수 선언
			// -------------------------
			// [파라미터명]과 [BoardDTO 객체] 의 [맴버변수명] 이 같으면
			// setter 메소드가 작동되어 [파라미터명] 이 [맴버변수]에 저장된다.

			YangdoDTO yangdoDTO

	) {

		// ------------------------------------------------
		// 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
		// ------------------------------------------------
		Map<String, String> resultMap = new HashMap<String, String>();

		// -------------------------------------------
		// [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
		// 게시판 글 수정하고 [수정 적용행의 개수] 얻기
		// -------------------------------------------
		int sincheongCnt = this.stadiumService.updateSincheong(yangdoDTO);

		// -------------------------------------------
		// HashMap 객체에 게시판 수정 행의 개수 저장하기
		// -------------------------------------------
		resultMap.put("result", sincheongCnt + "");

		// -------------------------------------------
		// HashMap 객체의 메위주 리턴하기
		// -------------------------------------------
		return resultMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}