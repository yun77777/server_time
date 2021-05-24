package com.mall.mng.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.mall.board.service.boardService;
import com.mall.common.PaginationVO;
import com.mall.vo.CategoryVO;
import com.mall.vo.GoodsVO;
import com.mall.vo.GoodsViewVO;
import com.mysql.cj.xdevapi.JsonArray;
import com.mall.order.service.orderService;
import com.mall.mng.service.mngService;

@Controller
public class mngController {

	private static final Logger logger = LoggerFactory.getLogger(mngController.class);

	@Resource(name = "boardService")
	private boardService boardService;
	
	@Resource(name = "orderService")
	private orderService orderService;
	
	@Resource(name = "mngService")
	private mngService mngService;
	
	@RequestMapping(value = "/itemList.do")
	public String boardList(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="5") int recordCountPerPage,
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));

		paramMap.put("recordCountPerPage", recordCountPerPage);
		paramMap.put("currentPageNo", currentPageNo);
		
		paramMap.put("B_TYPE",4);

		try {
			PaginationVO pg = new PaginationVO(currentPageNo, recordCountPerPage, 3, 
					boardService.selectBoardListCnt(paramMap));
			
			paramMap.put("length",recordCountPerPage);
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
			List<Map<String,Object>> list=mngService.selectItemList(paramMap);
//			List<Map<String,Object>> list=boardService.selectBoardList(paramMap);
			
			model.addAttribute("list",list);
			model.addAttribute("paramMap",paramMap);
			model.addAttribute("pg",pg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return "mng/itemList";
	}
	
	@RequestMapping(value = "/itemDetail.do")
	public String boardDetail(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
//			paramMap.put("B_TYPE",4);
			
			Map<String,Object> detail=mngService.selectItemDetail(paramMap);
//			Map<String,Object> detail=boardService.selectBoardDetail(paramMap);
			System.err.println("detailP");
			System.err.println(detail);
			System.err.println(paramMap);
//			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);
			
			model.addAttribute("detail",detail);
//			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	return "mng/itemDetail";
	}
	
	@RequestMapping(value = "/itemInsert.do")
	public String boardInsert(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
			paramMap.put("B_TYPE",4);
			
			paramMap.put("no",boardService.selectBoardMaxNo(paramMap)+1);
			Map<String,Object> view=boardService.selectBoardDetail(paramMap);
			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);
			
			model.addAttribute("detail",view);
			model.addAttribute("list",list);
			model.addAttribute("paramMap",paramMap);
			
			List<CategoryVO> category = null;  // CatagoryVO 형태의 List형 변수 category 선언
			category = mngService.category();  // DB에 저장된 카테고리를 가져와서 category에 저장
			model.addAttribute("category", new Gson().toJson(category));  // 변수 category를 제이슨(json)타입으로 변환하여 category 세션에 부여
//			model.addAttribute("category", JSONArray.fromObject(category));  // 변수 category를 제이슨(json)타입으로 변환하여 category 세션에 부여

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "mng/itemInsert";
	}
	
//	@RequestMapping(value = "/itemInsert.do")
//	public String boardInsert(
//			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
//		try {
//			model.addAttribute("login",httpSession.getAttribute("login"));
//			model.addAttribute("member",httpSession.getAttribute("member"));
//			
//			paramMap.put("B_TYPE",4);
//			
//			paramMap.put("no",boardService.selectBoardMaxNo(paramMap)+1);
//			Map<String,Object> view=boardService.selectBoardDetail(paramMap);
//			System.err.println("detailP");
//			System.err.println(view);
//			System.err.println(paramMap);
//			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);
//			
//			model.addAttribute("detail",view);
//			model.addAttribute("list",list);
//			model.addAttribute("paramMap",paramMap);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
//		return "mng/itemInsert";
//	}
	
	@ResponseBody
	@RequestMapping(value = "/insertItem.do")
	public Map<String,Object> insertBoard(
			GoodsVO vo, MultipartFile file,
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));
		paramMap.put("B_TYPE",4);

		System.err.println("insert:"+paramMap);
		System.err.println("file:"+multi);
		
		try {
//			boardService.insertBoard(paramMap, multi, request);
			model.addAttribute("paramMap", paramMap);
			
			//@@@@@@@@@@
//			String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload 
//			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
//			String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
//					
//			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
//				// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
//				
//				fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
//		
//				// gdsImg에 원본 파일 경로 + 파일명 저장
//				vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//				// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
//				vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
//				
//			} else {  // 첨부된 파일이 없으면
//				fileName = File.separator + "images" + File.separator + "none.png";
//				// 미리 준비된 none.png파일을 대신 출력함
//				
//				vo.setGdsImg(fileName);
//				vo.setGdsThumbImg(fileName);
//			}
			
			
			System.out.println("=================");
			
			System.out.println("1 = " + vo.getGdsName());
			System.out.println("1 = " + vo.getGdsPrice());
			System.out.println("1 = " + vo.getGdsDes());
			System.out.println("1 = " + vo.getGdsImg());
			System.out.println("=================");
								
			mngService.register(vo, paramMap, multi, request);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
//	@ResponseBody
//	@RequestMapping(value = "/insertItem.do")
//	public Map<String,Object> insertBoard(
//			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
//		model.addAttribute("login",httpSession.getAttribute("login"));
//		model.addAttribute("member",httpSession.getAttribute("member"));
//		paramMap.put("B_TYPE",4);
//		
//		System.err.println("insert:"+paramMap);
//		System.err.println("file:"+multi);
//		
//		try {
//			if(paramMap.get("no").toString()!=null||!paramMap.get("no").toString().trim().equals(""))
//				paramMap.put("no",paramMap.get("no"));
//			boardService.insertBoard(paramMap, multi, request);
//			model.addAttribute("paramMap", paramMap);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
//		return paramMap;
//	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteItem.do")
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
	
	
}
