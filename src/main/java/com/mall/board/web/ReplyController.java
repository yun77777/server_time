package com.mall.board.web;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mall.board.service.ReplyService;



@Controller
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Resource(name = "replyService")
	private ReplyService replyService;
	
	// 댓글 작성
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String posttWirte(Map<String, Object> paramMap) throws Exception {
		
		replyService.write(paramMap);
		
		return "redirect:/board/view?bno=" + paramMap.get("bno");
	}
}
