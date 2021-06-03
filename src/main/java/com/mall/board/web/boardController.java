package com.mall.board.web;

import java.util.List;
import java.util.Map;

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

import com.mall.board.service.ReplyService;
import com.mall.board.service.boardService;
import com.mall.common.PaginationVO;
import com.mall.mng.service.mngService;
import com.mall.user.LoginDTO;



@Controller
public class boardController {
	
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	@Resource(name = "boardService")
	private boardService boardService;
	
	@Resource(name = "mngService")
	private mngService mngService;
	
	@Resource(name = "replyService")
	private ReplyService replyService;
	
//	@RequestMapping(value = "/test.do")
//	public String test(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="20") int recordCountPerPage,
//			@RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request, Model model) throws Exception {
//		
//		return "test";
//	}
	@RequestMapping(value = "/test.do")
	public String test(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="20") int recordCountPerPage ,Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO, HttpSession httpSession, Model model) {
		System.err.println("test@@@:"+httpSession.getAttribute("login"));
		System.err.println("member@@@:"+httpSession.getAttribute("member"));
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));
		model.addAttribute("k_userInfo", httpSession.getAttribute("k_userInfo"));
		System.err.println("kxx:"+httpSession.getAttribute("k_userInfo"));

		try {
			paramMap.put("B_TYPE",4);
			paramMap.put("PAGE_TYPE","main");
			
			//카테고리별 페이징기능 추가@
			
			PaginationVO pg = new PaginationVO(currentPageNo, recordCountPerPage, 3, 
					mngService.selectItemListCnt(paramMap));
			
			paramMap.put("length",recordCountPerPage);
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
			List<Map<String, Object>> list=mngService.selectItemList(paramMap);
//			List<Map<String, Object>> list=boardService.selectItemList(paramMap);
			System.err.println("li:"+list);
			
			model.addAttribute("list",list);
			model.addAttribute("pg",pg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "/test";
	}
	
	@ResponseBody
	@RequestMapping(value = "/testPg.do")
	public Map<String,Object> testPg(Map<String, Object> paramMap, HttpSession httpSession, Model model) {

		System.err.println("test@@@:"+httpSession.getAttribute("login"));
		
		System.err.println("member@@@:"+httpSession.getAttribute("member"));
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));
		System.err.println("param:"+paramMap);
		try {
			paramMap.put("B_TYPE",4);
			paramMap.put("PAGE_TYPE","main");
			
			//카테고리별 페이징기능 추가@
			
			PaginationVO pg = new PaginationVO(Integer.parseInt(paramMap.get("currentPageNo").toString()), 6, 3, 
					mngService.selectItemListCnt(paramMap));
			
			paramMap.put("length",Integer.parseInt(paramMap.get("currentPageNo").toString()));
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
			List<Map<String, Object>> list=mngService.selectItemList(paramMap);
//			List<Map<String, Object>> list=boardService.selectItemList(paramMap);
			System.err.println("li:"+list);
			
			model.addAttribute("list",list);
			model.addAttribute("pg",pg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return paramMap;
	}
	
	@RequestMapping(value = "/about.do")
	public String about(Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO, HttpSession httpSession, Model model) {
		System.err.println(httpSession.getAttribute("login"));
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));

		return "/about";
	}
	
	@RequestMapping(value = "/boardList.do")
	public String boardList(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="5") int recordCountPerPage,
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));


		paramMap.put("recordCountPerPage", recordCountPerPage);
		paramMap.put("currentPageNo", currentPageNo);
		
		paramMap.put("B_TYPE",1);
		
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
			model.addAttribute("member",httpSession.getAttribute("member"));
			
			paramMap.put("B_TYPE",1);

			Map<String,Object> detail=boardService.selectBoardDetail(paramMap);
			System.err.println("detailP");
			System.err.println(paramMap);
			System.err.println(detail);
			
			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);
			System.err.println(Integer.parseInt(paramMap.get("no").toString()));
			List<Map<String,Object>> replyList=replyService.list(Integer.parseInt(paramMap.get("no").toString()));
			
			if(paramMap.get("originNo")!=null) {
				paramMap.put("B_NO",paramMap.get("no"));
				paramMap.put("title",paramMap.get("title"));
				boardService.insertReply(paramMap, request);
			}
			
			
			
			int len=boardService.selectBoardMaxNo(paramMap)+1;

			model.addAttribute("detail",detail);
			model.addAttribute("list",list);
			model.addAttribute("replyList",replyList);
			model.addAttribute("len",len);
			model.addAttribute("paramMap",paramMap);
			

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
			model.addAttribute("member",httpSession.getAttribute("member"));
			
			paramMap.put("B_TYPE",1);

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
		model.addAttribute("member",httpSession.getAttribute("member"));

		System.err.println("insert:"+paramMap);
		System.err.println("file:"+multi);
		
		paramMap.put("B_TYPE",1);

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
	
//	@RequestMapping(value="/displayImages.do")
//	public String displayImages(@RequestParam(value="file_no") String file_no, HttpServletResponse response)throws Exception{
//
//		Map<String, Object> map = new HashMap<String, Object>();
//	    map.put("file_no", file_no);
//		Map<String, Object> result = boardService.selectFile(map);
//		System.err.println("map@:"+map);
//		System.err.println("result@:"+result);
//		response.setContentType("image/jpg");
//	    ServletOutputStream bout = response.getOutputStream();
//	    //파일의 경로
//	    String imgpath = map.get("FILE_PATH").toString();
//	    System.err.println(File.separator);
////	    String imgpath = map.get("path")+File.separator+result.get("file");
//	    FileInputStream f = new FileInputStream(imgpath);
//	    int length;
//	    byte[] buffer = new byte[10];
//	    while((length=f.read(buffer)) != -1){
//	    	bout.write(buffer,0,length);
//	    }
//	    return null;
//	}
	
	
	@ResponseBody
	@RequestMapping(value = "/deleteBoard.do")
	public Map<String,Object> deleteBoard(
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));

			boardService.deleteBoard(paramMap, multi, request);
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
	
	
	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
	public String loginProcess(@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) {
//		public String loginProcess(@RequestParam String id, HttpServletRequest request) {
		Map<String, Object> login=(Map<String, Object>) httpSession.getAttribute("login");
		model.addAttribute("member",httpSession.getAttribute("member"));

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
	
	@ResponseBody
	@RequestMapping(value = "/insertReply.do")
	public Map<String,Object> insertReply(
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));

		System.err.println("insert:"+paramMap);
		System.err.println("file:"+multi);
		
		paramMap.put("B_TYPE",1);

		try {
			if(paramMap.get("no").toString()!=null||!paramMap.get("no").toString().trim().equals(""))
				paramMap.put("no",paramMap.get("no"));
			
			paramMap.put("B_NO",paramMap.get("no"));
			paramMap.put("originNo",paramMap.get("no"));
			paramMap.put("groupOrd",Integer.parseInt(paramMap.get("no").toString())+1);
			paramMap.put("groupLayer",Integer.parseInt(paramMap.get("no").toString())+1);
			paramMap.put("title","[Re:] "+paramMap.get("title"));
			
			boardService.insertReply(paramMap, request);
			
			int replyNo=boardService.selectBoardListCnt(paramMap)+1;
			paramMap.put("replyNo",replyNo);
			
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
	
	@RequestMapping(value = "/replyInsert.do")
	public String replyInsert(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
			paramMap.put("B_TYPE",1);

			paramMap.put("no",boardService.selectBoardMaxNo(paramMap)+1);
			model.addAttribute("paramMap",paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	return "board/boardInsert";
	}
}
