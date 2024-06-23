package kosmo.team.project.service;

import java.util.List;

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

public interface AdminService {
	// 모든 회원 목록을 불러오는 메서드
	public List<MemberDTO> getMemberList(AdminSearchDTO adminSearchDTO);

	//검색조건을 가져옴
	public List<MemberSearchSettingDTO> getMemberSearchSettingList(MemberSearchSettingDTO memberSearchSettingDTO);
	//검색조건 숨기기/보이기 업데이트
	
	public List<MemberSearchSettingDTO> getMemberShowHideSettingList(MemberSearchSettingDTO memberSearchSettingDTO);
	
	public List<SidoSearchSettingDTO> getSidoSearchSettingList(SidoSearchSettingDTO sidoSearchSettingDTO);
	
	public List<SidoSearchSettingDTO> getSidoShowHideSettingList(SidoSearchSettingDTO sidoSearchSettingDTO);
	
	
	
	
	
	public int updateMemberSearchShowHideSetting(MemberSearchShowHideSettingDTO memberSearchShowHideSettingDTO);
	
	public List<String> updateSidoShowHideSetting(SidoSearchShowHideSettingDTO sidoSearchShowHideSettingDTO);
	
	
	
	
	
	
	public int getMemberListCnt(AdminSearchDTO adminSearchDTO);

	public int getMemberListAllCnt();

	MemberDTO getMember(int m_no);

	MemberDTO getMemberForUpDel(int m_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateMember(MemberDTO memberDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteMember(MemberDTO memberDTO);

	PlayerRecordDTO getPlayerRecord(int m_no);

	PlayerRecordDTO getRecordUpDel(int m_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updatePlayerRecord(PlayerRecordDTO playerRecordDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 회원목록] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deletePlayerRecord(PlayerRecordDTO playerRecordDTO);

	// ----------------------------------------
	// 공지사항
	// ----------------------------------------
	public List<CommunityDTO> getNoticeBoardList(AdminSearchDTO adminSearchDTO);

	public int getNoticeBoardListCnt(AdminSearchDTO adminSearchDTO);

	public int getNoticeBoardAllCnt();

	CommunityDTO getNoticeBoard(int b_no);

	CommunityDTO getNoticeBoardForUpDel(int b_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateNoticeBoard(CommunityDTO communityDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteNoticeBoard(CommunityDTO communityDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 공지사항 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int insertNoticeBoard(CommunityDTO communityDTO);

	// ----------------------------------------
	// 경기장
	// ----------------------------------------
	public List<Stadim2DTO> getStadiumList(AdminSearchDTO adminSearchDTO);

	public int getStadiumListCnt(AdminSearchDTO adminSearchDTO);

	public int getStadiumListAllCnt();

	Stadim2DTO getStadium(int stadium_no);

	Stadim2DTO getStadiumForUpDel(int stadium_no);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 경기장] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int updateStadium(Stadim2DTO stadim2DTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 경기장] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int deleteStadium(Stadim2DTO stadim2DTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 경기장 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int insertStadium(Stadim2DTO stadim2DTO);
	
	
	
	
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// 대회일정 관련 
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	public List<TournamentDTO> getTournamentList(TournamentSearchDTO tournamentSearchDTO);
	
	public int getTournamentListCnt(TournamentSearchDTO tournamentSearchDTO);
	
	public TournamentDTO getTournamentDetail(int list_no);
	
	public int deleteBoard(int list_no);
	
	int regBoard(TournamentDTO tournamentDTO);
	
	int updateCnt(TournamentDTO tournamentDTO);

	
	
	
	
	

public int getCommunityGallaryBoardListAllCnt();
	
	public int getCommunityGallaryBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);

	public List<CommunityDTO> getCommunityGallaryBoardList(AdminCommunitySearchDTO communitySearchDTO);
	
	public int insertCommunityGallaryProc(CommunityDTO communityDTO);
	
	public CommunityDTO getCommunityGallaryDetailForm(int b_no, boolean isUpdateReadCount);
	     
	public int updateCommunityGallaryUpProc(CommunityDTO communityDTO);
	
	public int deleteCommunityGallaryDelProc(CommunityDTO communityDTO);
	
	 public int getTabAllMarketplaceBoardListAllCnt();
	 
	 public int getTabAllMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
	 
	 public List<CommunityDTO> getTabAllMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO);
	 
	 public int getTabSaleMarketplaceBoardListAllCnt();
	 
	 public int getTabSaleMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
	 
	 public List<CommunityDTO> getTabSaleMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO);
	 
	 public int getTabFreeSharingMarketplaceBoardListAllCnt();
	 
	 public int getTabFreeSharingMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
	 
	 public List<CommunityDTO> getTabFreeSharingMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO);
	
	 public int insertMarketplaceSaleCommunity(CommunityDTO communityDTO);
	 
	 public int insertMarketplaceFreeSharingCommunity(CommunityDTO communityDTO);
	 
	 public CommunityDTO getCommunityMarketplaceSaleDetailForm(int b_no, boolean isReadCount);
	 
	 public CommunityDTO getCommunityMarketplaceFreeSharingDetailForm(int b_no, boolean isReadCount);
	
	 public int updateMarketplaceSaleBoard(CommunityDTO communityDTO);
	 
	 public int updateMarketplaceFreeSharingBoard(CommunityDTO communityDTO);
	 
	 public int deleteMarketplaceSaleBoard(CommunityDTO communityDTO);
	 
	 public int deleteMarketplaceFreeSharingBoard(CommunityDTO communityDTO);
	 
	 //자유게시판-------------------------------------------------------------------------------------------------------------
	 public int getFreeBoardAllCnt();
	 
	 public int getFreeBoardListCnt(AdminCommunitySearchDTO communitySearchDTO);
	 
	 public List<CommunityDTO> getFreeBoardList(AdminCommunitySearchDTO communitySearchDTO);
	 
	 public int insertCommunityFreeBoard(CommunityDTO communityDTO);
	 
	 public int updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO);
	 
	 public CommunityFreeBoardDetailDTO getFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO);
	
	 public int getFreeBoardDetailCommentPageListCount(CommunityFreeBoardDetailDTO detailDTO);
	 
	 public List<CommunityFreeBoardDetailDTO> getFreeBoardDetailCommentPageList(CommunityFreeBoardDetailDTO detailDTO);
	 
	 public int insertFreeBoardDetailComment(CommunityFreeBoardDetailDTO detailDTO);
	 
	 public int insertFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
	 
	 public CommunityDTO getFreeBoard(int b_no);
	 
	 public int updateCommunityFreeBoard(CommunityDTO communityDTO);
	 
	 public int deleteCommunityFreeBoard(CommunityDTO communityDTO);
	 
	 public int adminCommunityFreeBoardDetailCommentOfCommentUpdateProc(CommunityFreeBoardDetailDTO detailDTO);

	 public int adminCommunityFreeBoardDetailCommentOfCommentDeleteProc(CommunityFreeBoardDetailDTO detailDTO);

	

	

	

	

	

	
}
