package com.mall.board.web;

import java.util.ArrayList;
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
			
			paramMap.put("cateCode1",7);
			List<Map<String, Object>> list1=mngService.selectItemMainList(paramMap);
			paramMap.put("cateCode1",9);
			List<Map<String, Object>> list2=mngService.selectItemMainList(paramMap);
			paramMap.put("cateCode1",10);
			List<Map<String, Object>> list3=mngService.selectItemMainList(paramMap);
			paramMap.put("cateCode1",12);
			List<Map<String, Object>> list4=mngService.selectItemMainList(paramMap);
//			List<Map<String, Object>> list=mngService.selectItemList(paramMap);
//			List<Map<String, Object>> list=boardService.selectItemList(paramMap);
			System.err.println("list1:"+list1);
			System.err.println("list2:"+list2);
			
			model.addAttribute("list1",list1);
			model.addAttribute("list2",list2);
			model.addAttribute("list3",list3);
			model.addAttribute("list4",list4);
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
//			if(paramMap.get("replyType")!=null && paramMap.get("replyType").toString().equals("Y")) {
//				//paramMap.put("originNo",paramMap.get("no"));
//				paramMap.put("title",paramMap.get("title"));
//				
//				paramMap.put("B_NO",Integer.parseInt(boardService.selectBoardMaxNo(paramMap).toString())+1);
//
//				paramMap.put("groupOrd",Integer.parseInt(paramMap.get("groupOrd").toString())+1);//기존groupOrd+1
//				paramMap.put("groupLayer",Integer.parseInt(paramMap.get("groupLayer").toString())+1);//부모글 groupLayer+1
//				
//				paramMap.put("newGroupOrd",Integer.parseInt(paramMap.get("groupOrd").toString()));//기존groupOrd+1
//				paramMap.put("newGroupLayer",Integer.parseInt(paramMap.get("groupLayer").toString()));//부모글 groupLayer+1
//				
//				boardService.insertReply(paramMap, request);
////				boardService.updateReply(paramMap);
//			}
			Map<String,Object> detail=boardService.selectBoardDetail(paramMap);
			System.err.println("detailP");
			System.err.println(paramMap);
			System.err.println(detail);
			
			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);
			List<Map<String,Object>> fileList=boardService.selectBoardFileList(paramMap);
			System.err.println(Integer.parseInt(paramMap.get("no").toString()));
			List<Map<String,Object>> replyList=replyService.list(Integer.parseInt(paramMap.get("no").toString()));
//			if(paramMap.get("replyType")!=null && paramMap.get("replyType").toString().equals("Y")) {
//				paramMap.put("B_NO",paramMap.get("no"));
//				paramMap.put("title",paramMap.get("title"));
//				
//				
//				paramMap.put("newGroupOrd",Integer.parseInt(paramMap.get("groupOrd").toString())+1);//기존groupOrd+1
//				paramMap.put("newGroupLayer",Integer.parseInt(paramMap.get("groupLayer").toString())+1);//부모글 groupLayer+1
//				
//				boardService.insertReply(paramMap, request);
//				boardService.updateReply(paramMap);
//			}
			
			
			int len=boardService.selectBoardMaxNo(paramMap);

			model.addAttribute("detail",detail);
			model.addAttribute("list",list);
			model.addAttribute("replyList",replyList);
			model.addAttribute("fileList",fileList);
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
			MultipartHttpServletRequest multi, 
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));

		System.err.println("insert:"+paramMap);
		System.err.println("file:"+multi);
		
		paramMap.put("B_TYPE",1);
		//paramMap.put("no",Integer.parseInt(paramMap.get("no").toString())+1);
		//paramMap.put("originNo",paramMap.get("no"));

		try {
			if(paramMap.get("no").toString()!=null||!paramMap.get("no").toString().trim().equals(""))
				paramMap.put("no",paramMap.get("no"));
			
			if(paramMap.get("replyType")!=null && paramMap.get("replyType").toString().equals("Y")) {
				//paramMap.put("originNo",paramMap.get("no"));
				paramMap.put("title",paramMap.get("title"));
				
				paramMap.put("B_NO",Integer.parseInt(boardService.selectBoardMaxNo(paramMap).toString())+1);

				paramMap.put("groupOrd",Integer.parseInt(paramMap.get("groupOrd").toString())+1);//기존groupOrd+1
				paramMap.put("groupLayer",Integer.parseInt(paramMap.get("groupLayer").toString())+1);//부모글 groupLayer+1
				
				paramMap.put("newGroupOrd",Integer.parseInt(paramMap.get("groupOrd").toString()));//기존groupOrd+1
				paramMap.put("newGroupLayer",Integer.parseInt(paramMap.get("groupLayer").toString()));//부모글 groupLayer+1
				
				boardService.insertReply(paramMap, request);
//				boardService.updateReply(paramMap);
			}else {
				System.err.println("asmkdlmslkdmzklxcmklzcxm");
				System.err.println(paramMap);
				boardService.insertBoard(paramMap, files, fileNames, multi);
			}
			
			
			model.addAttribute("paramMap", paramMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateBoard.do")
	public String updateBoard(
			@RequestParam Map<String, Object> paramMap,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			 HttpSession httpSession,
			 MultipartHttpServletRequest multi) throws Exception {
		//paramMap.put("B_TYPE",1);
		
		System.err.println("PARAM:"+paramMap);
		try {
//			paramMap.put("update","Y");
			boardService.updateBoard(paramMap, files, fileNames, multi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}

	
	@ResponseBody
	@RequestMapping(value = "/deleteBoard.do")
	public Map<String,Object> deleteBoard(
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));

			boardService.deleteBoard(paramMap, request);
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
			boardService.insertReply(paramMap, request);

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
	
	
	
	@RequestMapping(value = "/itemList.do")
	public String itemList(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="20") int recordCountPerPage , @RequestParam Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO, HttpSession httpSession, Model model) {
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
			
			List<Map<String, Object>> list1=new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> list2=new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> list3=new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> list4=new ArrayList<Map<String,Object>>();
			
			if(paramMap.get("itemType")!=null && paramMap.get("itemType").toString().equals("top")) {
				paramMap.put("cateCode1",7);
				list1=mngService.selectItemMainList(paramMap);
				model.addAttribute("list1",list1);
			} else if(paramMap.get("itemType")!=null && paramMap.get("itemType").toString().equals("bottom")) {
				paramMap.put("cateCode1",9);
				list2=mngService.selectItemMainList(paramMap);
				model.addAttribute("list2",list2);
			} else if(paramMap.get("itemType")!=null && paramMap.get("itemType").toString().equals("shoes")) {
				paramMap.put("cateCode1",10);
				list3=mngService.selectItemMainList(paramMap);
				model.addAttribute("list3",list3);
			} else if(paramMap.get("itemType")!=null && paramMap.get("itemType").toString().equals("pet")) {
				paramMap.put("cateCode1",12);
				list4=mngService.selectItemMainList(paramMap);
				model.addAttribute("list4",list4);
			}
			
			
			model.addAttribute("pg",pg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "board/itemList";
	}
}
