package com.semi.festopia.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.semi.festopia.model.dto.SearchDTO;
import com.semi.festopia.model.vo.Festival;
import com.semi.festopia.service.FavoriteService;
import com.semi.festopia.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private FavoriteService favService;
	
	@GetMapping("search")
	public String search(SearchDTO dto, Model model) throws JsonProcessingException {
		List<Festival> list = searchService.searchFestival(dto);
		model.addAttribute("list", list);
		
		ObjectMapper mapper = new ObjectMapper();
		String dtoJson = mapper.writeValueAsString(dto);
		model.addAttribute("dto", dtoJson);
		return "searchResult";
	}
	
	@ResponseBody
	@PostMapping("/search")
	public List<Festival> search(Model model) {
		return searchService.popularFestival();
	}

	@GetMapping("searchResultMap")
	public String searchResultMap(SearchDTO dto, Model model) {
		if(dto.getCheckFeeStatus() != null) {
			List<Festival> list = searchService.searchFestival(dto);
			model.addAttribute("list", list);
			return "searchResult";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping("viewCount")
	public String viewCount(int fesCode) {
		searchService.updateViewCnt(fesCode);
		return "redirect:/searchResult";
	}

	@ResponseBody
	@GetMapping("calendar")
	public List<Festival> calendarFes(String startDate) {
		return searchService.calendarFes(startDate);
	}

}
