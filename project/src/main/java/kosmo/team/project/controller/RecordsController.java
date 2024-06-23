package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.RecordsDTO;
import kosmo.team.project.service.RecordsService;

@Controller
public class RecordsController {
	@Autowired
	private RecordsService recordsService;
	
    @RequestMapping(value = "/recordsRankingForm.do")
    public ModelAndView recordsRankingForm(RecordsDTO recordsDTO) {
    	
    	ModelAndView mav = new ModelAndView();

    	// 전체 순위
    	
    	List<RecordsDTO> recordsRankingTabAll = this.recordsService.getRecordsRankingTabAll(recordsDTO);
		
		mav.addObject("recordsRankingTabAll", recordsRankingTabAll);
		
		int recordsRankingTabAllListCnt = this.recordsService.getRecordsRankingTabAllListCnt(recordsDTO);
		
		mav.addObject("recordsRankingTabAllListCnt", recordsRankingTabAllListCnt);
		
		List<RecordsDTO> recordsGoalRatingTabAll = this.recordsService.getRecordsGoalRatingTabAll(recordsDTO);
		
		mav.addObject("recordsGoalRatingTabAll", recordsGoalRatingTabAll);

		List<RecordsDTO> recordsWinRatingTabAll = this.recordsService.getRecordsWinRatingTabAll(recordsDTO);
		
		mav.addObject("recordsWinRatingTabAll", recordsWinRatingTabAll);
		
		List<RecordsDTO> recordsAssistRatingTabAll = this.recordsService.getRecordsAssistRatingTabAll(recordsDTO);
		
		mav.addObject("recordsAssistRatingTabAll", recordsAssistRatingTabAll);
		
		// 지역별 순위
		
		List<RecordsDTO> recordsRankingTabRegion = this.recordsService.getRecordsRankingTabRegion(recordsDTO);
		
		mav.addObject("recordsRankingTabRegion", recordsRankingTabRegion);
		
		int recordsRankingTabRegionListCnt = this.recordsService.getRecordsRankingTabRegionListCnt(recordsDTO);
		
		mav.addObject("recordsRankingTabRegionListCnt", recordsRankingTabRegionListCnt);
		
		List<RecordsDTO> recordsGoalRatingTabRegion = this.recordsService.getRecordsGoalRatingTabRegion(recordsDTO);
		
		mav.addObject("recordsGoalRatingTabRegion", recordsGoalRatingTabRegion);

		List<RecordsDTO> recordsWinRatingTabRegion = this.recordsService.getRecordsWinRatingTabRegion(recordsDTO);
		
		mav.addObject("recordsWinRatingTabRegion", recordsWinRatingTabRegion);
		
		List<RecordsDTO> recordsAssistRatingTabRegion = this.recordsService.getRecordsAssistRatingTabRegion(recordsDTO);
		
		mav.addObject("recordsAssistRatingTabRegion", recordsAssistRatingTabRegion);
		
		// 성별 순위
		
		List<RecordsDTO> recordsRankingTabGender = this.recordsService.getRecordsRankingTabGender(recordsDTO);
		
		mav.addObject("recordsRankingTabGender", recordsRankingTabGender);
		
		int recordsRankingTabGenderListCnt = this.recordsService.getRecordsRankingTabGenderListCnt(recordsDTO);
		
		mav.addObject("recordsRankingTabGenderListCnt", recordsRankingTabGenderListCnt);
		
		List<RecordsDTO> recordsGoalRatingTabGender = this.recordsService.getRecordsGoalRatingTabGender(recordsDTO);
		
		mav.addObject("recordsGoalRatingTabGender", recordsGoalRatingTabGender);

		List<RecordsDTO> recordsWinRatingTabGender = this.recordsService.getRecordsWinRatingTabGender(recordsDTO);
		
		mav.addObject("recordsWinRatingTabGender", recordsWinRatingTabGender);
		
		List<RecordsDTO> recordsAssistRatingTabGender = this.recordsService.getRecordsAssistRatingTabGender(recordsDTO);
		
		mav.addObject("recordsAssistRatingTabGender", recordsAssistRatingTabGender);
		
		// 연령대별 순위
		
		List<RecordsDTO> recordsRankingTabAge = this.recordsService.getRecordsRankingTabAge(recordsDTO);
		
		mav.addObject("recordsRankingTabAge", recordsRankingTabAge);
		
		int recordsRankingTabAgeListCnt = this.recordsService.getRecordsRankingTabAgeListCnt(recordsDTO);
		
		mav.addObject("recordsRankingTabAgeListCnt", recordsRankingTabAgeListCnt);
		
		List<RecordsDTO> recordsGoalRatingTabAge = this.recordsService.getRecordsGoalRatingTabAge(recordsDTO);
		
		mav.addObject("recordsGoalRatingTabAge", recordsGoalRatingTabAge);

		List<RecordsDTO> recordsWinRatingTabAge = this.recordsService.getRecordsWinRatingTabAge(recordsDTO);
		
		mav.addObject("recordsWinRatingTabAge", recordsWinRatingTabAge);
		
		List<RecordsDTO> recordsAssistRatingTabAge = this.recordsService.getRecordsAssistRatingTabAge(recordsDTO);
		
		mav.addObject("recordsAssistRatingTabAge", recordsAssistRatingTabAge);
		
    	mav.setViewName("/records/recordsRankingForm.jsp");
    	
        return mav;
    }
    
    @RequestMapping(value = "/recordsStatisticsForm.do")
    public ModelAndView recordsStatisticsForm(RecordsDTO recordsDTO) {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	List<RecordsDTO> annualRegisteredMember = this.recordsService.getAnnualRegisteredMember(recordsDTO);
		
		mav.addObject("annualRegisteredMember", annualRegisteredMember);
		
		List<RecordsDTO> regionRatio = this.recordsService.getRegionRatio(recordsDTO);
		
		mav.addObject("regionRatio", regionRatio);
		
		List<RecordsDTO> genderRatio = this.recordsService.getGenderRatio(recordsDTO);
		
		mav.addObject("genderRatio", genderRatio);
		
		List<RecordsDTO> ageRatio = this.recordsService.getAgeRatio(recordsDTO);
		
		mav.addObject("ageRatio", ageRatio);
		
		List<RecordsDTO> teamMemberCnt = this.recordsService.getTeamMemberCnt(recordsDTO);
        
		mav.addObject("teamMemberCnt", teamMemberCnt);
		
    	mav.setViewName("/records/recordsStatisticsForm.jsp");
    	
        return mav;
    }
}