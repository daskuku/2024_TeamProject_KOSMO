package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosmo.team.project.dao.RecordsDAO;
import kosmo.team.project.dto.RecordsDTO;

@Service
public class RecordsServiceImplements implements RecordsService {

	@Autowired
	private RecordsDAO recordsDAO;

	// 전체 순위
	
	@Override
	public List<RecordsDTO> getRecordsRankingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsRankingTabAll = this.recordsDAO.getRecordsRankingTabAll(recordsDTO);

		return recordsRankingTabAll;

	}
	
	@Override
	public int getRecordsRankingTabAllListCnt(RecordsDTO recordsDTO) {
		
		int recordsRankingTabAllListCnt = this.recordsDAO.getRecordsRankingTabAllListCnt(recordsDTO);
		
		return recordsRankingTabAllListCnt;
	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabAll = this.recordsDAO.getRecordsGoalRatingTabAll(recordsDTO);

		return recordsGoalRatingTabAll;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabAll = this.recordsDAO.getRecordsWinRatingTabAll(recordsDTO);

		return recordsWinRatingTabAll;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabAll = this.recordsDAO.getRecordsAssistRatingTabAll(recordsDTO);

		return recordsAssistRatingTabAll;

	}
	
	// 지역 순위
	
	@Override
	public List<RecordsDTO> getRecordsRankingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsRankingTabRegion = this.recordsDAO.getRecordsRankingTabRegion(recordsDTO);

		return recordsRankingTabRegion;

	}
	
	@Override
	public int getRecordsRankingTabRegionListCnt(RecordsDTO recordsDTO) {
		
		int recordsRankingTabRegionListCnt = this.recordsDAO.getRecordsRankingTabRegionListCnt(recordsDTO);
		
		return recordsRankingTabRegionListCnt;
	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabRegion = this.recordsDAO.getRecordsGoalRatingTabRegion(recordsDTO);

		return recordsGoalRatingTabRegion;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabRegion = this.recordsDAO.getRecordsWinRatingTabRegion(recordsDTO);

		return recordsWinRatingTabRegion;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabRegion = this.recordsDAO.getRecordsAssistRatingTabRegion(recordsDTO);

		return recordsAssistRatingTabRegion;

	}
	
	// 성별 순위
	
	@Override
	public List<RecordsDTO> getRecordsRankingTabGender(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsRankingTabGender = this.recordsDAO.getRecordsRankingTabGender(recordsDTO);

		return recordsRankingTabGender;

	}
	
	@Override
	public int getRecordsRankingTabGenderListCnt(RecordsDTO recordsDTO) {
		
		int recordsRankingTabGenderListCnt = this.recordsDAO.getRecordsRankingTabGenderListCnt(recordsDTO);
		
		return recordsRankingTabGenderListCnt;
	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabGender(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabGender = this.recordsDAO.getRecordsGoalRatingTabGender(recordsDTO);

		return recordsGoalRatingTabGender;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabGender(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabGender = this.recordsDAO.getRecordsWinRatingTabGender(recordsDTO);

		return recordsWinRatingTabGender;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabGender(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabGender = this.recordsDAO.getRecordsAssistRatingTabGender(recordsDTO);

		return recordsAssistRatingTabGender;

	}
	
	// 연령대별 순위
	
	@Override
	public List<RecordsDTO> getRecordsRankingTabAge(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsRankingTabAge = this.recordsDAO.getRecordsRankingTabAge(recordsDTO);

		return recordsRankingTabAge;

	}
	
	@Override
	public int getRecordsRankingTabAgeListCnt(RecordsDTO recordsDTO) {
		
		int recordsRankingTabAgeListCnt = this.recordsDAO.getRecordsRankingTabAgeListCnt(recordsDTO);
		
		return recordsRankingTabAgeListCnt;
	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabAge(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabAge = this.recordsDAO.getRecordsGoalRatingTabAge(recordsDTO);

		return recordsGoalRatingTabAge;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabAge(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabAge = this.recordsDAO.getRecordsWinRatingTabAge(recordsDTO);

		return recordsWinRatingTabAge;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabAge(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabAge = this.recordsDAO.getRecordsAssistRatingTabAge(recordsDTO);

		return recordsAssistRatingTabAge;

	}
	
	// 통계
	
	@Override
	public List<RecordsDTO> getAnnualRegisteredMember(RecordsDTO recordsDTO) {
		
		List<RecordsDTO> annualRegisteredMember = this.recordsDAO.getAnnualRegisteredMember(recordsDTO);
		
		return annualRegisteredMember;
	}
	
	@Override
	public List<RecordsDTO> getRegionRatio(RecordsDTO recordsDTO) {
		
		List<RecordsDTO> regionRatio = this.recordsDAO.getRegionRatio(recordsDTO);
		
		return regionRatio;
	}
	
	@Override
	public List<RecordsDTO> getGenderRatio(RecordsDTO recordsDTO) {
		
		List<RecordsDTO> genderRatio = this.recordsDAO.getGenderRatio(recordsDTO);
		
		return genderRatio;
	}
	
	@Override
	public List<RecordsDTO> getAgeRatio(RecordsDTO recordsDTO) {
		
		List<RecordsDTO> ageRatio = this.recordsDAO.getAgeRatio(recordsDTO);
		
		return ageRatio;
	}
	
	@Override
	public List<RecordsDTO> getTeamMemberCnt(RecordsDTO recordsDTO) {
		
		List<RecordsDTO> teamMemberCnt = this.recordsDAO.getTeamMemberCnt(recordsDTO);
		
		return teamMemberCnt;
	}
}