package kosmo.team.project.service;

import java.util.Map;

public interface LoginService {

	public int getmidpwdCnt(Map<String,String> midpwd);
	
	public String getNickname(String mid);
	
	public String getEmail(String mid);

	public int getM_no(String mid);
	
	Map<String, String> getMemberInfo(String name, String phone);
	
	public int updatePassword(String mid, String pwd);
}