package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo.team.project.dao.SampleDAO;
import kosmo.team.project.dto.SampleDTO;
import kosmo.team.project.dto.SampleSearchDTO;

@Service
@Transactional
public class SampleServiceImplements implements SampleService {

	@Autowired
	private SampleDAO sampleDAO;

	@Override
	public int getSampleListAllCount() {

		int sampleListAllCount = sampleDAO.getSampleListAllCount();

		return sampleListAllCount;

	}

	@Override
	public int getSampleListCount(SampleSearchDTO sampleSearchDTO) {

		int sampleListCount = sampleDAO.getSampleListCount(sampleSearchDTO);

		return sampleListCount;

	}

	@Override
	public List<SampleDTO> getSampleList(SampleSearchDTO sampleSearchDTO) {

		List<SampleDTO> sampleList = sampleDAO.getSampleList(sampleSearchDTO);

		return sampleList;

	}

	@Override
	public SampleDTO getSampleDetailForm(int b_no) {

		sampleDAO.updateReadCount(b_no);

		SampleDTO sampleDTO = sampleDAO.getSampleDetailForm(b_no);

		return sampleDTO;

	}

	@Override
	public List<SampleDTO> getSampleDetailCommentList(int b_no) {

		List<SampleDTO> sampleDetailCommentList = sampleDAO.getSampleDetailCommentList(b_no);

		return sampleDetailCommentList;

	}

	@Override
	public SampleDTO getSampleDetailUpdateDeleteForm(int b_no) {

		SampleDTO sampleDTO = sampleDAO.getSampleDetailForm(b_no);

		return sampleDTO;

	}

	@Override
	public int updateSampleDetail(SampleDTO sampleDTO) {

		int sampleDetailCount = sampleDAO.getSampleDetailCount(sampleDTO.getB_no());

		if (sampleDetailCount == 0) {
			return 0;
		}

		int sampleDetailPasswordCount = sampleDAO.getSampleDetailPasswordCount(sampleDTO);

		if (sampleDetailPasswordCount == 0) {
			return -1;
		}

		int updateSampleDetailCount = sampleDAO.updateSampleDetail(sampleDTO);

		return updateSampleDetailCount;

	}

	@Override
	public int deleteSampleDetail(SampleDTO sampleDTO) {

		int sampleDetailCount = sampleDAO.getSampleDetailCount(sampleDTO.getB_no());

		if (sampleDetailCount == 0) {
			return 0;
		}

		int sampleDetailPasswordCount = sampleDAO.getSampleDetailPasswordCount(sampleDTO);

		if (sampleDetailPasswordCount == 0) {
			return -1;
		}

		int sampleDetailChildrenCount = sampleDAO.getSampleDetailChildrenCount(sampleDTO);

		if (sampleDetailChildrenCount > 0) {
			sampleDAO.updateSampleDetailEmpty(sampleDTO);
			return 2;
		}

		int deleteSampleDetailCount = sampleDAO.deleteSampleDetail(sampleDTO);

		return deleteSampleDetailCount;

	}

	@Override
	public int insertSampleRegister(SampleDTO sampleDTO) {

		if (sampleDTO.getB_no() > 0) {
			sampleDAO.updatePrintNoPlus1(sampleDTO);
		}

		int sampleRegisterCount = sampleDAO.insertSampleRegister(sampleDTO);

		return sampleRegisterCount;

	}

}
