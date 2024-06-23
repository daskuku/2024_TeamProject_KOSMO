package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.RecordsDTO;

@Mapper
public interface RecordsDAO {
	
	// 전체 순위
	
	public List<RecordsDTO> getRecordsRankingTabAll(RecordsDTO recordsDTO);
	
	public int getRecordsRankingTabAllListCnt(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabAll(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabAll(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabAll(RecordsDTO recordsDTO);
	
	
	// 지역 순위
	
	public List<RecordsDTO> getRecordsRankingTabRegion(RecordsDTO recordsDTO);
	
	public int getRecordsRankingTabRegionListCnt(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabRegion(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabRegion(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabRegion(RecordsDTO recordsDTO);
	
	// 성별 순위
	
	public List<RecordsDTO> getRecordsRankingTabGender(RecordsDTO recordsDTO);
	
	public int getRecordsRankingTabGenderListCnt(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabGender(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabGender(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabGender(RecordsDTO recordsDTO);
	
	// 연령대별 순위
	
	public List<RecordsDTO> getRecordsRankingTabAge(RecordsDTO recordsDTO);
	
	public int getRecordsRankingTabAgeListCnt(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabAge(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabAge(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabAge(RecordsDTO recordsDTO);
	
	// 통계
	
	public List<RecordsDTO> getAnnualRegisteredMember(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRegionRatio(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getGenderRatio(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getAgeRatio(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getTeamMemberCnt(RecordsDTO recordsDTO);
}