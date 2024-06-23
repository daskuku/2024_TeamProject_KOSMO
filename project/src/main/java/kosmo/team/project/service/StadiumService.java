package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.MyRentStaidumTimeDTO;
import kosmo.team.project.dto.MyYangdoStaidumTimeDTO;
import kosmo.team.project.dto.RentStadiumDTO;
import kosmo.team.project.dto.StadiumDTO;
import kosmo.team.project.dto.StadiumSearchDTO;
import kosmo.team.project.dto.TimeDTO;
import kosmo.team.project.dto.YangdoDTO;
import kosmo.team.project.dto.YangdoSearchDTO;
import kosmo.team.project.dto.myRentStadiumDTO;

public interface StadiumService {

	public int getStadiumListCnt(StadiumSearchDTO stadiumSearchDTO);

	public List<StadiumDTO> getStadiumList(StadiumSearchDTO stadiumSearchDTO);
	
	public int getStadiumListAllCnt();
	
	StadiumDTO getStadium(int stadium_no);

	List<TimeDTO> getTime(int stadium_no);

	public int insertStadiumRent(RentStadiumDTO rentStadiumDTO);

	public List<String> getFullRent(int stadium_no);

	public List<myRentStadiumDTO> getMyStadiumList(int m_no);

	public List<MyRentStaidumTimeDTO> getTimeRanges(MyRentStaidumTimeDTO myRentStaidumTimeDTO);

	public List<MyRentStaidumTimeDTO> getDate(MyRentStaidumTimeDTO myRentStaidumTimeDTO);

	public int insertStadiumYangdo(YangdoDTO yangdoDTO);

	public int getStadiumYangdoListAllCnt();

	public int getStadiumYangdoListCnt(YangdoSearchDTO yangdoSearchDTO);

	public List<YangdoDTO> getStadiumYangdoList(YangdoSearchDTO yangdoSearchDTO);

	public YangdoDTO getStadiumYangdo(int yangdo_no);

	public YangdoDTO getYangdoForUpDel(int yangdo_no);

	public List<MyYangdoStaidumTimeDTO> getYangdoDate(MyYangdoStaidumTimeDTO myYangdoStaidumTimeDTO);

	public List<MyYangdoStaidumTimeDTO> getYangdoTimeRanges(MyYangdoStaidumTimeDTO myYangdoStaidumTimeDTO);

	public int deleteYangdo(YangdoDTO yangdoDTO);

	public int updateYangdo(YangdoDTO yangdoDTO);

	public int updateSincheong(YangdoDTO yangdoDTO);

	public int deleteAdminYangdo(YangdoDTO yangdoDTO);



}
