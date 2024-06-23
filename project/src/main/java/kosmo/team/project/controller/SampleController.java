package kosmo.team.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

///   깃 테스트
//깃테스트 2
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.SampleDTO;
import kosmo.team.project.dto.SampleSearchDTO;
import kosmo.team.project.service.SampleService;
import kosmo.team.project.utility.Page;

// ----------------------------------
//	1.Git Push Test
// ----------------------------------
//----------------------------------
//	2.Git Push Test
//----------------------------------

@Controller
public class SampleController {

	private final String FOLDER = "/sample"; 
	
	@Autowired
	private SampleService sampleService;

	@RequestMapping(value = "/sampleList.controller")
	public ModelAndView sampleList(SampleSearchDTO sampleSearchDTO) {

		int sampleListAllCount = sampleService.getSampleListAllCount();

		int sampleListCount = sampleService.getSampleListCount(sampleSearchDTO);

		Map<String, Integer> sampleMap = Page.getPagingMap(sampleSearchDTO.getSelectPageNo(),
				sampleSearchDTO.getRowCntPerPage(), sampleListCount);

		sampleSearchDTO.setSelectPageNo((int) sampleMap.get("selectPageNo"));
		sampleSearchDTO.setRowCntPerPage((int) sampleMap.get("rowCntPerPage"));
		sampleSearchDTO.setBegin_rowNo((int) sampleMap.get("begin_rowNo"));
		sampleSearchDTO.setEnd_rowNo((int) sampleMap.get("end_rowNo"));

		List<SampleDTO> sampleList = sampleService.getSampleList(sampleSearchDTO);

		ModelAndView mav = new ModelAndView();
		mav.addObject("sampleList", sampleList);
		mav.addObject("sampleShowListCount", sampleList.size());
		mav.addObject("sampleListCount", sampleListCount);
		mav.addObject("sampleListAllCount", sampleListAllCount);
		mav.addObject("sampleMap", sampleMap);

		mav.setViewName("/sample/sampleList.jsp");
		mav.setViewName( FOLDER + "/sampleList.jsp");

		return mav;

	}

	@RequestMapping(value = "/sampleDetailForm.controller")
	public ModelAndView sampleDetailForm(@RequestParam(value = "b_no") int b_no) {

		SampleDTO sampleDTO = sampleService.getSampleDetailForm(b_no);
		List<SampleDTO> sampleDetailCommentList = sampleService.getSampleDetailCommentList(b_no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("sampleDTO", sampleDTO);
		mav.addObject("sampleDetailCommentList", sampleDetailCommentList);
		mav.setViewName("/sample/sampleDetailForm.jsp");

		return mav;

	}

	@RequestMapping(value = "/sampleDetailUpdateDeleteForm.controller")
	public ModelAndView sampleDetailUpdateDeleteForm(@RequestParam(value = "b_no") int b_no) {

		SampleDTO sampleDTO = sampleService.getSampleDetailUpdateDeleteForm(b_no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("sampleDTO", sampleDTO);
		mav.setViewName("/sample/sampleDetailUpdateDeleteForm.jsp");

		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/sampleDetailUpdateProcedure.controller", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, String> sampleDetailUpdateProcedure(SampleDTO sampleDTO) {

		Map<String, String> resultMap = new HashMap<String, String>();

		int updateSampleDetailCount = sampleService.updateSampleDetail(sampleDTO);

		resultMap.put("result", updateSampleDetailCount + "");

		return resultMap;

	}

	@ResponseBody
	@RequestMapping(value = "/sampleDetailDeleteProcedure.controller", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, String> boardDelProc(SampleDTO sampleDTO) {

		Map<String, String> resultMap = new HashMap<String, String>();

		int deleteSampleDetailCount = sampleService.deleteSampleDetail(sampleDTO);

		resultMap.put("result", deleteSampleDetailCount + "");

		return resultMap;

	}

	@RequestMapping(value = "/sampleRegisterForm.controller")
	public ModelAndView sampleRegisterForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sample/sampleRegisterForm.jsp");

		return mav;

	}

	@ResponseBody
	@RequestMapping(value = "/sampleRegisterProcedure.controller", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, String> sampleRegisterProcedure(SampleDTO sampleDTO) {

		Map<String, String> resultMap = new HashMap<String, String>();

		int sampleRegisterCount = sampleService.insertSampleRegister(sampleDTO);

		resultMap.put("result", sampleRegisterCount + "");

		return resultMap;

	}
	

}
