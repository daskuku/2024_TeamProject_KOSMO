package kosmo.team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kosmo.team.project.dto.SampleDTO;
import kosmo.team.project.dto.SampleSearchDTO;

@Mapper
public interface SampleDAO {

	public int getSampleListAllCount();

	public int getSampleListCount(SampleSearchDTO sampleSearchDTO);

	public List<SampleDTO> getSampleList(SampleSearchDTO sampleSearchDTO);

	public int updateReadCount(int b_no);

	public SampleDTO getSampleDetailForm(int b_no);

	public List<SampleDTO> getSampleDetailCommentList(int b_no);

	public int getSampleDetailCount(int b_no);

	public int getSampleDetailPasswordCount(SampleDTO sampleDTO);

	public int updateSampleDetail(SampleDTO sampleDTO);

	public int getSampleDetailChildrenCount(SampleDTO sampleDTO);

	public int updateSampleDetailEmpty(SampleDTO sampleDTO);

	public int deleteSampleDetail(SampleDTO sampleDTO);

	public int updatePrintNoPlus1(SampleDTO sampleDTO);

	public int insertSampleRegister(SampleDTO sampleDTO);

}
