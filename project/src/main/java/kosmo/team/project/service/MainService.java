package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.CustomerServiceDetailDTO;
import kosmo.team.project.dto.MainDTO;
import kosmo.team.project.dto.MainSearchDTO;
import kosmo.team.project.dto.RecordsDTO;

public interface MainService {
	
	// 메인 페이지 갤러리 section
	
	public int getImageBoardListCnt(MainDTO mainDTO);
	
	public List<MainDTO> getImageBoardList(MainDTO mainDTO);
	
	// 메인 페이지 통계 section
	
	public List<RecordsDTO> getRegionRatio(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getGenderRatio(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getAgeRatio(RecordsDTO recordsDTO);
	
	// 메인 페이지 랭킹 section
	
	public List<RecordsDTO> getRecordsGoalRatingTabAll(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabAll(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabAll(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabRegion(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabRegion(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabRegion(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabGender(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabGender(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabGender(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsGoalRatingTabAge(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsWinRatingTabAge(RecordsDTO recordsDTO);
	
	public List<RecordsDTO> getRecordsAssistRatingTabAge(RecordsDTO recordsDTO);
	
	// 메인 페이지 경기 일정 section
	
	public List<MainDTO> getMainTournamentList(MainDTO mainDTO);
	
	// 고객센터 - FAQ
	
	public List<MainDTO> getCustomerServiceList(MainDTO mainDTO);
	
	public List<MainDTO> getCustomerServiceCategoryList(MainDTO mainDTO);
	
	// 고객센터 - QnA
	
	public int getCustomerServiceQnABoardListAllCnt();
	
	public int getCustomerServiceQnABoardListCnt(MainSearchDTO mainSearchDTO);
	
	public List<MainDTO> getCustomerServiceQnABoardList(MainSearchDTO mainSearchDTO);
	
	public CustomerServiceDetailDTO getCustomerServiceDetail(int b_no);
	
	public int insertQnABoard(MainDTO mainDTO);
	
	public CustomerServiceDetailDTO getSubject(int b_no);
	
	public int insertQnAComment(MainDTO mainDTO);
	
	public List<CustomerServiceDetailDTO> getCustomerServiceQnADetailComment(CustomerServiceDetailDTO customerServiceDetailDTO);
	
	public CustomerServiceDetailDTO customerServiceQnAUpdateForm(int b_no);
	
	public int customerServiceQnAUpdate(CustomerServiceDetailDTO customerServiceDetailDTO);
	
	public int customerServiceQnADelete(CustomerServiceDetailDTO customerServiceDetailDTO);
	
	public int customerServiceQnACommentUpdate(CustomerServiceDetailDTO customerServiceDetailDTO);
	
	public int customerServiceQnACommentDelete(CustomerServiceDetailDTO customerServiceDetailDTO);
}
