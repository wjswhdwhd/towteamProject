package com.myneko.client.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myneko.client.review.service.ReviewService;
import com.myneko.client.review.vo.ReviewVO;
import com.myneko.common.file.FileUploadUtil;
import com.myneko.common.page.Paging;
import com.myneko.common.util.Util;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰목록
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)

	public String reviewList(@ModelAttribute ReviewVO rvo, Model model) {
		System.out.println("reviewList 호출 성공");

		Paging.setPage(rvo);
		
		int total = reviewService.reviewCnt(rvo);
		int count = total - (Util.nvl(rvo.getPage()) - 1) * Util.nvl(rvo.getPageSize());
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		model.addAttribute("data", rvo);

		return "client/review/reviewList";
	}

	// reviewWriteForm 출력하기

	@RequestMapping(value = "/reviewWriteForm")
	public String reviewWriteForm() {
		log.info("reviewWriteForm 호출 성공");
		return "review/reviewWriteForm";
	}

	// review 쓰기 구현
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String reviewInsert(@ModelAttribute ReviewVO rvo, Model model, HttpServletRequest request) throws Exception {
		log.info("reviewInsert 호출 성공");

		int result = 0;
		String url = "";

		if (rvo.getFile() != null) {
			String r_file = FileUploadUtil.fileUpload(rvo.getFile(), request, "review");
			rvo.setR_image(r_file);
		}
		result = reviewService.reviewInsert(rvo);
		if (result == 1) {
			url = "/review/reviewList";
		} else {
			url = "/review/reviewWriteForm";
		}
		return "redirect:" + url;
	}

	// review 상세보기 구현
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public String reviewDetail(@ModelAttribute ReviewVO rvo, Model model) {
		log.info("reviewDetail 호출 성공");
		log.info("r_number=" + rvo.getR_number());

		ReviewVO detail = new ReviewVO();
		detail = reviewService.reviewDetail(rvo);

		if (detail != null) {
			detail.setR_content(detail.getR_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("reviewDetail", detail);

		return "client/review/reviewDetail";
	}

	// 글 수정 폼 출력 하기
	@RequestMapping(value = "/updateForm", method=RequestMethod.GET)
	public String updateForm(@ModelAttribute ReviewVO rvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("r_number=" + rvo.getR_number());
		ReviewVO updateData = new ReviewVO();
		updateData = reviewService.reviewDetail(rvo);

		model.addAttribute("updateData", updateData);
		return "client/review/updateForm";
	}

	// review 글수정 구현
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int reviewUpdate(@ModelAttribute("ReviewVO") ReviewVO rvo, HttpServletRequest request) throws Exception {
		log.info("reviewUpdate 호출 성공");
		
		log.info(rvo.toString());
		
		int result = 0;
		
		if (rvo.getFile() != null) {
			String r_image = FileUploadUtil.fileUpload(rvo.getFile(), request, "review");
			rvo.setR_image(r_image);
		}
		
		result = reviewService.reviewUpdate(rvo);
		
		return result;
		
	}
	
	//review 삭제 구현하기
	@RequestMapping(value="/reviewDelete", method=RequestMethod.GET)
	@ResponseBody
	public int reviewDelete(@RequestParam(name="r_number") int r_number, @RequestParam(name="r_image", required=false) String r_image, HttpServletRequest request) throws Exception {
		log.info("reviewDelete 호출 성공");
		
		int result = 0;
		
		if (r_image != null) {
			FileUploadUtil.fileDelete(r_image, request);
		}
		
		result = reviewService.reviewDelete(r_number);
		
		return result;
		
	}
}
