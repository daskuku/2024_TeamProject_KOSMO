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

import kosmo.team.project.dto.AdminSearchDTO;
import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;
import kosmo.team.project.service.RecruitService;
import kosmo.team.project.utility.Page;

@Controller
public class RecruitController {
	
	@Autowired
    private RecruitService recruitService;
	
	
	//==================================================================================================================================

    //팀/팀원모집페이지_boardlist	
    @RequestMapping(value = "/recruitTeamMemBoardForm.do")
    public ModelAndView recruitTeamMemBoardForm(RecruitSearchDTO recruitSearchDTO) {
    	
    	int boardListCnt = this.recruitService.getBoardListCnt(recruitSearchDTO);
    	
    	Map<String, Integer> recruitMap = Page.getPagingMap(
    		recruitSearchDTO.getSelectPageNo()// 선택한 페이지 번호
			, recruitSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
			, boardListCnt // 검색 결과물 개수
		);
    	
    	recruitSearchDTO.setSelectPageNo((int) recruitMap.get("selectPageNo"));
    	recruitSearchDTO.setRowCntPerPage((int) recruitMap.get("rowCntPerPage"));
    	recruitSearchDTO.setBegin_rowNo((int) recruitMap.get("begin_rowNo"));
    	recruitSearchDTO.setEnd_rowNo((int) recruitMap.get("end_rowNo"));
    	
    	List<RecruitTeamMemDTO> recruitTeamMem = this.recruitService.getRecruit_TeamMemList(recruitSearchDTO);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("boardList", recruitTeamMem);
    	mav.addObject("recruitMap", recruitMap);
    	mav.setViewName("/recruit/recruitTeamMemBoardForm.jsp");
    	
        return mav;
    }
    
    //팀/팀원상세페이지
    @RequestMapping(value = "/recruitTeamMemBoardDetailForm.do")
    public ModelAndView recruitTeamBoardDetailForm(@RequestParam(value="b_no") int b_no) {
 
    	
    	
    	RecruitTeamMemDTO recruitTeamMemDTO = this.recruitService.getRecruit_TeamMemDetail(b_no);
    	
    	List<String> day = this.recruitService.getRecruit_day(b_no);
    	List<String> time = this.recruitService.getRecruit_time(b_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", recruitTeamMemDTO);
    	mav.addObject("day", day);
    	mav.addObject("time", time);
    	mav.setViewName("/recruit/recruitTeamMemBoardDetailForm.jsp");
    	
        return mav;
    }


    //팀/팀원새글쓰기페이지
    @RequestMapping(value = "/newRecruitTeamMemBoardForm.do")
    public ModelAndView newRecruitTeamMemBoardForm(@RequestParam(value="m_no") int m_no) {
    	//새글쓰기에서 팀이 있나 확인
    	int checkHaveTeam = this.recruitService.checkHaveTeam(m_no);
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/recruit/newRecruitTeamMemBoardForm.jsp");
    	mav.addObject("checkHaveTeam", checkHaveTeam);
    	
        return mav;
    }
    
    
    //팀/팀원새글쓰기페이지_등록
	@RequestMapping( value = "/recruitTeamMemRegProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
					)
	@ResponseBody
	public Map<String, String> recruitTeamMemRegProc(RecruitTeamMemDTO recruitTeamMemDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int recruitTeamMemRegCnt = this.recruitService.regTeamMemRecruit(recruitTeamMemDTO);
	resultMap.put("result", recruitTeamMemRegCnt+"");
	
	
	return resultMap;
	}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	
    //팀/팀원수정삭제페이지
    @RequestMapping(value = "/recruitTeamMemBoardUpDelForm.do")
    public ModelAndView recruitTeamMemBoardUpDelForm(@RequestParam(value="b_no") int b_no) {
    	// getRecruit_TeamMemUpDel 는 수정/삭제를 위해 데이터를 가져오는 메소드명
    	RecruitTeamMemDTO recruitTeamMemDTO = this.recruitService.getRecruit_TeamMemUpDel(b_no);
    	List<String> recruitTeamMemDTO_day = this.recruitService.getRecruit_TeamMemUpDel_day(b_no);
    	List<String> recruitTeamMemDTO_time = this.recruitService.getRecruit_TeamMemUpDel_time(b_no);
    	RecruitTeamMemDTO recruitTeamMemDTO_sidosigungu = this.recruitService.getRecruit_TeamMemUpDel_sidosigungu(b_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("detail", recruitTeamMemDTO);
    	mav.addObject("updel_day", recruitTeamMemDTO_day);
    	mav.addObject("updel_time", recruitTeamMemDTO_time);
    	mav.addObject("updel_sidosigungu", recruitTeamMemDTO_sidosigungu);
    	mav.setViewName("/recruit/recruitTeamMemBoardUpDelForm.jsp");
    	
        return mav;
    }  
    
    
    //팀/팀원 게시물 수정
    @RequestMapping( value = "/recruitTeamMemBoardUpProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	// map을 사용한 이유? -> JSON 형식을 사용하기 위해
	public Map<String, String> recruitTeamMemBoardUpProc(RecruitTeamMemDTO recruitTeamMemDTO)
	{
    //resultMap 이라는 변수 선언(자료형은 map) 
	Map<String, String> resultMap = new HashMap<String, String>();
	//recruitTeamMemUpCnt 이라는 변수 선언 (자료형은 int)
	//업데이트가 성공했는지 안했는지의 결과가 변수에 저장될것임 -> 성공했으면 '1'이 들어오고 실패하면 '0'이 들어올것임.
	int recruitTeamMemUpCnt = this.recruitService.recruitUpdateTeamMem(recruitTeamMemDTO);
	//recruitTeamMemUpCnt에 저장된 결과를 map 형식으로 만들어준 변수 resultMap에 저장
	//어떻게? -> map 사용법은 키값명을 호출하면 그 키값명에 저장한 데이터가 나옴
	//여기서는 "result"라는 키값명에 recruitTeamMemUpCnt를 저장.
	//즉, "result"를 호출하면 recruitTeamMemUpCnt가 나오는 것임.
	resultMap.put("result", recruitTeamMemUpCnt+"");
	
	
	return resultMap;
	}
    
    
    //팀/팀원 게시물 삭제
    @RequestMapping( value = "/recruitTeamMemBoardDelProc.do"
			,method = RequestMethod.POST
			, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> recruitTeamMemBoardDelProc(RecruitTeamMemDTO recruitTeamMemDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int recruitTeamMemDelCnt = this.recruitService.recruitDeleteTeamMem(recruitTeamMemDTO);
	resultMap.put("result", recruitTeamMemDelCnt+"");
	
	
	return resultMap;
	}
    
    
    //신청버튼을 누르면 내 정보가 승낙대기 테이블로 넘어감.
    @RequestMapping( value = "/goWaitingList.do"
			,method = RequestMethod.POST
			, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> waitngList_myInfoProc(RecruitTeamMemDTO recruitTeamMemDTO)
	{
    	
    int regWaitingList = this.recruitService.regWaitingList(recruitTeamMemDTO);
    	
	Map<String, String> resultMap = new HashMap<String, String>();
	
	resultMap.put("result", regWaitingList+"");
	
	
	return resultMap;
	}
    
//==================================================================================================================================

    //용병모집페이지_boardlist
    @RequestMapping(value = "/recruitHiredBoardForm.do")
    public ModelAndView recruitHiredBoardForm(RecruitSearchDTO recruitSearchDTO, HttpSession session) {
        
    		int hiredListAllCnt = this.recruitService.getHiredListAllCnt();

    		int hiredListCnt = this.recruitService.getHiredListCnt(recruitSearchDTO);

    		Map<String, Integer> hiredMap = Page.getPagingMap(

    				recruitSearchDTO.getSelectPageNo()// 선택한 페이지 번호
    				, recruitSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
    				, hiredListCnt // 검색 결과물 개수

    		);

    		recruitSearchDTO.setSelectPageNo((int) hiredMap.get("selectPageNo"));
    		recruitSearchDTO.setRowCntPerPage((int) hiredMap.get("rowCntPerPage"));
    		recruitSearchDTO.setBegin_rowNo((int) hiredMap.get("begin_rowNo"));
    		recruitSearchDTO.setEnd_rowNo((int) hiredMap.get("end_rowNo"));
    	
    	List<RecruitHiredDTO> recruitHired = this.recruitService.getRecruitHired(recruitSearchDTO);
    	ModelAndView mav = new ModelAndView();
    	//오라클의 실행구문 결과물이 저장된 변수 recruitHired를 JSP쪽에서 ${requestScope.boardList.DTO안에있는멤버변수명} 이런식으로 불러 사용하기 위해 addObject라는 것을 사용
    	//즉, JSP페이지에서 boardList라는 키값을 부르면 그 키값에 해당하는 데이터(recruitHired)를 사용할수 있는 것임.

		mav.addObject("boardList", recruitHired);
		mav.addObject("hiredListCnt", hiredListCnt);
		mav.addObject("hiredListAllCnt", hiredListAllCnt);
		mav.addObject("hiredMap", hiredMap);
    	mav.setViewName("/recruit/recruitHiredBoardForm.jsp");
    	
        return mav;
    }
    
    //용병상세페이지
    @RequestMapping(value = "/recruitHiredBoardDetailForm.do")
    public ModelAndView recruitHiredBoardDetailForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	
    	RecruitHiredDTO recruitHiredDTO = this.recruitService.getRecruit_HiredDetail(recruitment_no);
    	
    	List<String> day = this.recruitService.getRecruit_hired_day(recruitment_no);
    	List<String> time = this.recruitService.getRecruit_hired_time(recruitment_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("hireddetailList", recruitHiredDTO);
    	mav.addObject("day", day);
    	mav.addObject("time", time);
    	mav.setViewName("/recruit/recruitHiredBoardDetailForm.jsp");
    	
        return mav;
    }
    
    //용병새글쓰기페이지
    @RequestMapping(value = "/newRecruitHiredBoardForm.do")
    public ModelAndView newRecruitHiredBoardForm() {
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("/recruit/newRecruitHiredBoardForm.jsp");
    	
        return mav;
    }
    
	//용병모집 새글쓰기 저장 
	@RequestMapping( value = "/recruitHiredRegProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
					)
	@ResponseBody
	public Map<String, String> recruitHiredRegProc(RecruitHiredDTO recruitHiredDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int recruitHiredRegCnt = this.recruitService.regHiredRecruit(recruitHiredDTO);
	resultMap.put("result", recruitHiredRegCnt+"");
	
	return resultMap;
	}
    
    //용병모집수정삭제페이지
    @RequestMapping(value = "/recruitHiredBoardUpDelForm.do")
    public ModelAndView recruitHiredBoardUpDelForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	// getRecruit_HiredUpDel 는 수정/삭제를 위해 데이터를 가져오는 메소드명
    	RecruitHiredDTO recruitHiredDTO = this.recruitService.getRecruit_HiredUpDel(recruitment_no);
    	List<String> recruitHiredDTO_day = this.recruitService.getRecruit_HiredUpDel_day(recruitment_no);
    	List<String> recruitHiredDTO_time = this.recruitService.getRecruit_HiredUpDel_time(recruitment_no);
    	RecruitHiredDTO recruitHiredDTO_sidosigungu = this.recruitService.getRecruit_HiredUpDel_sidosigungu(recruitment_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("detail", recruitHiredDTO);
    	mav.addObject("updel_day", recruitHiredDTO_day);
    	mav.addObject("updel_time", recruitHiredDTO_time);
    	mav.addObject("updel_sidosigungu", recruitHiredDTO_sidosigungu);
    	mav.setViewName("/recruit/recruitHiredBoardUpDelForm.jsp");
    	
        return mav;
    }  
    
    
    //용병 게시물 수정
    @RequestMapping( value = "/recruitHiredBoardUpProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	// map을 사용한 이유? -> JSON 형식을 사용하기 위해
	public Map<String, String> recruitHiredBoardUpProc(RecruitHiredDTO recruitHiredDTO)
	{
    //resultMap 이라는 변수 선언(자료형은 map) 
	Map<String, String> resultMap = new HashMap<String, String>();
	//recruitHiredUpCnt 이라는 변수 선언 (자료형은 int)
	//업데이트가 성공했는지 안했는지의 결과가 변수에 저장될것임 -> 성공했으면 '1'이 들어오고 실패하면 '0'이 들어올것임.
	int recruitHiredUpCnt = this.recruitService.recruitUpdateHired(recruitHiredDTO);
	//recruitHiredUpCnt에 저장된 결과를 map 형식으로 만들어준 변수 resultMap에 저장
	//어떻게? -> map 사용법은 키값명을 호출하면 그 키값명에 저장한 데이터가 나옴
	//여기서는 "result"라는 키값명에 recruitHiredUpCnt를 저장.
	//즉, "result"를 호출하면 recruitHiredUpCnt가 나오는 것임.
	resultMap.put("result", recruitHiredUpCnt+"");
	
	
	return resultMap;
	}
    
    
    //용병 게시물 삭제
    @RequestMapping( value = "/recruitHiredBoardDelProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> recruitHiredBoardDelProc(RecruitHiredDTO recruitHiredDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int recruitHiredDelCnt = this.recruitService.recruitDeleteHired(recruitHiredDTO);
	resultMap.put("result", recruitHiredDelCnt+"");
	
	
	return resultMap;
	}
    
    
    //용병 신청하면 승낙대기 테이블로 들어간다.
    @RequestMapping( value = "/goWaitingHiredList.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> goWaitingHiredList(RecruitHiredDTO recruitHiredDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int waitingHiredListCnt = this.recruitService.goWaitingHiredList(recruitHiredDTO);
	
	resultMap.put("result", waitingHiredListCnt+"");
	
	return resultMap;
	}
    
    
    
		
//==================================================================================================================================

  //레슨모집페이지_boardlist
    @RequestMapping(value = "/recruitLessonBoardForm.do")
    public ModelAndView recruitLessonBoardForm(RecruitSearchDTO recruitSearchDTO, HttpSession session) {                         
        
    		int lessonListAllCnt = this.recruitService.getLessonListAllCnt();

    		int lessonListCnt = this.recruitService.getLessonListCnt(recruitSearchDTO);

    		Map<String, Integer> lessonMap = Page.getPagingMap(

    				recruitSearchDTO.getSelectPageNo()// 선택한 페이지 번호
    				, recruitSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
    				, lessonListCnt // 검색 결과물 개수

    		);

    		recruitSearchDTO.setSelectPageNo((int) lessonMap.get("selectPageNo"));
    		recruitSearchDTO.setRowCntPerPage((int) lessonMap.get("rowCntPerPage"));
    		recruitSearchDTO.setBegin_rowNo((int) lessonMap.get("begin_rowNo"));
    		recruitSearchDTO.setEnd_rowNo((int) lessonMap.get("end_rowNo"));
    	
    	List<RecruitLessonDTO> recruitLesson = this.recruitService.getRecruitLesson(recruitSearchDTO);
    	ModelAndView mav = new ModelAndView();
    	//오라클의 실행구문 결과물이 저장된 변수 recruitHired를 JSP쪽에서 ${requestScope.boardList.DTO안에있는멤버변수명} 이런식으로 불러 사용하기 위해 addObject라는 것을 사용
    	//즉, JSP페이지에서 boardList라는 키값을 부르면 그 키값에 해당하는 데이터(recruitHired)를 사용할수 있는 것임.

    	mav.addObject("boardList", recruitLesson);
		mav.addObject("lessonListCnt", lessonListCnt);
		mav.addObject("lessonListAllCnt", lessonListAllCnt);
		mav.addObject("lessonMap", lessonMap);
		mav.setViewName("/recruit/recruitLessonBoardForm.jsp");
    	
        return mav;
    }
    
    
	 //레슨상세페이지
   @RequestMapping(value = "/recruitLessonBoardDetailForm.do")
   public ModelAndView recruitLessonBoardDetailForm(@RequestParam(value="recruitment_no") int recruitment_no) {
   	
   	RecruitLessonDTO recruitLessonDTO = this.recruitService.getRecruit_LessonDetail(recruitment_no);
   	
   	List<String> day = this.recruitService.getRecruit_lesson_day(recruitment_no);
   	List<String> time = this.recruitService.getRecruit_lesson_time(recruitment_no);
   	
   	ModelAndView mav = new ModelAndView();
   	mav.addObject("lessondetailList", recruitLessonDTO);
   	mav.addObject("day", day);
   	mav.addObject("time", time);
   	mav.setViewName("/recruit/recruitLessonBoardDetailForm.jsp");
   	
       return mav;
   }
    
  
    //레슨새글쓰기페이지
	@RequestMapping(value = "/newRecruitLessonBoardForm.do")
	public ModelAndView newRecruitLessonBoardForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/recruit/newRecruitLessonBoardForm.jsp");
		
	    return mav;
	}
    
	//레슨모집 새글쓰기 저장 
	@RequestMapping( value = "/recruitLessonRegProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
					)
	@ResponseBody
	public Map<String, String> recruitLessonRegProc(RecruitLessonDTO recruitLessonDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int recruitLessonRegCnt = this.recruitService.regLessonRecruit(recruitLessonDTO);
	resultMap.put("result", recruitLessonRegCnt+"");
	
	return resultMap;
	}
    
    //레슨모집수정삭제페이지
    @RequestMapping(value = "/recruitLessonBoardUpDelForm.do")
    public ModelAndView recruitLessonBoardUpDelForm(@RequestParam(value="recruitment_no") int recruitment_no) {
    	// getRecruit_LessonUpDel 는 수정/삭제를 위해 데이터를 가져오는 메소드명
    	RecruitLessonDTO recruitLessonDTO = this.recruitService.getRecruit_LessonUpDel(recruitment_no);
    	List<String> recruitLessonDTO_day = this.recruitService.getRecruit_LessonUpDel_day(recruitment_no);
    	List<String> recruitLessonDTO_time = this.recruitService.getRecruit_LessonUpDel_time(recruitment_no);
    	RecruitLessonDTO recruitLessonDTO_sidosigungu = this.recruitService.getRecruit_LessonUpDel_sidosigungu(recruitment_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("detail", recruitLessonDTO);
    	mav.addObject("updel_day", recruitLessonDTO_day);
    	mav.addObject("updel_time", recruitLessonDTO_time);
    	mav.addObject("updel_sidosigungu", recruitLessonDTO_sidosigungu);
    	mav.setViewName("/recruit/recruitLessonBoardUpDelForm.jsp");
    	
        return mav;
    }  
    
    
    //레슨 게시물 수정
    @RequestMapping( value = "/recruitLessonBoardUpProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	// map을 사용한 이유? -> JSON 형식을 사용하기 위해
	public Map<String, String> recruitLessonBoardUpProc(RecruitLessonDTO recruitLessonDTO)
	{
    //resultMap 이라는 변수 선언(자료형은 map) 
	Map<String, String> resultMap = new HashMap<String, String>();
	//recruitLessonUpCnt 이라는 변수 선언 (자료형은 int)
	//업데이트가 성공했는지 안했는지의 결과가 변수에 저장될것임 -> 성공했으면 '1'이 들어오고 실패하면 '0'이 들어올것임.
	int recruitLessonUpCnt = this.recruitService.recruitUpdateLesson(recruitLessonDTO);
	//recruitHiredUpCnt에 저장된 결과를 map 형식으로 만들어준 변수 resultMap에 저장
	//어떻게? -> map 사용법은 키값명을 호출하면 그 키값명에 저장한 데이터가 나옴
	//여기서는 "result"라는 키값명에 recruitHiredUpCnt를 저장.
	//즉, "result"를 호출하면 recruitHiredUpCnt가 나오는 것임.
	resultMap.put("result", recruitLessonUpCnt+"");
	
	
	return resultMap;
	}
    
    
    //레슨 게시물 삭제
    @RequestMapping( value = "/recruitLessonBoardDelProc.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> recruitLessonBoardDelProc(RecruitLessonDTO recruitLessonDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int recruitLessonDelCnt = this.recruitService.recruitDeleteLesson(recruitLessonDTO);
	resultMap.put("result", recruitLessonDelCnt+"");
	
	
	return resultMap;
	}
    
    //레슨 신청하면 승낙대기 테이블로 들어간다.
    @RequestMapping( value = "/goWaitingLessonList.do"
					,method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8"
			)
	@ResponseBody
	public Map<String, String> goWaitingLessonList(RecruitLessonDTO recruitLessonDTO)
	{
	Map<String, String> resultMap = new HashMap<String, String>();
	int waitingLessonListCnt = this.recruitService.goWaitingLessonList(recruitLessonDTO);
	
	resultMap.put("result", waitingLessonListCnt+"");
	
	return resultMap;
	}
    
    
    
    
    
}