package kosmo.team.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.RecruitTeamMemDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;
import kosmo.team.project.service.TournamentService;
import kosmo.team.project.utility.Page;

@Controller
public class TournamentController {
    
    @Autowired
    private TournamentService tournamentService;

    /*
    @RequestMapping(value = "/tournamentBoardForm.do")
    public ModelAndView tournamentBoardForm(TournamentSearchDTO tournamentSearchDTO) {
    	
    	List<TournamentDTO> tournamentList = this.tournamentService.getTournamentList(tournamentSearchDTO);
        ModelAndView mav = new ModelAndView();
       
        mav.addObject("tournamentList", tournamentList);
        mav.setViewName("/tournament/tournamentBoardForm.jsp");
        
        
        return mav;
    }
    */
    
    //대회일정 페이지
    @RequestMapping(value = "/tournamentBoardForm.do")
    public ModelAndView tournamentBoardForm(TournamentSearchDTO tournamentSearchDTO) {
    	
    	//페이징 처리
    	int getTournamentListCnt = this.tournamentService.getTournamentListCnt(tournamentSearchDTO);
    	Map<String, Integer> tournamentMap = Page.getPagingMap(
 			tournamentSearchDTO.getSelectPageNo()// 선택한 페이지 번호
			, tournamentSearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
			, getTournamentListCnt // 검색 결과물 개수
		);
    	
    	tournamentSearchDTO.setSelectPageNo((int) tournamentMap.get("selectPageNo"));
 		tournamentSearchDTO.setRowCntPerPage((int) tournamentMap.get("rowCntPerPage"));
 		tournamentSearchDTO.setBegin_rowNo((int) tournamentMap.get("begin_rowNo"));
 		tournamentSearchDTO.setEnd_rowNo((int) tournamentMap.get("end_rowNo"));
    	//위까지가 페이징 처리
 		
    	//대회일정 게시물 가져오기
    	List<TournamentDTO> tournamentList = this.tournamentService.getTournamentList(tournamentSearchDTO);
        ModelAndView mav = new ModelAndView();
       
        //가져온 대회일정 게시물을 requestScope
        mav.addObject("tournamentList", tournamentList);
        mav.addObject("tournamentMap", tournamentMap);
        mav.setViewName("/tournament/tournamentBoardForm.jsp");
        
        
        return mav;
    }
    
    
    
    @RequestMapping(value = "/tournamentBoardDetail.do")
    public ModelAndView recruitTeamBoardDetailForm(@RequestParam(value="list_no") int list_no) {
 
    	TournamentDTO tournamentDTO = this.tournamentService.recruitTeamBoardDetailForm(list_no);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", tournamentDTO);

    	mav.setViewName("/tournament/tournamentBoardDetail.jsp");
    	
        return mav;
    }
    
    
    
}