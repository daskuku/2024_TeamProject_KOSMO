package kosmo.team.project.service;

import java.util.List;

import kosmo.team.project.dto.SampleDTO;
import kosmo.team.project.dto.SampleSearchDTO;

public interface SampleService {

	public int getSampleListAllCount();

	public int getSampleListCount(SampleSearchDTO sampleSearchDTO);

	public List<SampleDTO> getSampleList(SampleSearchDTO sampleSearchDTO);

	public SampleDTO getSampleDetailForm(int b_no);

	public List<SampleDTO> getSampleDetailCommentList(int b_no);

	public SampleDTO getSampleDetailUpdateDeleteForm(int b_no);

	public int updateSampleDetail(SampleDTO sampleDTO);

	public int deleteSampleDetail(SampleDTO sampleDTO);

	public int insertSampleRegister(SampleDTO sampleDTO);

}
