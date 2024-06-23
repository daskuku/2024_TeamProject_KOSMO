package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.StadiumDAO;
import kosmo.team.project.dto.MyRentStaidumTimeDTO;
import kosmo.team.project.dto.MyYangdoStaidumTimeDTO;
import kosmo.team.project.dto.RentStadiumDTO;
import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;
import kosmo.team.project.dto.TimeDTO;
import kosmo.team.project.dto.YangdoDTO;
import kosmo.team.project.dto.YangdoSearchDTO;
import kosmo.team.project.dto.myRentStadiumDTO;

@Service
@Transactional
public class StadiumServiceImplements implements StadiumService {

	@Autowired
	private StadiumDAO stadiumDAO;

	@Override
	public int getStadiumListCnt(StadiumSearchDTO stadiumSearchDTO) {

		int stadiumListCnt = stadiumDAO.getStadiumListCnt(stadiumSearchDTO);

		return stadiumListCnt;

	}

	@Override
	public List<StadiumDTO> getStadiumList(StadiumSearchDTO stadiumSearchDTO) {

		List<StadiumDTO> stadiumList = stadiumDAO.getStadiumList(stadiumSearchDTO);

		return stadiumList;

	}

	public int getStadiumListAllCnt() {

		int StadiumListAllCnt = this.stadiumDAO.getStadiumListAllCnt();

		return StadiumListAllCnt;
	}

	public StadiumDTO getStadium(int stadium_no) {

		StadiumDTO stadiumDTO = this.stadiumDAO.getStadium(stadium_no);

		return stadiumDTO;

	}

	@Override
	public List<TimeDTO> getTime(int stadium_no) {

		List<TimeDTO> timeDTO = stadiumDAO.getTime(stadium_no);

		return timeDTO;

	}

	@Override
	public int insertStadiumRent(RentStadiumDTO rentStadiumDTO) {

		int m_noCnt = this.stadiumDAO.getM_no(rentStadiumDTO);

		// System.out.print(m_noCnt);

		if (m_noCnt >= 3){

			return 4;
		}

		

		int rentCnt = this.stadiumDAO.getRentTimeCnt(rentStadiumDTO);

		if (rentCnt > 0) {

			return 3;
		}

		int StadiumRentCnt = this.stadiumDAO.insertStadiumRent(rentStadiumDTO);

		// ----------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		// ----------------------------------------------
		return StadiumRentCnt;
	}

	@Override
	public List<String> getFullRent(int stadium_no) {

		List<String> fullRent = this.stadiumDAO.getFullRent(stadium_no);

		return fullRent;
	}

	@Override
	public List<myRentStadiumDTO> getMyStadiumList(int m_no) {
		List<myRentStadiumDTO> getMyStadiumList = stadiumDAO.getMyStadiumList(m_no);

		return getMyStadiumList;
	}

	@Override
	public List<MyRentStaidumTimeDTO> getTimeRanges(MyRentStaidumTimeDTO myRentStaidumTimeDTO) {

		List<MyRentStaidumTimeDTO> timeRanges = stadiumDAO.getTimeRanges(myRentStaidumTimeDTO);

		return timeRanges;
	}

	@Override
	public List<MyRentStaidumTimeDTO> getDate(MyRentStaidumTimeDTO myRentStaidumTimeDTO) {
		List<MyRentStaidumTimeDTO> RentDate = stadiumDAO.getDate(myRentStaidumTimeDTO);

		return RentDate;
	}

	@Override
	public int insertStadiumYangdo(YangdoDTO yangdoDTO) {
		
				
		int MatchStadiumCnt = this.stadiumDAO.getMatchStadiumCnt(yangdoDTO);
		
		if(MatchStadiumCnt >0) {
			
			return 4;
			
		}
		

		int yangdoCnt = this.stadiumDAO.getYangdoCnt(yangdoDTO);

		// System.out.print(m_noCnt);

		if (yangdoCnt > 0) {

			return 2;
		}
		
		
		int StadiumStatusCnt = this.stadiumDAO.getStadiumStatus(yangdoDTO);
		if (StadiumStatusCnt >= 1) {

			return 3;
		}

		int StadiumYangdoCnt = this.stadiumDAO.insertStadiumYangdo(yangdoDTO);

		// ----------------------------------------------
		// 1개 게시판 글 입력 적용 행의 개수 리턴하기
		// ----------------------------------------------
		return StadiumYangdoCnt;
	}

	// 양도 게시판 리스트 가져오기

	@Override
	public int getStadiumYangdoListAllCnt() {
		
		int StadiumYangdoListAllCnt = this.stadiumDAO.getMemberListAllCnt();
	
		return StadiumYangdoListAllCnt;
	}

	@Override
	public int getStadiumYangdoListCnt(YangdoSearchDTO yangdoSearchDTO) {

		int StadiumYangdoListCnt = this.stadiumDAO.getStadiumYangdoListCnt(yangdoSearchDTO);

		return StadiumYangdoListCnt;
	}

	@Override
	public List<YangdoDTO> getStadiumYangdoList(YangdoSearchDTO yangdoSearchDTO) {

		List<YangdoDTO> stadiumYangdoList = this.stadiumDAO.getStadiumYangdoList(yangdoSearchDTO);

		return stadiumYangdoList;
	}
	
	
	//양도 디테일
	
	@Override
	public YangdoDTO getStadiumYangdo(int yangdo_no) {
		
		int updateCnt = this.stadiumDAO.updateStadiumYangdo(yangdo_no);
		
		YangdoDTO yangdoDTO = this.stadiumDAO.getStadiumYangdo(yangdo_no);

		return yangdoDTO;
	}

	
	@Override
	public YangdoDTO getYangdoForUpDel(int yangdo_no) {
		YangdoDTO yangdoDTO = this.stadiumDAO.getStadiumYangdo(yangdo_no);

		return yangdoDTO;
	}

	@Override
	public List<MyYangdoStaidumTimeDTO> getYangdoDate(MyYangdoStaidumTimeDTO myYangdoStaidumTimeDTO) {
		List<MyYangdoStaidumTimeDTO> yangdoDate = stadiumDAO.getYangdoDate(myYangdoStaidumTimeDTO);

		return yangdoDate;
	}

	@Override
	public List<MyYangdoStaidumTimeDTO> getYangdoTimeRanges(MyYangdoStaidumTimeDTO myYangdoStaidumTimeDTO) {
		List<MyYangdoStaidumTimeDTO> yangdotimeRanges = stadiumDAO.getYangdoTimeRanges(myYangdoStaidumTimeDTO);

		return yangdotimeRanges;
	}

	@Override
	public int deleteYangdo(YangdoDTO yangdoDTO) {
		int yangdoCnt = this.stadiumDAO.getYangdoDelCnt(yangdoDTO.getYangdo_no());
		
		if (yangdoCnt == 0) {
			return yangdoCnt;
		}

		int checkStatusDelCnt = this.stadiumDAO.getCheckStatusDelCnt(yangdoDTO.getYangdo_no());
		
		if (checkStatusDelCnt >= 1) {
			return 8;
		}

		int yangdoDelCnt = this.stadiumDAO.deleteYangdo(yangdoDTO);

		// 수정 적용개수 리턴하기
		return yangdoDelCnt;
	}

	@Override
	public int updateYangdo(YangdoDTO yangdoDTO) {
		
//		int MatchStadiumCnt = this.stadiumDAO.getMatchStadiumCnt(yangdoDTO);
//		
//		if(MatchStadiumCnt >0) {
//			
//			return 4;
//			
//		}
		
		//경기장상태가 이용불가면 리턴5
		int StadiumUpStatusCnt = this.stadiumDAO.getUpStadiumStatus(yangdoDTO);
		
		if (StadiumUpStatusCnt >= 1) {

			return 5;
		}

		
		//이미 양도에 같은게 있으면 3반환
		int UpCnt = this.stadiumDAO.getYangdoUpCnt(yangdoDTO);
		

		if (UpCnt >= 1) {
			return 3;
		}

		
		int yangdoCnt = this.stadiumDAO.getYangdoDelCnt(yangdoDTO.getYangdo_no());
		
		if (yangdoCnt == 0) {
			return yangdoCnt;
		}
		
		int checkStatusUpCnt = this.stadiumDAO.getCheckStatusUpCnt(yangdoDTO.getYangdo_no());
		if (checkStatusUpCnt >=1) {
			return 7;
		}
		
		int yangdoUpCnt = this.stadiumDAO.updateYangdo(yangdoDTO);

		// 수정 적용개수 리턴하기
		return yangdoUpCnt;
	}

	@Override
	public int updateSincheong(YangdoDTO yangdoDTO) {
		
		int StadiumStatusCnt = this.stadiumDAO.getSincheongStadiumStatus(yangdoDTO);
		
		if (StadiumStatusCnt >=1) {
			return 9;
		}
		
		
		
		int sincheongCnt = this.stadiumDAO.updateSincheong(yangdoDTO);
			
		int BookingCnt = this.stadiumDAO.updateBooking(yangdoDTO);
		
		
		return sincheongCnt;
	}

	
	//양도 삭제 어드민일때...
	@Override
	public int deleteAdminYangdo(YangdoDTO yangdoDTO) {

		int yangdoDelCnt = this.stadiumDAO.deleteYangdo(yangdoDTO);

		// 수정 적용개수 리턴하기
		return yangdoDelCnt;
	}

}
