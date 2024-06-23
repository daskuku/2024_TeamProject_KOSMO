package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;

@Mapper
public interface RecruitDAO {

   public List<RecruitTeamMemDTO> getRecruit_TeamMemList(RecruitSearchDTO recruitSearchDTO);
   
   //public List<RecruitHiredDTO> getRecruit_HiredBoardList();
   
   
   
   
   public RecruitTeamMemDTO getRecruit_TeamMemDetail(int b_no);
   
   //조회수 올리기는 용병상세페이지에서 실행
   int hiredDeatilCnt(int recruitment_no);
   
   
   
   public RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no);
   
   //새글쓰기에서 팀이 있나 확인
 	int checkHaveTeam(int m_no);
   
   
   public int regTeamMemRecruit(RecruitTeamMemDTO recruitTeamMemDTO);
   
   //용병모집 새글쓰기 저장 
   public int regHiredRecruit(RecruitHiredDTO recruitHiredDTO);
   
   
   
   public int updateTeamMemReadCnt(int b_no);
   
   

   public int getBoardListCnt(RecruitSearchDTO recruitSearchDTO);   
   
   
   
   
   public int insertDay(RecruitTeamMemDTO recruitTeamMemDTO);   
   
   public int insertTime(RecruitTeamMemDTO recruitTeamMemDTO);   
   
   
   
   //팀원모집 새글쓰기 요일 삽입
   public int newInsertDay(RecruitTeamMemDTO recruitTeamMemDTO);   
   
   //팀원모집 새글쓰기 시간 삽입
   public int newInsertTime(RecruitTeamMemDTO recruitTeamMemDTO);
   
   //용병모집 새글쓰기 요일 삽입
   public int newInsertDay_hired(RecruitHiredDTO recruitHiredDTO);   
   
   //용병모집 새글쓰기 시간 삽입
   public int newInsertTime_hired(RecruitHiredDTO recruitHiredDTO);
   
   
   
   
   public List<String> getRecruit_day(int b_no);
   
   public List<String> getRecruit_time(int b_no);
   
   //용병모집상세페이지에서 요일 가져오기
   public List<String> getRecruit_hired_day(int recruitment_no);

   //용병모집상세페이지에서 시간 가져오기
   public List<String> getRecruit_hired_time(int recruitment_no);
   
   
   
   
   public RecruitTeamMemDTO getRecruit_TeamMemUpDel(int b_no);
   
   public List<String> getRecruit_TeamMemUpDel_day(int b_no);
   
   public List<String> getRecruit_TeamMemUpDel_time(int b_no);
   
   public RecruitTeamMemDTO getRecruit_TeamMemUpDel_sidosigungu(int b_no);
   
   
   
   public int recruitUpdateTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
   
   public int deleteDay(RecruitTeamMemDTO recruitTeamMemDTO);
   
   public int deleteTime(RecruitTeamMemDTO recruitTeamMemDTO);
   
   public int recruitDeleteTeamMem(RecruitTeamMemDTO recruitTeamMemDTO);
   
   
   //신청버튼을 누르면 내 정보가 승낙대기 테이블로 넘어감.
   int regWaitingList(RecruitTeamMemDTO recruitTeamMemDTO);
   
   int findMyTeam(RecruitTeamMemDTO recruitTeamMemDTO); 

   
//---------------------------------------------------------------------------
   
   //용병모집수정삭제페이지
   public RecruitHiredDTO getRecruit_HiredUpDel(int recruitment_no);
   
   public List<String> getRecruit_HiredUpDel_day(int recruitment_no);
   
   public List<String> getRecruit_HiredUpDel_time(int b_recruitment_nono);
   
   public RecruitHiredDTO getRecruit_HiredUpDel_sidosigungu(int recruitment_no);
   
   
   //용병 게시물 수정
   public int recruitUpdateHired(RecruitHiredDTO recruitHiredDTO);
   
   public int deleteDay_hired(RecruitHiredDTO recruitHiredDTO);
   
   public int deleteTime_hired(RecruitHiredDTO recruitHiredDTO);
   
   

   public int insertDay_hired(RecruitHiredDTO recruitHiredDTO);   
   
   public int insertTime_hired(RecruitHiredDTO recruitHiredDTO);
   
   public int recruitDeleteHired(RecruitHiredDTO recruitHiredDTO);
   
   
   
   //용병페이지_페이징처리하기
   public List<RecruitHiredDTO> getRecruitHired(RecruitSearchDTO recruitSearchDTO);

   public int getHiredListCnt(RecruitSearchDTO recruitSearchDTO);

   public int getHiredListAllCnt();
   
   
   //용병 신청하면 승낙대기 테이블로 들어간다.
   int checkHiredOverLapCnt(RecruitHiredDTO recruitHiredDTO);
   int goWaitingHiredList(RecruitHiredDTO recruitHiredDTO);
   
   
//---------------------------------------------------------------------------   

   //레슨모집페이지_boardlist
   //public List<RecruitLessonDTO> getRecruit_LessonBoardList();
   
   //레슨상세페이지
   public RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no);
   
   //조회수 올리기는 레슨상세페이지에서 실행
   int lessonDeatilCnt(int recruitment_no);
   
   //레슨모집상세페이지에서 요일 가져오기
   public List<String> getRecruit_lesson_day(int recruitment_no);

   //레슨모집상세페이지에서 시간 가져오기
   public List<String> getRecruit_lesson_time(int recruitment_no);
   
   //레슨모집 새글쓰기 저장 
   public int regLessonRecruit(RecruitLessonDTO recruitLessonDTO);
   
   //레슨모집 새글쓰기 요일 삽입
   public int newInsertDay_lesson(RecruitLessonDTO recruitLessonDTO);   
   
   //레슨모집 새글쓰기 시간 삽입
   public int newInsertTime_lesson(RecruitLessonDTO recruitLessonDTO);
   
   
   
   //레슨모집 수정페이지
   public RecruitLessonDTO getRecruit_LessonUpDel(int recruitment_no);
   
   public List<String> getRecruit_LessonUpDel_day(int recruitment_no);
   
   public List<String> getRecruit_LessonUpDel_time(int recruitment_no);
   
   public RecruitLessonDTO getRecruit_LessonUpDel_sidosigungu(int recruitment_no);
   
   
   //레슨 게시물 수정
   public int recruitUpdateLesson(RecruitLessonDTO recruitLessonDTO);
   
   public int deleteDay_lesson(RecruitLessonDTO recruitLessonDTO);
   
   public int deleteTime_lesson(RecruitLessonDTO recruitLessonDTO);
   
   

   public int insertDay_lesson(RecruitLessonDTO recruitLessonDTO);   
   
   public int insertTime_lesson(RecruitLessonDTO recruitLessonDTO);
   
   public int recruitDeleteLesson(RecruitLessonDTO recruitLessonDTO);
   
   
   
   //레슨페이지_페이징처리하기
   public List<RecruitLessonDTO> getRecruitLesson(RecruitSearchDTO recruitSearchDTO);

   public int getLessonListCnt(RecruitSearchDTO recruitSearchDTO);

   public int getLessonListAllCnt();
   
   //레슨 신청하면 승낙대기 테이블로 들어간다.
   int checkingOverLapCnt(RecruitLessonDTO recruitLessonDTO);
   int goWaitingLessonList(RecruitLessonDTO recruitLessonDTO);
   
}