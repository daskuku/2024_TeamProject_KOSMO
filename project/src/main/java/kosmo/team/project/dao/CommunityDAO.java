package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.CommunitySearchDTO;

@Mapper
public interface CommunityDAO {
   // ----------------------------------------
   // 공지사항
   // ----------------------------------------
   public List<CommunityDTO> getNoticeBoardList(CommunitySearchDTO communitySearchDTO);

   public int getNoticeBoardListCnt(CommunitySearchDTO communitySearchDTO);

   public int getNoticeBoardAllCnt();

   CommunityDTO getNoticeBoard(int b_no);

   int updateNoticeBoardReadCount(int b_no);

   // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // [1개 공지사항] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
   // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   int updateNoticeBoard(CommunityDTO communityDTO);

   // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   // [1개 공지사항] 삭제 실행하고 삭제 적용행의 개수를 리턴하는 메소드 선언
   // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
   int deleteNoticeBoard(CommunityDTO communityDTO);

   int getNoticeBoardCnt(int b_no);
   

   

   
   //----------------------------------------
   // 자유게시판
   //----------------------------------------

   public List<CommunityDTO> getFreeBoardList(CommunitySearchDTO communitySearchDTO);

   public int getFreeBoardListCnt(CommunitySearchDTO communitySearchDTO);

   public int getFreeBoardAllCnt();

   public CommunityDTO getFreeBoard(int b_no);
   
   public int getCommunityFreeBoardCount(int b_no);
   
   public int updateCommunityFreeBoard(CommunityDTO communityDTO);
   
   public int deleteCommunityFreeBoard(CommunityDTO communityDTO);

   public int insertCommunityFreeBoard(CommunityDTO communityDTO);
   
   public CommunityFreeBoardDetailDTO getFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO);

   public int getFreeBoardDetailCommentPageListCount(CommunityFreeBoardDetailDTO detailDTO);
   
   public List<CommunityFreeBoardDetailDTO> getFreeBoardDetailCommentPageList(CommunityFreeBoardDetailDTO detailDTO);
   
   public int insertFreeBoardDetailComment(CommunityFreeBoardDetailDTO detailDTO);
   
   public int updateFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
   
   public int insertFreeBoardDetailCommentToComment(CommunityFreeBoardDetailDTO detailDTO);
   
   public int updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO);
   
   public int getFreeBoardCommentCount(int b_no);
   
   public int communityFreeBoardDetailCommentOfCommentUpdateProc(CommunityFreeBoardDetailDTO detailDTO);
   
   public int communityFreeBoardDetailCommentOfCommentDeleteProc(CommunityFreeBoardDetailDTO detailDTO);
   
   
   
   //----------------------------------------
   //갤러리
   //----------------------------------------
   
   public int insertGallaryCommunity(CommunityDTO communityDTO);
   
   public int getImageGallaryBoardListCnt(CommunityDTO communityDTO);

   public List<CommunityDTO> getImageGallaryBoardList(CommunityDTO communityDTO);

   public int getCommunityGallaryBoardListAllCnt();

   public int getCommunityGallaryBoardListCnt(CommunitySearchDTO communitySearchDTO);

   public List<CommunityDTO> getCommunityGallaryBoardList(CommunitySearchDTO communitySearchDTO);
   
   public int insertCommunityGallaryProc(CommunityDTO communityDTO);
   
   public int updateCommunityGallaryReadCount(int b_no);
   
   public CommunityDTO getCommunityGallaryDetailForm(int b_no);
   
   public int getCommunityGallaryBoardCnt(int b_no);
   
   public int updateCommunityGallaryUpProc(CommunityDTO communityDTO);
   
   public int deleteCommunityGallaryDelProc(CommunityDTO communityDTO);
   
   
   
   
   
   
   
   //----------------------------------------
   //장터
   //----------------------------------------
   
   /*** 장터 Sale 등록  ***/
   public int insertMarketplaceSaleCommunity(CommunityDTO communityDTO);
   
   /*** 장터 FreeSharing 등록  ***/
   public int insertMarketplaceFreeSharingCommunity(CommunityDTO communityDTO);
   
   /*** 장터 리스트 개수 가져오기  ***/
   public int getImageBoardListCnt(CommunityDTO communityDTO);

   /*** 장터 리스트 가져오기  ***/
   public List<CommunityDTO> getImageMarketBoardList(CommunityDTO communityDTO);
   
   //--All
   /*** 장터 sale, free_sharing 테이블 리스트 총 개수 가져오기  ***/
   public int getTabAllMarketplaceBoardListAllCnt();
   
   /*** 장터 sale, free_sharing 테이블 리스트 개수 가져오기 ***/
   public int getTabAllMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO);
   
   /*** 장터 sale, free_sharing 테이블 리스트 가져오기 ***/
   public List<CommunityDTO> getTabAllMarketplaceBoardList(CommunitySearchDTO communitySearchDTO);
   
   //--Sale
   /*** 장터 sale 테이블 리스트 총 개수 가져오기  ***/
   public int getTabSaleMarketplaceBoardListAllCnt(); 
   
   /*** 장터 sale 테이블 리스트 개수 가져오기  ***/
   public int getTabSaleMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO);
   
   /*** 장터 sale 테이블 리스트 가져오기 ***/
   public List<CommunityDTO> getTabSaleMarketplaceBoardList(CommunitySearchDTO communitySearchDTO); 
   
   //--FreeSharing
   /*** 장터 Free_Sharing 테이블 리스트 총 개수 가져오기  ***/
   public int getTabFreeSharingMarketplaceBoardListAllCnt(); 
   
   /*** 장터 Free_Sharing 테이블 리스트 개수 가져오기  ***/
   public int getTabFreeSharingMarketplaceBoardListCnt(CommunitySearchDTO communitySearchDTO);
   
   /*** 장터 Free_Sharing 테이블 리스트 가져오기 ***/
   public List<CommunityDTO> getTabFreeSharingMarketplaceBoardList(CommunitySearchDTO communitySearchDTO);

   public CommunityDTO getCommunityMarketplaceSaleDetailForm(int b_no);

   public CommunityDTO getCommunityMarketplaceFreeSharingDetailForm(int b_no);
   
   public int updateMarketplaceBoard(CommunityDTO communityDTO);
   
   public int getMarketplaceSaleBoardCnt(int b_no);
   
   public int updateMarketplaceSaleBoard(CommunityDTO communityDTO);
   
   public int getMarketplaceFreeSharingBoardCnt(int b_no);
   
   public int updateMarketplaceFreeSharingBoard(CommunityDTO communityDTO);
   
   public int deleteMarketplaceSaleBoard(CommunityDTO communityDTO);
   
   public int deleteMarketplaceFreeSharingBoard(CommunityDTO communityDTO);
   
   public int updateMarketplaceSaleBoardReadCount(int b_no);
   
   public int updateMarketplaceFreeSharingBoardReadCount(int b_no);

}