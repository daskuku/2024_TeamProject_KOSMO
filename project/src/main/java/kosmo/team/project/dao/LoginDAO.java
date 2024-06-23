package kosmo.team.project.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kosmo.team.project.dto.CustomerServiceDetailDTO;


@Mapper
public interface LoginDAO {

	public int getmidpwdCnt(Map<String,String> midpwd);
	
	public String getNickname(String mid);
	
	public String getEmail(String mid);

	public int getM_no(String mid);
	
	Map<String, String> getMemberInfo(@Param("name") String name, @Param("phone") String phone);
	
	public int updatePassword(@Param("mid") String mid, @Param("pwd") String pwd);
}