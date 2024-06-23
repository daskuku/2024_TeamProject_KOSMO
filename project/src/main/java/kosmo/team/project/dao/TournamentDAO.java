package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.CommunityDTO;
import kosmo.team.project.dto.TournamentDTO;
import kosmo.team.project.dto.TournamentSearchDTO;

@Mapper
public interface TournamentDAO {


	public List<TournamentDTO> getTournamentList(TournamentSearchDTO tournamentSearchDTO);
	
	public TournamentDTO recruitTeamBoardDetailForm(int b_no);

	public int getTournamentListCnt(TournamentSearchDTO tournamentSearchDTO);
}
