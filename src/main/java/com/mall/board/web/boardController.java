package com.mall.board.web;

import java.util.List;
import java.util.Map;
import com.mall.common.PaginationVO;
import com.mall.user.LoginDTO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.board.service.boardService;



@Controller
public class boardController {
	
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	@Resource(name = "boardService")
	private boardService boardService;
	
//	@RequestMapping(value = "/test.do")
//	public String test(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="20") int recordCountPerPage,
//			@RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request, Model model) throws Exception {
//		
//		return "test";
//	}
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test(Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO, HttpSession httpSession, Model model) {
		System.err.println("test:"+httpSession.getAttribute("login"));
		model.addAttribute("login",httpSession.getAttribute("login"));
		return "/test";
	}
	
	@RequestMapping(value = "/about.do")
	public String about(Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO, HttpSession httpSession, Model model) {
		System.err.println(httpSession.getAttribute("login"));
		model.addAttribute("login",httpSession.getAttribute("login"));
		return "/about";
	}
	
	@RequestMapping(value = "/boardList.do")
	public String boardList(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="5") int recordCountPerPage,
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		
		paramMap.put("recordCountPerPage", recordCountPerPage);
		paramMap.put("currentPageNo", currentPageNo);
		
		try {
			PaginationVO pg = new PaginationVO(currentPageNo, recordCountPerPage, 3, 
					boardService.selectBoardListCnt(paramMap));
			
			paramMap.put("length",recordCountPerPage);
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
			List<Map<String,Object>> list=boardService.selectBoardList(paramMap);
			
			model.addAttribute("list",list);
			model.addAttribute("paramMap",paramMap);
			model.addAttribute("pg",pg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return "board/boardList";
	}
	
	@RequestMapping(value = "/boardDetail.do")
	public String boardDetail(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));

			Map<String,Object> detail=boardService.selectBoardDetail(paramMap);
			System.err.println("detailP");
			System.err.println(paramMap);
//			int no=Integer.parseInt(paramMap.get("no").toString());
//			System.err.println("no:"+no);
//			
//			//rownum
//			paramMap.put("contentNo",no-1);
//			Map<String,Object> beforeContent=boardService.selectContent(paramMap);
//			paramMap.put("contentNo",no+1);
//			Map<String,Object> afterContent=boardService.selectContent(paramMap);
			
			
			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);

//			System.err.println("before@@@");
//			System.err.println(beforeContent);
//			System.err.println("after@@@");
//			System.err.println(afterContent);
			
			model.addAttribute("detail",detail);
			model.addAttribute("list",list);
//			model.addAttribute("beforeContent",beforeContent);
//			model.addAttribute("afterContent",afterContent);
			System.err.println("detaiL@@@@@@@");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	return "board/boardDetail";
	}
	
	@RequestMapping(value = "/boardInsert.do")
	public String boardInsert(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));

			paramMap.put("no",boardService.selectBoardMaxNo(paramMap)+1);
			model.addAttribute("paramMap",paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	return "board/boardInsert";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertBoard.do")
	public Map<String,Object> insertBoard(
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));

		System.err.println("@@@@@@@@@@@@@@@@@@@");
		System.err.println(paramMap.get("content"));
		System.err.println("@@@@@@@@@@@@@@@@@@@");
		try {
			if(paramMap.get("no").toString()!=null||!paramMap.get("no").toString().trim().equals(""))
				paramMap.put("no",paramMap.get("no"));
			boardService.insertBoard(paramMap, multi, request);
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteBoard.do")
	public Map<String,Object> deleteBoard(
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));

			boardService.deleteBoard(paramMap, multi, request);
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
	
	
	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
	public String loginProcess(@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request) {
//		public String loginProcess(@RequestParam String id, HttpServletRequest request) {
		Map<String, Object> login=(Map<String, Object>) httpSession.getAttribute("login");
    	String id = request.getSession().getId();
		System.err.println("xxx");
		logger.info("Welcome "+id);

		httpSession.setAttribute("id", id);
		
		if(login==null)
			httpSession.setAttribute("ID", "게스트");
		else
			httpSession.setAttribute("ID", login.get("ID"));
		System.err.println("id:"+httpSession.getAttribute("id"));
		System.err.println("login:"+httpSession.getAttribute("login"));
		System.err.println("login2"+login);
		return "chat/chattingview";
//		System.err.println("xxx");
//		logger.info("Welcome "+id);
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("id", id);
//		return "chat/chattingview";
	}
	
	
	
	
}
