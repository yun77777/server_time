package com.mall.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.board.service.ReplyService;
import com.mall.common.PaginationVO;



@Controller
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Resource(name = "replyService")
	private ReplyService replyService;
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping(value = "/reply/write.do")
	public Map<String, Object> posttWirte(
			@RequestParam(value="bno") String bno,
			@RequestParam(value="writer") String writer,
			@RequestParam(value="content") String content,
			Map<String, Object> paramMap,
			HttpSession httpSession,
			HttpServletRequest request, Model model) throws Exception {
		System.err.println(paramMap);
		paramMap.put("bno",bno);
		paramMap.put("writer",writer);
		paramMap.put("content",content);
		replyService.write(paramMap);
		List<Map<String, Object>> list=replyService.list(Integer.parseInt(paramMap.get("bno").toString()));
		Map<String, Object> result=new HashMap<String, Object>();
		int len=list.size();
		System.err.println("list@:"+list);
		result.put("list",list);
		result.put("paramMap",paramMap);
		result.put("len",len);
		return result;
	}
	
	
//@RequestMapping(value = "/reply/write.do")
//public String replyWrite( @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
//	model.addAttribute("login",httpSession.getAttribute("login"));
//	model.addAttribute("member",httpSession.getAttribute("member"));
//	
//	try {
//		System.err.println(paramMap);
//		replyService.write(paramMap);
//		List<Map<String, Object>> list=replyService.list(Integer.parseInt(paramMap.get("bno").toString()));
//		System.err.println("list@:"+list);
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
//	
//return "board/boardList";
//}
}