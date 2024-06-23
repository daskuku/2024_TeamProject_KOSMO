package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.MainDAO;
import kosmo.team.project.dto.CustomerServiceDetailDTO;
import kosmo.team.project.dto.MainDTO;
import kosmo.team.project.dto.MainSearchDTO;
import kosmo.team.project.dto.RecordsDTO;

@Service
@Transactional
public class MainServiceImplements implements MainService {

	@Autowired
	private MainDAO mainDAO;

	@Override public int getImageBoardListCnt(MainDTO mainDTO) {
	 
		int imageBoardListCnt = mainDAO.getImageBoardListCnt(mainDTO);
	 
		return imageBoardListCnt;
	 }
	 
	@Override public List<MainDTO> getImageBoardList(MainDTO mainDTO) {
	
		List<MainDTO> imageBoardList = mainDAO.getImageBoardList(mainDTO);
	 
		return imageBoardList;
	}
	
	// 메인 페이지 통계 section
	
	@Override
	public List<RecordsDTO> getRegionRatio(RecordsDTO recordsDTO) {
		
		List<RecordsDTO> regionRatio = this.mainDAO.getRegionRatio(recordsDTO);
		
		return regionRatio;
	}
	
	@Override
	public List<RecordsDTO> getGenderRatio(RecordsDTO recordsDTO) {
		
		List<RecordsDTO> genderRatio = this.mainDAO.getGenderRatio(recordsDTO);
		
		return genderRatio;
	}
	
	@Override
	public List<RecordsDTO> getAgeRatio(RecordsDTO recordsDTO) {
		
		List<RecordsDTO> ageRatio = this.mainDAO.getAgeRatio(recordsDTO);
		
		return ageRatio;
	}
	
	
	// 메인 페이지 랭킹 section
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabAll = this.mainDAO.getRecordsGoalRatingTabAll(recordsDTO);

		return recordsGoalRatingTabAll;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabAll = this.mainDAO.getRecordsWinRatingTabAll(recordsDTO);

		return recordsWinRatingTabAll;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabAll(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabAll = this.mainDAO.getRecordsAssistRatingTabAll(recordsDTO);

		return recordsAssistRatingTabAll;

	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabRegion = this.mainDAO.getRecordsGoalRatingTabRegion(recordsDTO);

		return recordsGoalRatingTabRegion;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabRegion = this.mainDAO.getRecordsWinRatingTabRegion(recordsDTO);

		return recordsWinRatingTabRegion;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabRegion(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabRegion = this.mainDAO.getRecordsAssistRatingTabRegion(recordsDTO);

		return recordsAssistRatingTabRegion;

	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabGender(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabGender = this.mainDAO.getRecordsGoalRatingTabGender(recordsDTO);

		return recordsGoalRatingTabGender;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabGender(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabGender = this.mainDAO.getRecordsWinRatingTabGender(recordsDTO);

		return recordsWinRatingTabGender;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabGender(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabGender = this.mainDAO.getRecordsAssistRatingTabGender(recordsDTO);

		return recordsAssistRatingTabGender;

	}
	
	@Override
	public List<RecordsDTO> getRecordsGoalRatingTabAge(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsGoalRatingTabAge = this.mainDAO.getRecordsGoalRatingTabAge(recordsDTO);

		return recordsGoalRatingTabAge;

	}
	
	@Override
	public List<RecordsDTO> getRecordsWinRatingTabAge(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsWinRatingTabAge = this.mainDAO.getRecordsWinRatingTabAge(recordsDTO);

		return recordsWinRatingTabAge;

	}
	
	@Override
	public List<RecordsDTO> getRecordsAssistRatingTabAge(RecordsDTO recordsDTO) {

		List<RecordsDTO> recordsAssistRatingTabAge = this.mainDAO.getRecordsAssistRatingTabAge(recordsDTO);

		return recordsAssistRatingTabAge;

	}
	
	// 메인 페이지 경기 일정 section
	
	@Override
	public List<MainDTO> getMainTournamentList(MainDTO mainDTO) {

		List<MainDTO> tournamentList = this.mainDAO.getMainTournamentList(mainDTO);

		return tournamentList;

	}
	
	@Override
	public List<MainDTO> getCustomerServiceList(MainDTO mainDTO) {

		List<MainDTO> customerServiceList = this.mainDAO.getCustomerServiceList(mainDTO);

		return customerServiceList;

	}
	
	@Override
	public List<MainDTO> getCustomerServiceCategoryList(MainDTO mainDTO) {

		List<MainDTO> customerServiceCategoryList = this.mainDAO.getCustomerServiceCategoryList(mainDTO);

		return customerServiceCategoryList;

	}
	
	@Override
	public int getCustomerServiceQnABoardListAllCnt() {
		
		int customerServiceQnABoardListAllCnt = this.mainDAO.getCustomerServiceQnABoardListAllCnt();
		
		return customerServiceQnABoardListAllCnt;
	}
	
	@Override
	public int getCustomerServiceQnABoardListCnt(MainSearchDTO mainSearchDTO) {
		
		int customerServiceQnABoardListCnt = this.mainDAO.getCustomerServiceQnABoardListCnt(mainSearchDTO);
		
		return customerServiceQnABoardListCnt;
	}
	
	@Override
	public List<MainDTO> getCustomerServiceQnABoardList(MainSearchDTO mainSearchDTO) {
		
		List<MainDTO> customerServiceQnABoardList = this.mainDAO.getCustomerServiceQnABoardList(mainSearchDTO);
		
		return customerServiceQnABoardList;
	}
	
	@Override
	public CustomerServiceDetailDTO getCustomerServiceDetail(int b_no) {
		
		int updateCustomerServiceDetailFormReadCountPlusOne = this.mainDAO.updateCustomerServiceDetailFormReadCountPlusOne(b_no);
		
		CustomerServiceDetailDTO customerServiceDetailDTO = this.mainDAO.getCustomerServiceDetail(b_no);
		
		return customerServiceDetailDTO;
	}
	
	@Override
	public int insertQnABoard(MainDTO mainDTO) {
		
		int QnABoardRegCnt = this.mainDAO.insertQnABoard(mainDTO);
		
		return QnABoardRegCnt;
	}
	
	@Override
	public CustomerServiceDetailDTO getSubject(int b_no) {
		
		CustomerServiceDetailDTO customerServiceDetailDTO = this.mainDAO.getSubject(b_no);
		
		return customerServiceDetailDTO;
	}
	
	@Override
	public int insertQnAComment(MainDTO mainDTO) {
		
		int QnACommentRegCnt = this.mainDAO.insertQnAComment(mainDTO);
		
		return QnACommentRegCnt;
	}
	
	@Override
	public List<CustomerServiceDetailDTO> getCustomerServiceQnADetailComment(CustomerServiceDetailDTO customerServiceDetailDTO){
		
		List<CustomerServiceDetailDTO> getCustomerServiceQnADetailComment = this.mainDAO.getCustomerServiceQnADetailComment(customerServiceDetailDTO);
		
		return getCustomerServiceQnADetailComment;
	}
	
	@Override
	public CustomerServiceDetailDTO customerServiceQnAUpdateForm(int b_no) {
		
		CustomerServiceDetailDTO customerServiceDetailDTO = this.mainDAO.customerServiceQnAUpdateForm(b_no);
		
		return customerServiceDetailDTO;
	}
	
	@Override
	public int customerServiceQnAUpdate(CustomerServiceDetailDTO customerServiceDetailDTO){
		
		int customerServiceQnAUpdateCnt = this.mainDAO.customerServiceQnAUpdate(customerServiceDetailDTO);
		// 수정을 실행하고 수정 적용 행의 개수를 리턴
		
		return customerServiceQnAUpdateCnt;
	}
	
	@Override
	public int customerServiceQnADelete(CustomerServiceDetailDTO customerServiceDetailDTO){
		
		int customerServiceQnADeleteCnt = this.mainDAO.customerServiceQnADelete(customerServiceDetailDTO);
		// 삭제를 실행하고 삭제 적용 행의 개수를 리턴
		
		return customerServiceQnADeleteCnt;
	}
	
	@Override
	public int customerServiceQnACommentUpdate(CustomerServiceDetailDTO customerServiceDetailDTO){
		
		int customerServiceQnACommentUpdateCnt = this.mainDAO.customerServiceQnACommentUpdate(customerServiceDetailDTO);
		// 수정을 실행하고 수정 적용 행의 개수를 리턴
		
		return customerServiceQnACommentUpdateCnt;
	}
	
	@Override
	public int customerServiceQnACommentDelete(CustomerServiceDetailDTO customerServiceDetailDTO){
		
		int customerServiceQnACommentDeleteCnt = this.mainDAO.customerServiceQnACommentDelete(customerServiceDetailDTO);
		// 삭제를 실행하고 삭제 적용 행의 개수를 리턴
		
		return customerServiceQnACommentDeleteCnt;
	}
}
