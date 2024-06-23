package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.CommunityFreeBoardDetailDTO;
import kosmo.team.project.dto.CommunitySearchDTO;
import kosmo.team.project.service.CommunityService;
import kosmo.team.project.utility.Page;

@Controller
public class CommunityController {

   @Autowired
   private CommunityService communityService;

   // ----------------------------------------------------------------
   // 공지사항
   // ----------------------------------------------------------------
   /***공지사항 페이지 ***/
   @RequestMapping(value = "/communityNoticeBoardForm.do")

   public ModelAndView communityNoticeBoard(CommunitySearchDTO communitySearchDTO) {

      int noticeBoardListAllCnt = this.communityService.getNoticeBoardAllCnt();

      int noticeBoardListCnt = this.communityService.getNoticeBoardListCnt(communitySearchDTO);

      Map<String, Integer> noticeBoardMap = Page.getPagingMap(

            communitySearchDTO.getSelectPageNo()	// 선택한 페이지 번호
            , communitySearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
            , noticeBoardListCnt					// 검색 결과물 개수

      );

      communitySearchDTO.setSelectPageNo((int) noticeBoardMap.get("selectPageNo"));
      communitySearchDTO.setRowCntPerPage((int) noticeBoardMap.get("rowCntPerPage"));
      communitySearchDTO.setBegin_rowNo((int) noticeBoardMap.get("begin_rowNo"));
      communitySearchDTO.setEnd_rowNo((int) noticeBoardMap.get("end_rowNo"));

      List<CommunityDTO> noticeBoardList = this.communityService.getNoticeBoardList(communitySearchDTO);

      ModelAndView mav = new ModelAndView();

      mav.addObject("noticeBoardList", noticeBoardList);

      mav.addObject("noticeBoardListCnt", noticeBoardListCnt);

      mav.addObject("noticeBoardListAllCnt", noticeBoardListAllCnt);

      mav.addObject("noticeBoardMap", noticeBoardMap);

      mav.setViewName("/community/communityNoticeBoardForm.jsp");

      return mav;
   }

   /*** 공지사항 상세보기 ***/
   @RequestMapping(value = "/noticeboardDetailForm.do")
   public ModelAndView noticeboardDetailForm(@RequestParam(value = "b_no") int b_no) {

      CommunityDTO communityDTO = this.communityService.getNoticeBoard(b_no);

      ModelAndView mav = new ModelAndView();

      mav.addObject("communityDTO", communityDTO);

      mav.setViewName("/community/noticeboardDetailForm.jsp");

      return mav;
   }

   /*** 공지사항 수정, 삭제 페이지 ***/
   @RequestMapping(value = "/noticeboardUpDelForm.do")
   public ModelAndView noticeboardUpDelForm(@RequestParam(value = "b_no") int b_no) {

      CommunityDTO communityDTO = this.communityService.getNoticeBoardForUpDel(b_no);

      ModelAndView mav = new ModelAndView();

      mav.addObject("communityDTO", communityDTO);

      mav.setViewName("/community/noticeboardUpDelForm.jsp");

      return mav;
   }
   
   /*** 공지사항 업데이트 ***/
   @ResponseBody
   @RequestMapping(value = "/noticeboardUpProc.do"

         , method = RequestMethod.POST

         , produces = "application/json;charset=UTF-8")   
   public Map<String, String> noticeboardUpProc(CommunityDTO communityDTO) {

      // ------------------------------------------------
      // 게시판 수정 결과물을 저장할 HashMap 객체 생성하기.
      // ------------------------------------------------
      Map<String, String> resultMap = new HashMap<String, String>();

      // -------------------------------------------
      // [BoardServiceImpl 객체]의 updateBoard 메소드 호출로
      // 게시판 글 수정하고 [수정 적용행의 개수] 얻기
      // -------------------------------------------
      int noticeboardUpCnt = this.communityService.updateNoticeBoard(communityDTO);

      // -------------------------------------------
      // HashMap 객체에 게시판 수정 행의 개수 저장하기
      // -------------------------------------------
      resultMap.put("result", noticeboardUpCnt + "");

      // -------------------------------------------
      // HashMap 객체의 메위주 리턴하기
      // -------------------------------------------
      return resultMap;
   }
   
   /*** 공지사항 삭제 ***/
   @ResponseBody
   @RequestMapping(value = "/noticeboardDelProc.do"

         , method = RequestMethod.POST

         , produces = "application/json;charset=UTF-8")   
   public Map<String, String> noticeboardDelProc(CommunityDTO communityDTO) {
      
      Map<String, String> resultMap = new HashMap<String, String>();

      int boardDelCnt = this.communityService.deleteNoticeBoard(communityDTO);

      resultMap.put("result", boardDelCnt + "");

      return resultMap;
   }
   
   
   
   
   
   // ----------------------------------------------------------------
   // 자유게시판
   // ----------------------------------------------------------------
   /*** 자유게시판 페이지 ***/
   @RequestMapping(value = "/communityFreeBoardForm.do")
   public ModelAndView communityFreeBoard(CommunitySearchDTO communitySearchDTO) {

      int freeBoardListAllCnt = this.communityService.getFreeBoardAllCnt();

      int freeBoardListCnt = this.communityService.getFreeBoardListCnt(communitySearchDTO);

      Map<String, Integer> freeBoardMap = Page.getPagingMap(

            communitySearchDTO.getSelectPageNo()// 선택한 페이지 번호
            , communitySearchDTO.getRowCntPerPage() // 페이지 당 보여줄 검색 행의 개수
            , freeBoardListCnt // 검색 결과물 개수

      );

      communitySearchDTO.setSelectPageNo((int) freeBoardMap.get("selectPageNo"));
      communitySearchDTO.setRowCntPerPage((int) freeBoardMap.get("rowCntPerPage"));
      communitySearchDTO.setBegin_rowNo((int) freeBoardMap.get("begin_rowNo"));
      communitySearchDTO.setEnd_rowNo((int) freeBoardMap.get("end_rowNo"));

      List<CommunityDTO> freeBoardList = this.communityService.getFreeBoardList(communitySearchDTO);

      ModelAndView mav = new ModelAndView();

      mav.addObject("freeBoardList", freeBoardList);

      mav.addObject("freeBoardListCnt", freeBoardListCnt);

      mav.addObject("freeBoardListAllCnt", freeBoardListAllCnt);

      mav.addObject("freeBoardMap", freeBoardMap);

      mav.setViewName("/community/communityFreeBoardForm.jsp");

      return mav;
   }
   
   /*** 자유게시판 조회수 올리는것 ***/
   @RequestMapping(value = "/updateFreeBoardDetailReadCountPlusOne.do")
   public ModelAndView updateFreeBoardDetailReadCountPlusOne(CommunityFreeBoardDetailDTO detailDTO) {
      
      communityService.updateFreeBoardDetailReadCountPlusOne(detailDTO);

      return communityFreeBoardDetail(detailDTO);
   }
   
   /*** 자유게시판 새글쓰기 ***/
   @RequestMapping(value = "/newCommunityFreeBoardForm.do")
   public ModelAndView newCommunityFreeBoardForm(CommunityDTO communityDTO) {

      ModelAndView mav = new ModelAndView();

      mav.setViewName("/community/newCommunityFreeBoardForm.jsp");

      return mav;
   }
   
   /*** 자유게시판 상세보기 ***/
   @RequestMapping(value = "/communityFreeBoardDetail.do")
   public ModelAndView communityFreeBoardDetail(CommunityFreeBoardDetailDTO detailDTO) {
      
      CommunityFreeBoardDetailDTO freeBoardDetail = communityService.getFreeBoardDetail(detailDTO);
      
      int commentListCount = communityService.getFreeBoardDetailCommentPageListCount(detailDTO);
      
      Map<String, Integer> pageMap = Page.getPagingMap(
               detailDTO.getSelectPageNo()
            ,   detailDTO.getRowCntPerPage()
            ,   commentListCount
      );

      detailDTO.setSelectPageNo((int) pageMap.get("selectPageNo"));
      detailDTO.setRowCntPerPage((int) pageMap.get("rowCntPerPage"));
      detailDTO.setBegin_rowNo((int) pageMap.get("begin_rowNo"));
      detailDTO.setEnd_rowNo((int) pageMap.get("end_rowNo"));
      
      List<CommunityFreeBoardDetailDTO> freeBoardDetailCommentPageList = communityService.getFreeBoardDetailCommentPageList(detailDTO);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("commentListCount", commentListCount);
      mav.addObject("pageMap", pageMap);
      mav.addObject("detailDTO", detailDTO);
      mav.addObject("freeBoardDetail", freeBoardDetail);
      mav.addObject("freeBoardDetailCommentList", freeBoardDetailCommentPageList);
      mav.addObject("freeBoardDetailCommentListSize", freeBoardDetailCommentPageList.size());

      mav.setViewName("/community/communityFreeBoardDetailForm.jsp");      
      
      return mav;
   }
   
   /*** 자유게시판 댓글 추가, 자유게시판 상세보기 ***/
   @RequestMapping(value = "/communityFreeBoardDetailCommentList.do")
   public ModelAndView communityFreeBoardDetailCommentList(CommunityFreeBoardDetailDTO detailDTO) {
      
      communityService.insertFreeBoardDetailComment(detailDTO);
      
      return communityFreeBoardDetail(detailDTO);
   }
   
   /*** 자유게시판 수정 삭제 페이지 ***/
   @RequestMapping(value = "/communityFreeBoardUpDelForm.do")
   public ModelAndView communityFreeBoardUpDelForm(CommunityFreeBoardDetailDTO detailDTO) {

      CommunityDTO communityDTO = communityService.getFreeBoard(detailDTO.getB_no());

      ModelAndView mav = new ModelAndView();
      mav.addObject("communityDTO", communityDTO);
      mav.setViewName("/community/communityFreeBoardUpDelForm.jsp");

      return mav;      
   }
   
   /*** 자유게시판 상세보기, 업데이트 ***/
   @ResponseBody
   @RequestMapping(value = "/communityFreeBoardUpdateProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")   
   public Map<String, String> communityFreeBoardUpdateProc(CommunityDTO communityDTO) {

      int updateCount = communityService.updateCommunityFreeBoard(communityDTO);

      Map<String, String> resultMap = new HashMap<String, String>();
      resultMap.put("result", updateCount + "");

      return resultMap;      
   }
   
   /*** 자유게시판 상세보기, 삭제 ***/
   @ResponseBody
   @RequestMapping(value = "/communityFreeBoardDelProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")   
   public Map<String, String> communityFreeBoardDelProc(CommunityDTO communityDTO) {
      
      int boardDeleteCount = communityService.deleteCommunityFreeBoard(communityDTO);

      Map<String, String> resultMap = new HashMap<String, String>();
      resultMap.put("result", boardDeleteCount + "");

      return resultMap;      
   }
   
   /*** 자유게시판 글 등록 ***/
   @ResponseBody
   @RequestMapping(value = "/communityFreeBoardRegProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   public Map<String, String> communityFreeBoardRegProc(CommunityDTO communityDTO) {
      
      int result = communityService.insertCommunityFreeBoard(communityDTO);
      
      Map<String, String> resultMap = new HashMap<String, String>();
      resultMap.put("result", result + "");
      
      return resultMap;
   }
   
   /*** 자유게시판 대댓글 입력, 자유게시판 상세보기 ***/
   @RequestMapping(value = "/communityFreeBoardDetailCommentOfCommentInsertProc.do")
   public ModelAndView communityFreeBoardDetailCommentOfCommentInsertProc(CommunityFreeBoardDetailDTO detailDTO) {
      
      communityService.insertFreeBoardDetailCommentToComment(detailDTO);

      return communityFreeBoardDetail(detailDTO);
   }
   
   /*** 자유게시판 대댓글 수정, 자유게시판 상세보기 ***/
   @RequestMapping(value = "/communityFreeBoardDetailCommentOfCommentUpdateProc.do")
   public ModelAndView communityFreeBoardDetailCommentOfCommentUpdateProc(CommunityFreeBoardDetailDTO detailDTO) {
      
      communityService.communityFreeBoardDetailCommentOfCommentUpdateProc(detailDTO);

      return communityFreeBoardDetail(detailDTO);
   }
   
   /*** 자유게시판 대댓글 삭제, 자유게시판 상세보기 ***/
   @RequestMapping(value = "/communityFreeBoardDetailCommentOfCommentDeleteProc.do")
   public ModelAndView communityFreeBoardDetailCommentOfCommentDeleteProc(CommunityFreeBoardDetailDTO detailDTO) {
      
      communityService.communityFreeBoardDetailCommentOfCommentDeleteProc(detailDTO);

      return communityFreeBoardDetail(detailDTO);
   }
   
   
   
   
   
	// ----------------------------------------------------------------
	// 갤러리 리스트
	// ----------------------------------------------------------------
	/*** 갤러리 페이지 ***/
	@RequestMapping(value = "/communityGallaryForm.do")
	public ModelAndView communityGallaryForm(CommunitySearchDTO communitySearchDTO) {

		// IMAGEBOARD TABLE 에서 WRITER 컬럼 VARCHAR2 -> NUMBER 바꿔야 하는데 커뮤니티 말고 다른 곳에서도 이테이블 사용하여 컬럼 NUMBER로 변경 보류(갤러리 테이블도 없다)
		// 로그인 하여 닉네임으로 보여주는 것도 작업할 수 없어 '이미지보드 테이블' as "WRITER" 하여 채웠다.
		
		int communityGallaryBoardListAllCnt = communityService.getCommunityGallaryBoardListAllCnt();
		int communityGallaryBoardListCnt = communityService.getCommunityGallaryBoardListCnt(communitySearchDTO);

		Map<String, Integer> communityGallaryBoardPageMap = Page.getPagingMap(
					communitySearchDTO.getSelectPageNo() // 선택한 페이지 번호
				, 8 									// 페이지 당 보여줄 검색 행의 개수
				, communityGallaryBoardListCnt 			// 검색 결과물 개수
		);

		communitySearchDTO.setSelectPageNo((int) communityGallaryBoardPageMap.get("selectPageNo"));
		communitySearchDTO.setRowCntPerPage((int) communityGallaryBoardPageMap.get("rowCntPerPage"));
		communitySearchDTO.setBegin_rowNo((int) communityGallaryBoardPageMap.get("begin_rowNo"));
		communitySearchDTO.setEnd_rowNo((int) communityGallaryBoardPageMap.get("end_rowNo"));

		List<CommunityDTO> communityGallaryBoardList = communityService.getCommunityGallaryBoardList(communitySearchDTO);

		ModelAndView mav = new ModelAndView();
		mav.addObject("communityGallaryBoardList", communityGallaryBoardList);
		mav.addObject("communityGallaryBoardListSize", communityGallaryBoardList.size());
		mav.addObject("communityGallaryBoardListCnt", communityGallaryBoardListCnt);
		mav.addObject("communityGallaryBoardListAllCnt", communityGallaryBoardListAllCnt);
		mav.addObject("communityGallaryBoardPageMap", communityGallaryBoardPageMap);
		
		mav.setViewName("/community/communityGallaryForm.jsp");

		return mav;
	}

   /*** 갤러리 등록 페이지 ***/
   @RequestMapping(value = "/newCommunityGallaryForm.do")
   public ModelAndView newCommunityGallaryForm(CommunityDTO communityDTO) {

      ModelAndView mav = new ModelAndView();

      mav.setViewName("/community/newCommunityGallaryForm.jsp");

      return mav;
   }
   
   /*** 갤러리 새글쓰기 ***/
   @ResponseBody
   @RequestMapping(value = "/communityGallaryProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   public Map<String, String> communityGallaryProc(CommunityDTO communityDTO) {
      
      int result = communityService.insertCommunityGallaryProc(communityDTO);
      
      Map<String, String> resultMap = new HashMap<String, String>();
      resultMap.put("result", result + "");
      
      return resultMap;
   }
   
   /*** 갤러리 상세보기 ***/
   @RequestMapping(value = "/communityGallaryDetailForm.do")
   public ModelAndView communityGallaryDetailForm(@RequestParam(value = "b_no") int b_no) {

	   ModelAndView mav = new ModelAndView();
      
	   CommunityDTO dto = this.communityService.getCommunityGallaryDetailForm(b_no, true);
	   
	   mav.addObject("communityDTO", dto);      

	   mav.setViewName("/community/communityGallaryDetailForm.jsp");

	   return mav;
   }
   
   /*** 갤러리 업데이트/삭제 보기 ***/
   @RequestMapping(value = "/communityGallaryUpDelForm.do")
   public ModelAndView communityGallaryUpDelForm(@RequestParam(value = "b_no") int b_no) {

	   ModelAndView mav = new ModelAndView();
      
	   CommunityDTO dto = this.communityService.getCommunityGallaryDetailForm(b_no, false);
	   
	   mav.addObject("communityDTO", dto); 

	   mav.setViewName("/community/communityGallaryUpDelForm.jsp");

	   return mav;
   }
   
	/*** 갤러리 업데이트 처리 ***/
	@ResponseBody
	@RequestMapping(value = "/communityGallaryUpProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, String> communityGallaryUpProc(CommunityDTO communityDTO) {

		int marketplaceboardUpCnt = this.communityService.updateCommunityGallaryUpProc(communityDTO);
		
		Map<String, String> resultMap = new HashMap<String, String>();

		resultMap.put("result", marketplaceboardUpCnt + "");
		
		return resultMap;
	}
	
	/*** 갤러리 삭제 처리 ***/
	@ResponseBody
	@RequestMapping(value = "/communityGallaryDelProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, String> communityGallaryDelProc(CommunityDTO communityDTO) {

		int marketplaceboardDelCnt = this.communityService.deleteCommunityGallaryDelProc(communityDTO);
		
		Map<String, String> resultMap = new HashMap<String, String>();

		resultMap.put("result", marketplaceboardDelCnt + "");

		return resultMap;
	}
	
	
	

   
   
   
   
   
   
   // ----------------------------------------------------------------
   // 장터
   // ----------------------------------------------------------------
   /*** 장터 페이지 ***/
   
   @RequestMapping(value = "/communityMarketplaceBoardForm.do")
   public ModelAndView communityMarketplaceBoardForm(CommunitySearchDTO communitySearchDTO) {
      
      ModelAndView mav = new ModelAndView();
      
      // All-------------------------------------------------------------------------------
      int tabAllMarketplaceBoardListAllCnt = communityService.getTabAllMarketplaceBoardListAllCnt();
      int tabAllMarketplaceBoardListCnt = communityService.getTabAllMarketplaceBoardListCnt(communitySearchDTO);
      
      Map<String, Integer> tabAllMarketplaceBoardPageMap = Page.getPagingMap(
              communitySearchDTO.getSelectPageNo()   // 선택한 페이지 번호
            , 8                            			 // 페이지 당 보여줄 검색 행의 개수
            , tabAllMarketplaceBoardListCnt       	 // 검색 결과물 개수
      );
      
      communitySearchDTO.setSelectPageNo((int) tabAllMarketplaceBoardPageMap.get("selectPageNo"));
      communitySearchDTO.setRowCntPerPage((int) tabAllMarketplaceBoardPageMap.get("rowCntPerPage"));
      communitySearchDTO.setBegin_rowNo((int) tabAllMarketplaceBoardPageMap.get("begin_rowNo"));
      communitySearchDTO.setEnd_rowNo((int) tabAllMarketplaceBoardPageMap.get("end_rowNo"));
      
      List<CommunityDTO> tabAllMarketplaceBoardList = communityService.getTabAllMarketplaceBoardList(communitySearchDTO);
      
      mav.addObject("tabAllMarketplaceBoardList", tabAllMarketplaceBoardList);
      mav.addObject("tabAllMarketplaceBoardListSize", tabAllMarketplaceBoardList.size());
      mav.addObject("tabAllMarketplaceBoardListCnt", tabAllMarketplaceBoardListCnt);
      mav.addObject("tabAllMarketplaceBoardListAllCnt", tabAllMarketplaceBoardListAllCnt);
      mav.addObject("tabAllMarketplaceBoardPageMap", tabAllMarketplaceBoardPageMap);
      
      // Sale-------------------------------------------------------------------------------
      int tabSaleMarketplaceBoardListAllCnt = communityService.getTabSaleMarketplaceBoardListAllCnt();
      int tabSaleMarketplaceBoardListCnt = communityService.getTabSaleMarketplaceBoardListCnt(communitySearchDTO);
      
      Map<String, Integer> tabSaleMarketplaceBoardPageMap = Page.getPagingMap(
              communitySearchDTO.getSelectPageNo()   // 선택한 페이지 번호
            , 8                            			 // 페이지 당 보여줄 검색 행의 개수
            , tabSaleMarketplaceBoardListCnt         // 검색 결과물 개수
      );
      
      communitySearchDTO.setSelectPageNo((int) tabSaleMarketplaceBoardPageMap.get("selectPageNo"));
      communitySearchDTO.setRowCntPerPage((int) tabSaleMarketplaceBoardPageMap.get("rowCntPerPage"));
      communitySearchDTO.setBegin_rowNo((int) tabSaleMarketplaceBoardPageMap.get("begin_rowNo"));
      communitySearchDTO.setEnd_rowNo((int) tabSaleMarketplaceBoardPageMap.get("end_rowNo"));
      
      List<CommunityDTO> tabSaleMarketplaceBoardList = communityService.getTabSaleMarketplaceBoardList(communitySearchDTO);
      
      mav.addObject("tabSaleMarketplaceBoardList", tabSaleMarketplaceBoardList);
      mav.addObject("tabSaleMarketplaceBoardListSize", tabSaleMarketplaceBoardList.size());
      mav.addObject("tabSaleMarketplaceBoardListCnt", tabSaleMarketplaceBoardListCnt);
      mav.addObject("tabSaleMarketplaceBoardListAllCnt", tabSaleMarketplaceBoardListAllCnt);
      mav.addObject("tabSaleMarketplaceBoardPageMap", tabSaleMarketplaceBoardPageMap);
      
      // -------------------------------------------------------------------------------
      
      // FreeSharing-------------------------------------------------------------------------------
      int tabFreeSharingMarketplaceBoardListAllCnt = communityService.getTabFreeSharingMarketplaceBoardListAllCnt();
      int tabFreeSharingMarketplaceBoardListCnt = communityService.getTabFreeSharingMarketplaceBoardListCnt(communitySearchDTO);
      
      Map<String, Integer> tabFreeSharingMarketplaceBoardPageMap = Page.getPagingMap(
              communitySearchDTO.getSelectPageNo()   // 선택한 페이지 번호
            , 8                             		 // 페이지 당 보여줄 검색 행의 개수
            , tabFreeSharingMarketplaceBoardListCnt  // 검색 결과물 개수
      );
      
      communitySearchDTO.setSelectPageNo((int) tabFreeSharingMarketplaceBoardPageMap.get("selectPageNo"));
      communitySearchDTO.setRowCntPerPage((int) tabFreeSharingMarketplaceBoardPageMap.get("rowCntPerPage"));
      communitySearchDTO.setBegin_rowNo((int) tabFreeSharingMarketplaceBoardPageMap.get("begin_rowNo"));
      communitySearchDTO.setEnd_rowNo((int) tabFreeSharingMarketplaceBoardPageMap.get("end_rowNo"));
      
      List<CommunityDTO> tabFreeSharingMarketplaceBoardList = communityService.getTabFreeSharingMarketplaceBoardList(communitySearchDTO);
      
      mav.addObject("tabFreeSharingMarketplaceBoardList", tabFreeSharingMarketplaceBoardList);
      mav.addObject("tabFreeSharingMarketplaceBoardListSize", tabFreeSharingMarketplaceBoardList.size());
      mav.addObject("tabFreeSharingMarketplaceBoardListCnt", tabFreeSharingMarketplaceBoardListCnt);
      mav.addObject("tabFreeSharingMarketplaceBoardListAllCnt", tabFreeSharingMarketplaceBoardListAllCnt);
      mav.addObject("tabFreeSharingMarketplaceBoardPageMap", tabFreeSharingMarketplaceBoardPageMap);
      
      mav.setViewName("/community/communityMarketplaceBoardForm.jsp");

      return mav;
   }

   @RequestMapping(value = "/communityMarketplaceDetailForm.do")
   public ModelAndView communityMarketplaceDetailForm(@RequestParam(value = "b_no") int b_no, @RequestParam(value = "table_name") String table_name) {

      ModelAndView mav = new ModelAndView();
      
      if (table_name.equals("sale")) {
         CommunityDTO sale = this.communityService.getCommunityMarketplaceSaleDetailForm(b_no, true);
         mav.addObject("communityDTO", sale);
      }
      else {
         CommunityDTO freeSharing = this.communityService.getCommunityMarketplaceFreeSharingDetailForm(b_no, true);
         mav.addObject("communityDTO", freeSharing);
      }

      mav.setViewName("/community/marketplaceDetailForm.jsp");

      return mav;
   }
   
   @RequestMapping(value = "/marketplaceboardUpDelForm.do")
   public ModelAndView marketplaceboardUpDelForm(@RequestParam(value = "b_no") int b_no, @RequestParam(value = "table_name") String table_name) {

      ModelAndView mav = new ModelAndView();
      
      if (table_name.equals("sale")) {
         CommunityDTO sale = this.communityService.getCommunityMarketplaceSaleDetailForm(b_no, false);
         mav.addObject("communityDTO", sale);
      }
      else {
         CommunityDTO freeSharing = this.communityService.getCommunityMarketplaceFreeSharingDetailForm(b_no, false);
         mav.addObject("communityDTO", freeSharing);
      }

      mav.setViewName("/community/marketplaceboardUpDelForm.jsp");

      return mav;
   }
   
   /*** 장터 Sale 등록 페이지(화면) ***/
   @RequestMapping(value = "/newCommunityMarketplaceSaleBoardForm.do")
   public ModelAndView newCommunityMarketplaceSaleBoardForm(CommunityDTO communityDTO) {

      ModelAndView mav = new ModelAndView();

      mav.setViewName("community/newCommunityMarketplaceSaleForm.jsp");

      return mav;
   }
   
   /*** 장터 Sale 새글쓰기 ***/
   @ResponseBody
   @RequestMapping(value = "/communityMarketplaceSaleBoardRegProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   public Map<String, String> communityMarketplaceSaleBoardRegProc(CommunityDTO communityDTO) {
      
      int result = communityService.insertMarketplaceSaleCommunity(communityDTO);
      
      Map<String, String> resultMap = new HashMap<String, String>();
      resultMap.put("result", result + "");
      
      return resultMap;
   }
   
   /*** 장터 FreeSharing 등록 페이지(화면) ***/
   @RequestMapping(value = "/newCommunityMarketplaceFreeSharingBoarForm.do")
   public ModelAndView newCommunityMarketplaceFreeSharingBoarForm(CommunityDTO communityDTO) {

      ModelAndView mav = new ModelAndView();

      mav.setViewName("/community/newCommunityMarketplaceFreeSharingForm.jsp");

      return mav;
   }
   
   /*** 장터 FreeSharing 새글쓰기 ***/
   @ResponseBody
   @RequestMapping(value = "/communityMarketplaceFreeSharingBoardRegProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   public Map<String, String> communityMarketplaceFreeSharingBoardRegProc(CommunityDTO communityDTO) {
      
      int result = communityService.insertMarketplaceFreeSharingCommunity(communityDTO);
      
      Map<String, String> resultMap = new HashMap<String, String>();
      resultMap.put("result", result + "");
      
      return resultMap;
   }

   
   /*** 장터 업데이트 ***/
	@ResponseBody
	@RequestMapping(value = "/marketplaceboardUpProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	
	public Map<String, String> marketplaceboardUpProc(CommunityDTO communityDTO) {

		int marketplaceboardUpCnt = 0;
		
		String table_name = communityDTO.getTable_name();
		
		if (table_name.equals("sale")) {
			marketplaceboardUpCnt = this.communityService.updateMarketplaceSaleBoard(communityDTO);
		} else {
			marketplaceboardUpCnt = this.communityService.updateMarketplaceFreeSharingBoard(communityDTO);
		}

		Map<String, String> resultMap = new HashMap<String, String>();

		resultMap.put("result", marketplaceboardUpCnt + "");
		
		return resultMap;
	}
	
	   /*** 장터 삭제 ***/
	   @ResponseBody
	   @RequestMapping(value = "/marketplaceBoardDelProc.do", method = RequestMethod.POST , produces = "application/json;charset=UTF-8")   
	   public Map<String, String> marketplaceBoardDelProc(CommunityDTO communityDTO) {
	      
		  int marketplaceboardDelCnt = 0; 
		  
		  String table_name = communityDTO.getTable_name();
		  
		  if (table_name.equals("sale")) {
				marketplaceboardDelCnt = this.communityService.deleteMarketplaceSaleBoard(communityDTO);
			} else {
				marketplaceboardDelCnt = this.communityService.deleteMarketplaceFreeSharingBoard(communityDTO);
			}
	      
	      Map<String, String> resultMap = new HashMap<String, String>();

	      resultMap.put("result", marketplaceboardDelCnt + "");

	      return resultMap;
	   }

}