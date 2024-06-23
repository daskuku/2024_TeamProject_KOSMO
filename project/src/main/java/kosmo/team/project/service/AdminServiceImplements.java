package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosmo.team.project.dao.AdminDAO;
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

@Service
public class AdminServiceImplements implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	
	
	//회원목록쪽 검색조건을 가져오는것
	
	@Override
	public List<MemberSearchSettingDTO> getMemberSearchSettingList(MemberSearchSettingDTO memberSearchSettingDTO) {
		
		List<MemberSearchSettingDTO> memberSearchSettingList = this.adminDAO.getMemberSearchSettingList(memberSearchSettingDTO);
		
		return memberSearchSettingList;
	}
	
	
	@Override
	public List<MemberSearchSettingDTO> getMemberShowHideSettingList(MemberSearchSettingDTO memberSearchSettingDTO) {
		
		List<MemberSearchSettingDTO> memberShowHideSettingList = this.adminDAO.getMemberShowHideSettingList(memberSearchSettingDTO);
		
		return memberShowHideSettingList;
	}
	
	@Override
	public List<SidoSearchSettingDTO> getSidoSearchSettingList(SidoSearchSettingDTO sidoSearchSettingDTO) {
		
		List<SidoSearchSettingDTO> sidoSearchSettingList = this.adminDAO.getSidoSearchSettingList(sidoSearchSettingDTO);
		
		return sidoSearchSettingList;
	}

	
	@Override
	public List<SidoSearchSettingDTO> getSidoShowHideSettingList(SidoSearchSettingDTO sidoSearchSettingDTO) {
		List<SidoSearchSettingDTO> sidoShowHideSettingList = this.adminDAO.getSidoShowHideSettingList(sidoSearchSettingDTO);
		return sidoShowHideSettingList;
	}

	
	
	//검색조건 숨기기/보이기 업데이트
	@Override
	public int updateMemberSearchShowHideSetting(MemberSearchShowHideSettingDTO memberSearchShowHideSettingDTO) {
		int updatedRows = 0;

	    // Gender 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateGenderSetting(memberSearchShowHideSettingDTO);
	   

	    // 연령대 설정 업데이트
	    
	        updatedRows = this.adminDAO.updateAgeRangeSetting(memberSearchShowHideSettingDTO);
	    

	    // 시/도 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateSidoSetting(memberSearchShowHideSettingDTO);
	    

	    // 가입일 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateJoinDateSetting(memberSearchShowHideSettingDTO);
	    

	    // 경기수 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateGameCountSetting(memberSearchShowHideSettingDTO);
	   

	    // 승리수 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateWinCountSetting(memberSearchShowHideSettingDTO);
	  

	    // 무승부 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateDrawCountSetting(memberSearchShowHideSettingDTO);
	   

	    // 패배 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateLossCountSetting(memberSearchShowHideSettingDTO);
	   

	    // 골 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateGoalCountSetting(memberSearchShowHideSettingDTO);
	   

	    // 어시스트 설정 업데이트
	   
	        updatedRows = this.adminDAO.updateAssistsCountSetting(memberSearchShowHideSettingDTO);
	   

	    return updatedRows;
	}
	
	@Override
	public List<String> updateSidoShowHideSetting(SidoSearchShowHideSettingDTO sidoSearchShowHideSettingDTO) {
		int updatedSidoRows = 0;

		List<String> list = sidoSearchShowHideSettingDTO.getSidoOrder();
		
		for(int i=0;  i < list.size();i++) {
			
			String[] id_value = list.get(i).split("_");
			int sido_id = Integer.parseInt(id_value[0]);
			int display_position = Integer.parseInt(id_value[1]);
			
			SidoSearchShowHideSettingDTO sidoShowHideSettingDTO = new SidoSearchShowHideSettingDTO();
			sidoShowHideSettingDTO.setSido_id(sido_id);
			sidoShowHideSettingDTO.setDisplay_position(display_position);
			
			updatedSidoRows = adminDAO.updateSidoShowHideSetting(sidoShowHideSettingDTO);
			
			//System.out.println("Updated rows for sido_id " + sido_id + ": " + updatedSidoRows);
		
		}
		return null;


	    
	}

	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<MemberDTO> getMemberList(AdminSearchDTO AdminSearchDTO) {

		List<MemberDTO> memberList = this.adminDAO.getMemberList(AdminSearchDTO);

		return memberList;

	}

	public int getMemberListCnt(AdminSearchDTO AdminSearchDTO) {

		int memberListCnt = this.adminDAO.getMemberListCnt(AdminSearchDTO);

		return memberListCnt;

	}

	public int getMemberListAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int memberListAllCnt = this.adminDAO.getMemberListAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return memberListAllCnt;
	}

	public MemberDTO getMember(int m_no) {

		MemberDTO memberDTO = this.adminDAO.getMember(m_no);

		return memberDTO;

	}

	public MemberDTO getMemberForUpDel(int m_no) {

		MemberDTO MemberDTO = this.adminDAO.getMember(m_no);

		return MemberDTO;

	}

	public int updateMember(MemberDTO memberDTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int memberCnt = this.adminDAO.getMemberCnt(memberDTO.getM_no());
		if (memberCnt == 0) {
			return memberCnt;
		}
		int memberUpCnt = this.adminDAO.updateMember(memberDTO);

		// 수정 적용개수 리턴하기
		return memberUpCnt;
	}

	public int deleteMember(MemberDTO memberDTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int memberCnt = this.adminDAO.getMemberCnt(memberDTO.getM_no());
		if (memberCnt == 0) {
			return memberCnt;
		}

		int memberDelCnt = this.adminDAO.deleteMember(memberDTO);

		// 수정 적용개수 리턴하기
		return memberDelCnt;

	}

	public PlayerRecordDTO getPlayerRecord(int m_no) {

		PlayerRecordDTO playerRecordDTO = this.adminDAO.getPlayerRecord(m_no);

		return playerRecordDTO;

	}

	public PlayerRecordDTO getRecordUpDel(int m_no) {

		PlayerRecordDTO playerRecordDTO = this.adminDAO.getPlayerRecord(m_no);

		return playerRecordDTO;

	}

	public int updatePlayerRecord(PlayerRecordDTO playerRecordDTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int playerRecordCnt = this.adminDAO.getPlayerRecordCnt(playerRecordDTO.getPlayer());
		if (playerRecordCnt == 0) {
			return playerRecordCnt;
		}
		int playerRecordUpCnt = this.adminDAO.updatePlayerRecord(playerRecordDTO);

		// 수정 적용개수 리턴하기
		return playerRecordUpCnt;
	}

	public int deletePlayerRecord(PlayerRecordDTO playerRecordDTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int PlayerRecordCnt = this.adminDAO.getPlayerRecordCnt(playerRecordDTO.getPlayer());
		if (PlayerRecordCnt == 0) {
			return PlayerRecordCnt;
		}

		int PlayerRecordDelCnt = this.adminDAO.deletePlayerRecord(playerRecordDTO);

		// 수정 적용개수 리턴하기
		return PlayerRecordDelCnt;

	}

	// --------------------------
	// 공지사항
	// --------------------------

	@Override
	public List<CommunityDTO> getNoticeBoardList(AdminSearchDTO adminSearchDTO) {

		List<CommunityDTO> noticeBoardList = this.adminDAO.getNoticeBoardList(adminSearchDTO);

		return noticeBoardList;

	}

	@Override
	public int getNoticeBoardListCnt(AdminSearchDTO adminSearchDTO) {

		int noticeBoardListCount = this.adminDAO.getNoticeBoardListCnt(adminSearchDTO);

		return noticeBoardListCount;

	}

	public int getNoticeBoardAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int noticeBoardListAllCnt = this.adminDAO.getNoticeBoardAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return noticeBoardListAllCnt;
	}

	public CommunityDTO getNoticeBoard(int b_no) {

		int updateCnt = this.adminDAO.updateNoticeBoardReadCount(b_no);

		CommunityDTO communityDTO = this.adminDAO.getNoticeBoard(b_no);

		return communityDTO;

	}

	// 이아래쪽은 공지사항 수정,삭제

	public CommunityDTO getNoticeBoardForUpDel(int b_no) {

		CommunityDTO communityDTO = this.adminDAO.getNoticeBoard(b_no);

		return communityDTO;

	}

	public int updateNoticeBoard(CommunityDTO communityDTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int boardCnt = this.adminDAO.getNoticeBoardCnt(communityDTO.getB_no());
		if (boardCnt == 0) {
			return boardCnt;
		}
		int boardUpCnt = this.adminDAO.updateNoticeBoard(communityDTO);

		// 수정 적용개수 리턴하기
		return boardUpCnt;
	}

	public int deleteNoticeBoard(CommunityDTO communityDTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int boardCnt = this.adminDAO.getNoticeBoardCnt(communityDTO.getB_no());
		if (boardCnt == 0) {
			return boardCnt;
		}

		int boardDelCnt = this.adminDAO.deleteNoticeBoard(communityDTO);

		// 수정 적용개수 리턴하기
		return boardDelCnt;
	}

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [1개 게시판 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	public int insertNoticeBoard(CommunityDTO communityDTO) {
		// ----------------------------------------------
		// BoardDAOImpl 객체의
		// insertBoard 메소드 호출하여
		// 게시판 글 입력 후 입력 적용 행의 개수 얻기
		// ----------------------------------------------
		int adminNoticeboardRegCnt = this.adminDAO.insertNoticeBoard(communityDTO);

		// ----------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		// ----------------------------------------------
		return adminNoticeboardRegCnt;
	}
	
	
	
	
	
	//------------------------------------------------------
	//경기장
	//------------------------------------------------------
	
	

	@Override
	public List<Stadim2DTO> getStadiumList(AdminSearchDTO adminSearchDTO) {

		List<Stadim2DTO> stadiumList = this.adminDAO.getStadiumList(adminSearchDTO);

		return stadiumList;

	}

	
	@Override
	public int getStadiumListCnt(AdminSearchDTO adminSearchDTO) {

		int StadiumListCnt = this.adminDAO.getStadiumListCnt(adminSearchDTO);

		return StadiumListCnt;

	}

	public int getStadiumListAllCnt() {
		// --------------------------------------
		// BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		// 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		// --------------------------------------
		int StadiumListAllCnt = this.adminDAO.getStadiumListAllCnt();
		// --------------------------------------
		// 변수 boardListAllCnt 안의 데이터를 리턴하기
		// --------------------------------------
		return StadiumListAllCnt;
	}

	public Stadim2DTO getStadium(int stadium_no) {

	
		Stadim2DTO stadim2DTO = this.adminDAO.getStadium(stadium_no);

		return stadim2DTO;

	}
	
	public Stadim2DTO getStadiumForUpDel(int stadium_no) {

		Stadim2DTO stadim2DTO = this.adminDAO.getStadium(stadium_no);

		return stadim2DTO;

	}
	
	
	
	

	public int updateStadium(Stadim2DTO stadim2DTO) {

		// --------------------------------------
		// 수정할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int stadiumDuplicationCnt= this.adminDAO.getStadiumDuplication(stadim2DTO);
		
		if(stadiumDuplicationCnt >=1) {
			
			return 4;
			
			
		}
		
		
		int stadiumCnt = this.adminDAO.getStadiumCnt(stadim2DTO.getStadium_no());
		if (stadiumCnt == 0) {
			return stadiumCnt;
		}
		int stadiumUpCnt = this.adminDAO.updateStadium(stadim2DTO);

		// 수정 적용개수 리턴하기
		return stadiumUpCnt;
	}

	
	
	
	public int deleteStadium(Stadim2DTO  stadim2DTO) {

		// --------------------------------------
		// 삭제할 게시판의 존재 개수 얻기
		// 만약 수정할 게시판의 개수가 0개면(=이미 삭제되었으면) 0리턴하기
		// --------------------------------------
		int stadiumCnt = this.adminDAO.getStadiumCnt(stadim2DTO.getStadium_no());
		if (stadiumCnt == 0) {
			return stadiumCnt;
		}

		int stadiumDelCnt = this.adminDAO.deleteStadium(stadim2DTO);

		// 수정 적용개수 리턴하기
		return stadiumDelCnt;
	}
	
	
	public int insertStadium(Stadim2DTO stadim2DTO) {
		
		
		
		int stadiumDuplicationCnt= this.adminDAO.getStadiumDuplication(stadim2DTO);
		
		if(stadiumDuplicationCnt >=1) {
			
			return 4;
			
			
		}
		
		
		
		
		
		
		
		// ----------------------------------------------
		// BoardDAOImpl 객체의
		// insertBoard 메소드 호출하여
		// 게시판 글 입력 후 입력 적용 행의 개수 얻기
		// ----------------------------------------------
		int adminStadiumRegCnt = this.adminDAO.insertStadium(stadim2DTO);

		// ----------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		// ----------------------------------------------
		return adminStadiumRegCnt;
	}
	
	//=======================================================================================================
	//대회일정
	//=======================================================================================================
	public List<TournamentDTO> getTournamentList(TournamentSearchDTO tournamentSearchDTO) {

		List<TournamentDTO> tournamentList = this.adminDAO.getTournamentList(tournamentSearchDTO);

		return tournamentList;

	}
	
	//페이징 처리를 위한 게시물 개수 가져오기
	public int getTournamentListCnt(TournamentSearchDTO tournamentSearchDTO) {
		
		int getTournamentListCnt = this.adminDAO.getTournamentListCnt(tournamentSearchDTO);

		return getTournamentListCnt;
	}
	

	public TournamentDTO getTournamentDetail(int list_no) {
		
		TournamentDTO getTournamentDetail = this.adminDAO.getTournamentDetail(list_no);
		
		return getTournamentDetail;
	}
	
	public int deleteBoard(int list_no) {
		
		int deleteBoard = this.adminDAO.deleteBoard(list_no);
		
		return deleteBoard;
	}


	public int regBoard(TournamentDTO tournamentDTO) {
		
		int regBoard = this.adminDAO.regBoard(tournamentDTO);
		return regBoard;
	}
	

	public int updateCnt(TournamentDTO tournamentDTO) {
		
		int updateCnt = this.adminDAO.updateCnt(tournamentDTO);
		return updateCnt;
	}
	
	
	
	
	
	
	
	// 갤러리
		@Override
		public int getCommunityGallaryBoardListAllCnt() {
			return adminDAO.getCommunityGallaryBoardListAllCnt();
		}

		@Override
		public int getCommunityGallaryBoardListCnt(AdminCommunitySearchDTO communitySearchDTO) {
			return adminDAO.getCommunityGallaryBoardListCnt(communitySearchDTO);
		}

		@Override
		public List<CommunityDTO> getCommunityGallaryBoardList(AdminCommunitySearchDTO communitySearchDTO) {
			return adminDAO.getCommunityGallaryBoardList(communitySearchDTO);
		}

		@Override
		public int insertCommunityGallaryProc(CommunityDTO communityDTO) {
			int boardRegCnt = this.adminDAO.insertCommunityGallaryProc(communityDTO);
			return boardRegCnt;
		}
		
		@Override
		public CommunityDTO getCommunityGallaryDetailForm(int b_no, boolean isUpdateReadCount) {

			if (isUpdateReadCount) {
				this.adminDAO.updateCommunityGallaryReadCount(b_no);
			}

			CommunityDTO communityDTO = this.adminDAO.getCommunityGallaryDetailForm(b_no);

			return communityDTO;
		}
		
		@Override
		public int updateCommunityGallaryUpProc(CommunityDTO communityDTO) {

			int boardCnt = this.adminDAO.getCommunityGallaryBoardCnt(communityDTO.getB_no());
			if (boardCnt == 0) {
				return boardCnt;
			}
			int boardUpCnt = this.adminDAO.updateCommunityGallaryUpProc(communityDTO);

			return boardUpCnt;
		}
		
		@Override
		public int deleteCommunityGallaryDelProc(CommunityDTO communityDTO) {

			int boardCnt = this.adminDAO.getCommunityGallaryBoardCnt(communityDTO.getB_no());
			if (boardCnt == 0) {
				return boardCnt;
			}
			int boardDelCnt = this.adminDAO.deleteCommunityGallaryDelProc(communityDTO);

			return boardDelCnt;
		}
		
		//-All----------------------------------------------------------------------------------------------
	   /*** 장터 sale, free_sharing 테이블 리스트 총 개수 가져오기  ***/
	   @Override
	   public int getTabAllMarketplaceBoardListAllCnt() {
	      return adminDAO.getTabAllMarketplaceBoardListAllCnt();
	   }
	   
	   /*** 장터 sale, free_sharing 테이블 리스트 개수 가져오기 ***/
	   @Override
	   public int getTabAllMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO) {
	      return adminDAO.getTabAllMarketplaceBoardListCnt(communitySearchDTO);
	   }
	   
	   /*** 장터 sale, free_sharing 테이블 리스트 가져오기 ***/
	   @Override
	   public List<CommunityDTO> getTabAllMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO) {
	      return adminDAO.getTabAllMarketplaceBoardList(communitySearchDTO);
	   }
	   
	   //-Sale----------------------------------------------------------------------------------------------
	   /*** 장터 sale 테이블 리스트 총 개수 가져오기  ***/
	   @Override
	   public int getTabSaleMarketplaceBoardListAllCnt() {
	      return adminDAO.getTabSaleMarketplaceBoardListAllCnt();
	   }
	   
	   /*** 장터 sale 테이블 리스트 개수 가져오기  ***/
	   @Override
	   public int getTabSaleMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO) {
	      return adminDAO.getTabSaleMarketplaceBoardListCnt(communitySearchDTO);
	   }
		
	   /*** 장터 sale 테이블 리스트 가져오기 ***/
	   @Override
	   public List<CommunityDTO> getTabSaleMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO) {
	      return adminDAO.getTabSaleMarketplaceBoardList(communitySearchDTO);
	   }
		
	 //FreeSharing-----------------------------------------------------------------------------------------------
	   /*** 장터 Free_Sharing 테이블 리스트 총 개수 가져오기  ***/
	   @Override
	   public int getTabFreeSharingMarketplaceBoardListAllCnt() {
	      return adminDAO.getTabFreeSharingMarketplaceBoardListAllCnt();
	   }
	   
	   /*** 장터 Free_Sharing 테이블 리스트 개수 가져오기  ***/
	   @Override
	   public int getTabFreeSharingMarketplaceBoardListCnt(AdminCommunitySearchDTO communitySearchDTO) {
	      return adminDAO.getTabFreeSharingMarketplaceBoardListCnt(communitySearchDTO);
	   }
	   
	   /*** 장터 Free_Sharing 테이블 리스트 가져오기 ***/
	   @Override
	   public List<CommunityDTO> getTabFreeSharingMarketplaceBoardList(AdminCommunitySearchDTO communitySearchDTO) {
	      return adminDAO.getTabFreeSharingMarketplaceBoardList(communitySearchDTO);
	   }
	      
	   // -----------------------------------
	  // 장터
	  // -----------------------------------
	  /*** 장터 Sale 등록  ***/
	  @Override
	  public int insertMarketplaceSaleCommunity(CommunityDTO communityDTO) {
	     int boardRegCnt = this.adminDAO.insertMarketplaceSaleCommunity(communityDTO);
	     return boardRegCnt;
	  }
	  
	  /*** 장터 FreeSharing 등록  ***/
	  @Override
	  public int insertMarketplaceFreeSharingCommunity(CommunityDTO communityDTO) {
	     int boardRegCnt = this.adminDAO.insertMarketplaceFreeSharingCommunity(communityDTO);
	     return boardRegCnt;
	  }
	  
		/*** 장터 Free_Sharing 테이블 조회수 디테일 가져오기 ***/
		@Override
		public CommunityDTO getCommunityMarketplaceSaleDetailForm(int b_no, boolean isReadCount) {

			if (isReadCount) {
				this.adminDAO.updateMarketplaceSaleBoardReadCount(b_no);
			}
			CommunityDTO communityDTO = this.adminDAO.getCommunityMarketplaceSaleDetailForm(b_no);

			return communityDTO;

		}
	  
		/*** 장터 Free_Sharing 테이블 조회수 디테일 가져오기 ***/
		@Override
		public CommunityDTO getCommunityMarketplaceFreeSharingDetailForm(int b_no, boolean isReadCount) {

			if (isReadCount) {
				this.adminDAO.updateMarketplaceFreeSharingBoardReadCount(b_no);
			}
			CommunityDTO communityDTO = this.adminDAO.getCommunityMarketplaceFreeSharingDetailForm(b_no);

			return communityDTO;

		}
	  
		@Override
		public int updateMarketplaceSaleBoard(CommunityDTO communityDTO) {

			int boardCnt = this.adminDAO.getMarketplaceSaleBoardCnt(communityDTO.getB_no());
			if (boardCnt == 0) {
				return boardCnt;
			}
			int boardUpCnt = this.adminDAO.updateMarketplaceSaleBoard(communityDTO);

			return boardUpCnt;
		}
		
		@Override
		public int updateMarketplaceFreeSharingBoard(CommunityDTO communityDTO) {

			int boardCnt = this.adminDAO.getMarketplaceFreeSharingBoardCnt(communityDTO.getB_no());
			if (boardCnt == 0) {
				return boardCnt;
			}
			int boardUpCnt = this.adminDAO.updateMarketplaceFreeSharingBoard(communityDTO);

			return boardUpCnt;
		}
		
		@Override
		public int deleteMarketplaceSaleBoard(CommunityDTO communityDTO) {

			int boardCnt = this.adminDAO.getMarketplaceSaleBoardCnt(communityDTO.getB_no());
			if (boardCnt == 0) {
				return boardCnt;
			}
			int boardDelCnt = this.adminDAO.deleteMarketplaceSaleBoard(communityDTO);

			return boardDelCnt;
		}
		
		@Override
		public int deleteMarketplaceFreeSharingBoard(CommunityDTO communityDTO) {

			int boardCnt = this.adminDAO.getMarketplaceFreeSharingBoardCnt(communityDTO.getB_no());
			if (boardCnt == 0) {
				return boardCnt;
			}
			int boardDelCnt = this.adminDAO.deleteMarketplaceFreeSharingBoard(communityDTO);

			return boardDelCnt;
		}
		
		//자유 게시판-------------------------------------------------------------------------------------------------
		public int getFreeBoardAllCnt() {
		      // --------------------------------------
		      // BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
		      // 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
		      // --------------------------------------
		      int freeBoardListAllCnt = this.adminDAO.getFreeBoardAllCnt();
		      // --------------------------------------
		      // 변수 boardListAllCnt 안의 데이터를 리턴하기
		      // --------------------------------------
		      return freeBoardListAllCnt;
		   }
		
		 @Override
		   public int getFreeBoardListCnt(AdminCommunitySearchDTO communitySearchDTO) {

		      int freeBoardListCount = this.adminDAO.getFreeBoardListCnt(communitySearchDTO);

		      return freeBoardListCount;

		   }
		
		 @Override
		   public List<CommunityDTO> getFreeBoardList(AdminCommunitySearchDTO communitySearchDTO) {

		      List<CommunityDTO> freeBoardList = this.adminDAO.getFreeBoardList(communitySearchDTO);

		      return freeBoardList;

		   }
		
		 @Override
		   public int insertCommunityFreeBoard(CommunityDTO communityDTO) {
		      
		      int boardRegCount = adminDAO.insertCommunityFreeBoard(communityDTO);
		      
		      return boardRegCount;
		      
		   }
		
		 @Override
		   public int updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO) {
		      
		      return adminDAO.updateFreeBoardDetailReadCountPlusOne(detailDTO);
		      
		   }
		
		 @Override
		   public CommunityFreeBoardDetailDTO getFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO) {
		   
		      CommunityFreeBoardDetailDTO freeBoardDetail = adminDAO.getFreeBoardDetail(detailDTO);
		      
		      return freeBoardDetail;
		      
		   }
		
		 @Override
		   public int getFreeBoardDetailCommentPageListCount(CommunityFreeBoardDetailDTO detailDTO) {

		      int freeBoardDetailCommentPageListCount = adminDAO.getFreeBoardDetailCommentPageListCount(detailDTO);

		      return freeBoardDetailCommentPageListCount;

		   }
		 
		 @Override
		   public List<CommunityFreeBoardDetailDTO> getFreeBoardDetailCommentPageList(CommunityFreeBoardDetailDTO detailDTO) {
		      
		      List<CommunityFreeBoardDetailDTO> freeBoardDetailCommentPageList = adminDAO.getFreeBoardDetailCommentPageList(detailDTO);

		      return freeBoardDetailCommentPageList;
		      
		   }
		 
		 @Override
		   public int insertFreeBoardDetailComment(CommunityFreeBoardDetailDTO detailDTO) {

		      int insertFreeBoardDetailCommentCount = adminDAO.insertFreeBoardDetailComment(detailDTO);

		      return insertFreeBoardDetailCommentCount;

		   }
		 
		 @Override
		   public int insertFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO) {

			 adminDAO.updateFreeBoardDetailCommentToComment(detailDTO);
		      
		      int insertFreeBoardDetailCommentToCommentCount = adminDAO.insertFreeBoardDetailCommentToComment(detailDTO);

		      return insertFreeBoardDetailCommentToCommentCount;

		   }
		 
		 public CommunityDTO getFreeBoard(int b_no) {

		      CommunityDTO communityDTO = this.adminDAO.getFreeBoard(b_no);

		      return communityDTO;

		   }
		 
		 public int updateCommunityFreeBoard(CommunityDTO communityDTO) {
		      
		      int boardCount = adminDAO.getCommunityFreeBoardCount(communityDTO.getB_no());
		      
		      if (boardCount == 0) {
		         return boardCount;
		      }
		      
		      int boardUpdateCount = adminDAO.updateCommunityFreeBoard(communityDTO);

		      return boardUpdateCount;
		   }
		 
		 @Override
		   public int deleteCommunityFreeBoard(CommunityDTO communityDTO) {

		      int b_no = communityDTO.getB_no();
		      int boardCount = adminDAO.getCommunityFreeBoardCount(b_no);
		      
		      if (boardCount == 0) {
		         return boardCount;
		      }
		      
		      int commentCount = adminDAO.getFreeBoardCommentCount(b_no);
		      
		      if (commentCount > 0) {
		         return -1;
		      }

		      int boardDeleteCount = adminDAO.deleteCommunityFreeBoard(communityDTO);

		      return boardDeleteCount;
		      
		   }

		 @Override
		 public int adminCommunityFreeBoardDetailCommentOfCommentUpdateProc(CommunityFreeBoardDetailDTO detailDTO) {
			 return adminDAO.adminCommunityFreeBoardDetailCommentOfCommentUpdateProc(detailDTO);
		 }	

		 @Override
		 public int adminCommunityFreeBoardDetailCommentOfCommentDeleteProc(CommunityFreeBoardDetailDTO detailDTO) {
			 return adminDAO.adminCommunityFreeBoardDetailCommentOfCommentDeleteProc(detailDTO);
		 }


	

		

		






		
		
	
	
	

}
