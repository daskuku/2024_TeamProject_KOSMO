package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.RecruitDAO;
import kosmo.team.project.dto.RecruitHiredDTO;
import kosmo.team.project.dto.RecruitLessonDTO;
import kosmo.team.project.dto.RecruitSearchDTO;
import kosmo.team.project.dto.RecruitTeamMemDTO;

@Service
@Transactional
public class RecruitServiceImpl implements RecruitService {

   @Autowired
   private RecruitDAO recruitDAO;
   

//==================================================================================================================================   
   
   //팀/팀원모집페이지_boardlist
   public List<RecruitTeamMemDTO> getRecruit_TeamMemList(RecruitSearchDTO recruitSearchDTO) {

      List<RecruitTeamMemDTO> getRecruit_TeamMemList = this.recruitDAO.getRecruit_TeamMemList(recruitSearchDTO);

      return getRecruit_TeamMemList;

   }
   
   //게시물개수 리턴
   public int getBoardListCnt(RecruitSearchDTO recruitSearchDTO) {
      
      int boardListCnt = this.recruitDAO.getBoardListCnt(recruitSearchDTO);

      return boardListCnt;
   }
   
   //팀/팀원상세페이지
   public RecruitTeamMemDTO getRecruit_TeamMemDetail(int b_no) {

      //조회수올리기
      int updateReadCnt = this.recruitDAO.updateTeamMemReadCnt(b_no);
      
      RecruitTeamMemDTO getRecruit_TeamMemDetail = this.recruitDAO.getRecruit_TeamMemDetail(b_no);

      return getRecruit_TeamMemDetail;

   }
   
   //새글쓰기에서 팀이 있나 확인
 	public int checkHaveTeam(int m_no)
 	{
 		int checkHaveTeam = this.recruitDAO.checkHaveTeam(m_no);
 		return checkHaveTeam;
 	}
   
   //팀/팀원상세페이지에서 요일 가져오기
   public List<String> getRecruit_day(int b_no){
      List<String> getRecruit_day = this.recruitDAO.getRecruit_day(b_no); 
      return getRecruit_day;    
   }
   
   //팀/팀원상세페이지에서 시간 가져오기
   public List<String> getRecruit_time(int b_no){
      List<String> getRecruit_time = this.recruitDAO.getRecruit_time(b_no);
      return getRecruit_time; 
   }
   
   //팀/팀원모집수정삭제페이지
   public int regTeamMemRecruit(RecruitTeamMemDTO recruitTeamMemDTO) {
      int regTeamMemRecruit = this.recruitDAO.regTeamMemRecruit(recruitTeamMemDTO);
      
      if(recruitTeamMemDTO.getDay() != null)
      {
         int newInsertDay = this.recruitDAO.newInsertDay(recruitTeamMemDTO);
      }
      
      if(recruitTeamMemDTO.getTime() != null)
      {
         int newInsertTime = this.recruitDAO.newInsertTime(recruitTeamMemDTO); 
      }
      return regTeamMemRecruit;       
      
   }
   

   //용병모집 새글쓰기 저장 
   public int regHiredRecruit(RecruitHiredDTO recruitHiredDTO) {
      int regHiredRecruit = this.recruitDAO.regHiredRecruit(recruitHiredDTO);
      
      if(recruitHiredDTO.getDay() != null)
      {
         int newInsertDay_hired = this.recruitDAO.newInsertDay_hired(recruitHiredDTO);
      }

      if(recruitHiredDTO.getTime() != null)
      {
         int newInsertTime_hired = this.recruitDAO.newInsertTime_hired(recruitHiredDTO); 
      }
      return regHiredRecruit;       
      
   }

   
   public RecruitTeamMemDTO getRecruit_TeamMemUpDel(int b_no) {
      RecruitTeamMemDTO recruitTeamMemDTO = this.recruitDAO.getRecruit_TeamMemUpDel(b_no);
      return recruitTeamMemDTO;
   }
   
   public List<String> getRecruit_TeamMemUpDel_day(int b_no) {
      List<String> recruitTeamMemDTO_day = this.recruitDAO.getRecruit_TeamMemUpDel_day(b_no);
      return recruitTeamMemDTO_day;
   }
   
   public List<String> getRecruit_TeamMemUpDel_time(int b_no) {
      List<String> recruitTeamMemDTO_time = this.recruitDAO.getRecruit_TeamMemUpDel_time(b_no);
      return recruitTeamMemDTO_time;
   }
   
   
    public RecruitTeamMemDTO getRecruit_TeamMemUpDel_sidosigungu(int b_no) {
       RecruitTeamMemDTO recruitTeamMemDTO_sidosigungu = this.recruitDAO.getRecruit_TeamMemUpDel_sidosigungu(b_no);
       return recruitTeamMemDTO_sidosigungu;
    }
    
    //service(인터페이스 공간)에 이름만 정의해준 메소드의 기능을 이 안에서 정의, 팀/팀원 게시물 수정(삭제후재입력)
    public int recruitUpdateTeamMem(RecruitTeamMemDTO recruitTeamMemDTO){
       int deleteDay = this.recruitDAO.deleteDay(recruitTeamMemDTO);
       int deleteTime = this.recruitDAO.deleteTime(recruitTeamMemDTO);
       if(recruitTeamMemDTO.getDay() != null)
       {
         int insertDay = this.recruitDAO.insertDay(recruitTeamMemDTO);
       }
      
       if(recruitTeamMemDTO.getTime() != null)
       {
         int insertTime = this.recruitDAO.insertTime(recruitTeamMemDTO); 
       }
       int recruitUpdateTeamMem = this.recruitDAO.recruitUpdateTeamMem(recruitTeamMemDTO);
       
       return recruitUpdateTeamMem;
    }
    
    
   //service(인터페이스 공간)에 이름만 정의해준 메소드의 기능을 이 안에서 정의, 팀원 게시물 삭제
    public int recruitDeleteTeamMem(RecruitTeamMemDTO recruitTeamMemDTO) {
       int recruitDeleteTeamMem = this.recruitDAO.recruitDeleteTeamMem(recruitTeamMemDTO);
       return recruitDeleteTeamMem;
    }

    

    //신청버튼을 누르면 내 정보가 승낙대기 테이블로 넘어감.
    public int regWaitingList(RecruitTeamMemDTO recruitTeamMemDTO) {
       //내가 팀에 속해있는지 확인
       int findMyTeam = this.recruitDAO.findMyTeam(recruitTeamMemDTO); 
       if(findMyTeam > 0)
       {
          return 2;
       }
       int regWaitingList = this.recruitDAO.regWaitingList(recruitTeamMemDTO);
       if(regWaitingList > 0) 
       {
          return 1;
       }
       return 0;
    }
    
//==================================================================================================================================

   //용병모집board페이지
   /*
    * public List<RecruitHiredDTO> getRecruit_HiredBoardList() {
    * 
    * List<RecruitHiredDTO> getRecruit_HiredBoardList =
    * this.recruitDAO.getRecruit_HiredBoardList();
    * 
    * return getRecruit_HiredBoardList;
    * 
    * }
    */
   
   //용병상세페이지
   public RecruitHiredDTO getRecruit_HiredDetail(int recruitment_no) {
      
      //조회수 올리기는 용병상세페이지에서 실행
      int hiredDeatilCnt = this.recruitDAO.hiredDeatilCnt(recruitment_no);

      RecruitHiredDTO getRecruit_HiredDetail = this.recruitDAO.getRecruit_HiredDetail(recruitment_no);

      return getRecruit_HiredDetail;

   }
   
   //용병모집상세페이지에서 요일 가져오기
   public List<String> getRecruit_hired_day(int recruitment_no){
      List<String> getRecruit_hired_day = this.recruitDAO.getRecruit_hired_day(recruitment_no); 
      return getRecruit_hired_day;    
   }
   
   //용병모집상세페이지에서 시간 가져오기
   public List<String> getRecruit_hired_time(int recruitment_no){
      List<String> getRecruit_hired_time = this.recruitDAO.getRecruit_hired_time(recruitment_no);
      return getRecruit_hired_time; 
   }
    
   //용병모집수정삭제페이지
   public RecruitHiredDTO getRecruit_HiredUpDel(int recruitment_no) {
      RecruitHiredDTO recruitHiredDTO = this.recruitDAO.getRecruit_HiredUpDel(recruitment_no);
      return recruitHiredDTO;
   }
   
   //용병모집수정페이지에서 요일 가져오기
   public List<String> getRecruit_HiredUpDel_day(int recruitment_no) {
      List<String> recruitHiredDTO_day = this.recruitDAO.getRecruit_HiredUpDel_day(recruitment_no);
      return recruitHiredDTO_day;
   }
   
   //용병모집수정페이지에서 시간 가져오기
   public List<String> getRecruit_HiredUpDel_time(int recruitment_no) {
      List<String> recruitHiredDTO_time = this.recruitDAO.getRecruit_HiredUpDel_time(recruitment_no);
      return recruitHiredDTO_time;
   }
   
   //용병모집수정페이지에서 시군구 가져오기
    public RecruitHiredDTO getRecruit_HiredUpDel_sidosigungu(int recruitment_no) {
       RecruitHiredDTO recruitHiredDTO_sidosigungu = this.recruitDAO.getRecruit_HiredUpDel_sidosigungu(recruitment_no);
       return recruitHiredDTO_sidosigungu;
    }
    
    //service(인터페이스 공간)에 이름만 정의해준 메소드의 기능을 이 안에서 정의, 용병 게시물 수정(삭제후재입력)
    public int recruitUpdateHired(RecruitHiredDTO recruitHiredDTO){
       int deleteDay_hired = this.recruitDAO.deleteDay_hired(recruitHiredDTO);
       int deleteTime_hired = this.recruitDAO.deleteTime_hired(recruitHiredDTO);
       if(recruitHiredDTO.getDay() != null)
       {
         int insertDay = this.recruitDAO.insertDay_hired(recruitHiredDTO);
       }
      
       if(recruitHiredDTO.getTime() != null)
       {
         int insertTime_hired = this.recruitDAO.insertTime_hired(recruitHiredDTO); 
       }
       int recruitUpdateHired = this.recruitDAO.recruitUpdateHired(recruitHiredDTO);
       
       return recruitUpdateHired;
    }
    
    
   //service(인터페이스 공간)에 이름만 정의해준 메소드의 기능을 이 안에서 정의, 용병 게시물 삭제
    public int recruitDeleteHired(RecruitHiredDTO recruitHiredDTO) {
       int recruitDeleteHired = this.recruitDAO.recruitDeleteHired(recruitHiredDTO);
       return recruitDeleteHired;
    }
    
    
   //용병페이징처리
       @Override
         public List<RecruitHiredDTO> getRecruitHired(RecruitSearchDTO recruitSearchDTO) {

            List<RecruitHiredDTO> recruitHired = this.recruitDAO.getRecruitHired(recruitSearchDTO);

            return recruitHired;

         }

         public int getHiredListCnt(RecruitSearchDTO recruitSearchDTO) {

            int hiredListCnt = this.recruitDAO.getHiredListCnt(recruitSearchDTO);

            return hiredListCnt;

         }

         public int getHiredListAllCnt() {
            // --------------------------------------
            // BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
            // 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
            // --------------------------------------
            int hiredListAllCnt = this.recruitDAO.getHiredListAllCnt();
            // --------------------------------------
            // 변수 boardListAllCnt 안의 데이터를 리턴하기
            // --------------------------------------
            return hiredListAllCnt;
         }
       
         
   //용병 신청하면 승낙대기 테이블로 들어간다.
   public int goWaitingHiredList(RecruitHiredDTO recruitHiredDTO) {
      int checkHiredOverLapCnt = this.recruitDAO.checkHiredOverLapCnt(recruitHiredDTO);
      if(checkHiredOverLapCnt == 1)
      {
         return 2;
      }
      int goWaitingHiredList = this.recruitDAO.goWaitingHiredList(recruitHiredDTO);
      return goWaitingHiredList;
   }

//==================================================================================================================================    
      
      //레슨모집페이지_boardlist
      /*
      public List<RecruitLessonDTO> getRecruit_LessonBoardList() {

         List<RecruitLessonDTO> getRecruit_LessonBoardList = this.recruitDAO.getRecruit_LessonBoardList();

         return getRecruit_LessonBoardList;

      }   
      */
      
      //레슨상세페이지
      public RecruitLessonDTO getRecruit_LessonDetail(int recruitment_no) {
         
         //조회수 올리기는 레슨상세페이지에서 실행
         int lessonDeatilCnt = this.recruitDAO.lessonDeatilCnt(recruitment_no);

         RecruitLessonDTO getRecruit_LessonDetail = this.recruitDAO.getRecruit_LessonDetail(recruitment_no);

         return getRecruit_LessonDetail;

      }
      
      //레슨상세페이지 요일 가져오기
      public List<String> getRecruit_lesson_day(int recruitment_no){
         List<String> getRecruit_lesson_day = this.recruitDAO.getRecruit_lesson_day(recruitment_no); 
         return getRecruit_lesson_day;    
      }
      
      //레슨상세페이지 시간 가져오기
      public List<String> getRecruit_lesson_time(int recruitment_no){
         List<String> getRecruit_lesson_time = this.recruitDAO.getRecruit_lesson_time(recruitment_no);
         return getRecruit_lesson_time; 
      }
      

      //레슨모집 새글쓰기 저장 
      public int regLessonRecruit(RecruitLessonDTO recruitLessonDTO) {
         int regLessonRecruit = this.recruitDAO.regLessonRecruit(recruitLessonDTO);
         
         if(recruitLessonDTO.getDay() != null)
         {
            int newInsertDay_lesson = this.recruitDAO.newInsertDay_lesson(recruitLessonDTO);
         }

         if(recruitLessonDTO.getTime() != null)
         {
            int newInsertTime_lesson = this.recruitDAO.newInsertTime_lesson(recruitLessonDTO); 
         }
         return regLessonRecruit;       
         
      }
      

      //레슨모집 수정페이지
      public RecruitLessonDTO getRecruit_LessonUpDel(int recruitment_no) {
         RecruitLessonDTO recruitLessonDTO = this.recruitDAO.getRecruit_LessonUpDel(recruitment_no);
         return recruitLessonDTO;
      }
      
      public List<String> getRecruit_LessonUpDel_day(int recruitment_no) {
         List<String> recruitLessonDTO_day = this.recruitDAO.getRecruit_LessonUpDel_day(recruitment_no);
         return recruitLessonDTO_day;
      }
      
      public List<String> getRecruit_LessonUpDel_time(int recruitment_no) {
         List<String> recruitLessonDTO_time = this.recruitDAO.getRecruit_LessonUpDel_time(recruitment_no);
         return recruitLessonDTO_time;
      }
      
      
       public RecruitLessonDTO getRecruit_LessonUpDel_sidosigungu(int recruitment_no) {
          RecruitLessonDTO recruitLessonDTO_sidosigungu = this.recruitDAO.getRecruit_LessonUpDel_sidosigungu(recruitment_no);
          return recruitLessonDTO_sidosigungu;
       }
       
       //service(인터페이스 공간)에 이름만 정의해준 메소드의 기능을 이 안에서 정의, 레슨 게시물 수정
       public int recruitUpdateLesson(RecruitLessonDTO recruitLessonDTO){
          int deleteDay_lesson = this.recruitDAO.deleteDay_lesson(recruitLessonDTO);
          int deleteTime_lesson = this.recruitDAO.deleteTime_lesson(recruitLessonDTO);
          if(recruitLessonDTO.getDay() != null)
          {
            int insertDay_lesson = this.recruitDAO.insertDay_lesson(recruitLessonDTO);
          }
         
          if(recruitLessonDTO.getTime() != null)
          {
            int insertTime_lesson = this.recruitDAO.insertTime_lesson(recruitLessonDTO); 
          }
          int recruitUpdateLesson = this.recruitDAO.recruitUpdateLesson(recruitLessonDTO);
          
          return recruitUpdateLesson;
       }
       
       
         //service(인터페이스 공간)에 이름만 정의해준 메소드의 기능을 이 안에서 정의, 팀원 게시물 삭제
          public int recruitDeleteLesson(RecruitLessonDTO recruitLessonDTO) {
             int recruitDeleteLesson = this.recruitDAO.recruitDeleteLesson(recruitLessonDTO);
             return recruitDeleteLesson;
          }
          
          
      //레슨페이징처리
       @Override
         public List<RecruitLessonDTO> getRecruitLesson(RecruitSearchDTO recruitSearchDTO) {

            List<RecruitLessonDTO> recruitLesson = this.recruitDAO.getRecruitLesson(recruitSearchDTO);

            return recruitLesson;

         }

         public int getLessonListCnt(RecruitSearchDTO recruitSearchDTO) {

            int lessonListCnt = this.recruitDAO.getLessonListCnt(recruitSearchDTO);

            return lessonListCnt;

         }

         public int getLessonListAllCnt() {
            // --------------------------------------
            // BoardDAOImpl 객체의 getBoardListCnt 메소드를 호출하여
            // 게시판 총 개수를 구하여 변수 boardListCnt 에 저장하기
            // --------------------------------------
            int lessonListAllCnt = this.recruitDAO.getLessonListAllCnt();
            // --------------------------------------
            // 변수 boardListAllCnt 안의 데이터를 리턴하기
            // --------------------------------------
            return lessonListAllCnt;
         }    
       
      //레슨 신청하면 승낙대기 테이블로 들어간다.
      public int goWaitingLessonList(RecruitLessonDTO recruitLessonDTO) {
         int checkingOverLapCnt = this.recruitDAO.checkingOverLapCnt(recruitLessonDTO);
         if(checkingOverLapCnt == 1)
         {
            return 2;
         }
         int goWaitingLessonList = this.recruitDAO.goWaitingLessonList(recruitLessonDTO);
         return goWaitingLessonList;
      }

}