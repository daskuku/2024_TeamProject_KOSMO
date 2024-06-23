package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;

public interface RecruitService {
	
	//==================================================================================================================================
	
	//팀/팀원모집페이지_boardlist
	public List<RecruitTeamMemDTO> getRecruit_TeamMemList(RecruitSearchDTO recruitSearchDTO);
	
	//팀/팀원상세페이지
	RecruitTeamMemDTO getRecruit_TeamMemDetail(int b_no);
	
	//팀/팀원상세페이지에서 요일 가져오기
	public List<String> getRecruit_day(int b_no);
	
	//팀/팀원상세페이지에서 시간 가져오기
	public List<String> getRecruit_time(int b_no);
	
	//팀원모집 새글쓰기 저장 
	public int regTeamMemRecruit(RecruitTeamMemDTO recruitTeamMemDTO);
	
	//새글쓰기에서 팀이 있나 확인
	int checkHaveTeam(int m_no);
	
	//팀/팀원페이지 수정삭제페이지
	RecruitTeamMemDTO getRecruit_TeamMemUpDel(int b_no);
	
	//팀/팀원페이지 수정_요일
	public List<String> getRecruit_TeamMemUpDel_day(int b_no);
	
	//팀/팀원페이지 수정_시간
	public List<String> getRecruit_TeamMemUpDel_time(int b_no);
	
	//팀/팀원페이지 수정_시군구
	RecruitTeamMemDTO getRecruit_TeamMemUpDel_sidosigungu(int b_no);
	
	

	//팀/팀원 게시물 수정을 위한 메소드 이름만 정의
	public int recruitUpdateTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	//팀/팀원 게시물 삭제를 위한 메소드 이름만 정의
	public int recruitDeleteTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
	
	
	//팀원모집페이징처리
	public int getBoardListCnt(RecruitSearchDTO recruitSearchDTO);

	

	 //신청버튼을 누르면 내 정보가 승낙대기 테이블로 넘어감.
	int regWaitingList(RecruitTeamMemDTO recruitTeamMemDTO);

	
//==================================================================================================================================

	//용병모집board페이지
	//public List<RecruitHiredDTO> getRecruit_HiredBoardList();

	//용병상세페이지
	RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no);
	
	//용병모집상세페이지에서 요일 가져오기
	public List<String> getRecruit_hired_day(int recruitment_no);
	
	//용병모집상세페이지에서 시간 가져오기
	public List<String> getRecruit_hired_time(int recruitment_no);

	//용병모집 새글쓰기 저장 
	public int regHiredRecruit(RecruitHiredDTO recruitHiredDTO);
	

	//용병모집수정삭제페이지
	RecruitHiredDTO getRecruit_HiredUpDel(int recruitment_no);
	
	//용병페이지 수정_요일
	public List<String> getRecruit_HiredUpDel_day(int recruitment_no);
	
	//용병페이지 수정_시간
	public List<String> getRecruit_HiredUpDel_time(int recruitment_no);
	
	//용병페이지 수정_시군구
	RecruitHiredDTO getRecruit_HiredUpDel_sidosigungu(int recruitment_no);

	
	//용병 게시물 수정을 위한 메소드 이름만 정의
	public int recruitUpdateHired(RecruitHiredDTO recruitHiredDTO);
	//용병 게시물 삭제를 위한 메소드 이름만 정의
	public int recruitDeleteHired(RecruitHiredDTO recruitHiredDTO);
	
	

	//용병모집_페이징처리
	public int getHiredListAllCnt();

	public int getHiredListCnt(RecruitSearchDTO recruitSearchDTO);
	
	public List<RecruitHiredDTO> getRecruitHired(RecruitSearchDTO recruitSearchDTO);
	

    //용병 신청하면 승낙대기 테이블로 들어간다.
	int goWaitingHiredList(RecruitHiredDTO recruitHiredDTO);


//==================================================================================================================================
	
	
	//레슨모집페이지_boardlist
	// List<RecruitLessonDTO> getRecruitLesson();

	//레슨상세페이지
	RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no);
	
	//레슨상세페이지 요일 가져오기
	public List<String> getRecruit_lesson_day(int recruitment_no);
	
	//레슨상세페이지 시간 가져오기
	public List<String> getRecruit_lesson_time(int recruitment_no);

	//레슨모집 새글쓰기 저장 
	public int regLessonRecruit(RecruitLessonDTO recruitLessonDTO);
	
	
	
	//레슨모집수정삭제페이지
	RecruitLessonDTO getRecruit_LessonUpDel(int recruitment_no);
	
	//레슨페이지 수정_요일
	public List<String> getRecruit_LessonUpDel_day(int recruitment_no);
	
	//레슨페이지 수정_요일
	public List<String> getRecruit_LessonUpDel_time(int recruitment_no);
	
	//레슨페이지 수정_요일
	RecruitLessonDTO getRecruit_LessonUpDel_sidosigungu(int recruitment_no);
	

	
	//레슨 게시물 수정을 위한 메소드 이름만 정의
	public int recruitUpdateLesson(RecruitLessonDTO recruitLessonDTO);
	
	//레슨 게시물 삭제를 위한 메소드 이름만 정의
	public int recruitDeleteLesson(RecruitLessonDTO recruitLessonDTO);
	
	
	
	//레슨모집_페이징처리
	public int getLessonListAllCnt();

	public int getLessonListCnt(RecruitSearchDTO recruitSearchDTO);
	
	public List<RecruitLessonDTO> getRecruitLesson(RecruitSearchDTO recruitSearchDTO);
	
	//레슨 신청하면 승낙대기 테이블로 들어간다.
	int goWaitingLessonList(RecruitLessonDTO recruitLessonDTO);
	
}

