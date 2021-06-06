package com.mall.mng.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.board.service.boardService;
import com.mall.common.PaginationVO;
import com.mall.mng.service.mngService;
import com.mall.order.service.orderService;
import com.mall.vo.GoodsVO;

@Controller
@RequestMapping("/mng")
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
	
	@RequestMapping(value = "/orderList.do")
	public String orderListMng(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="5") int recordCountPerPage,
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));
		
		paramMap.put("recordCountPerPage", recordCountPerPage);
		paramMap.put("currentPageNo", currentPageNo);
		
		paramMap.put("B_TYPE",4);
		
		try {
			PaginationVO pg = new PaginationVO(currentPageNo, recordCountPerPage, 3, 
					mngService.selectOrderListCnt(paramMap));
			
			paramMap.put("length",recordCountPerPage);
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
			List<Map<String,Object>> list=mngService.selectOrderList(paramMap);
			
			model.addAttribute("list",list);
			model.addAttribute("paramMap",paramMap);
			model.addAttribute("pg",pg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "mng/orderList";
	}
	
	@RequestMapping(value = "/orderDetail.do")
	public String orderDetail(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
//			paramMap.put("B_TYPE",4);
			
			List<Map<String, Object>> detailList=mngService.selectOrderDetail(paramMap);
			System.err.println("detailP");
			System.err.println(paramMap);
			paramMap.put("L_CATEGORY",1);
			List<Map<String, Object>> category1=mngService.selectCategoryCode(paramMap);
			paramMap.put("L_CATEGORY",2);
			List<Map<String, Object>> category2=mngService.selectCategoryCode(paramMap);
			model.addAttribute("category1",category1);
			model.addAttribute("category2",category2);
		
			model.addAttribute("detailList",detailList);
			model.addAttribute("paramMap",paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	return "mng/orderDetail";
	}
	
	@RequestMapping(value = "/itemDetail.do")
	public String boardDetail(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
//			paramMap.put("B_TYPE",4);
			
			Map<String,Object> detail=mngService.selectItemDetail(paramMap);
			List<Map<String,Object>> imgList=mngService.selectItemImgList(paramMap);

			System.err.println("detailP");
			System.err.println(detail);
			System.err.println(paramMap);
//			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);
			paramMap.put("L_CATEGORY",1);
			List<Map<String, Object>> category1=mngService.selectCategoryCode(paramMap);
			paramMap.put("L_CATEGORY",2);
			List<Map<String, Object>> category2=mngService.selectCategoryCode(paramMap);
			model.addAttribute("category1",category1);
			model.addAttribute("category2",category2);
		
			model.addAttribute("detail",detail);
			model.addAttribute("imgList",imgList);
			model.addAttribute("len",imgList.size());
//			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	return "mng/itemDetail";
	}
	
	@RequestMapping(value = "/itemInsert.do")
	public String itemInsert(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
			paramMap.put("B_TYPE",4);
			paramMap.put("gdsNum",mngService.selectItemListMaxNo(paramMap)+1);
			Map<String,Object> view=boardService.selectBoardDetail(paramMap);
			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);
			
			model.addAttribute("detail",view);
			model.addAttribute("list",list);
			model.addAttribute("paramMap",paramMap);
			
//			List<CategoryVO> category = null;  // CatagoryVO 형태의 List형 변수 category 선언
//			category = mngService.category();  // DB에 저장된 카테고리를 가져와서 category에 저장
//			model.addAttribute("category", new Gson().toJson(category));  // 변수 category를 제이슨(json)타입으로 변환하여 category 세션에 부여
////			model.addAttribute("category", JSONArray.fromObject(category));  // 변수 category를 제이슨(json)타입으로 변환하여 category 세션에 부여

			paramMap.put("L_CATEGORY",1);
			List<Map<String, Object>> category1=mngService.selectCategoryCode(paramMap);
			paramMap.put("L_CATEGORY",2);
			List<Map<String, Object>> category2=mngService.selectCategoryCode(paramMap);
			System.err.println("@@@cate1:"+category1);
			model.addAttribute("category1",category1);
			model.addAttribute("category2",category2);

		
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "mng/itemInsert";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/insertItem.do")
	public Map<String,Object> insertBoard(
			@RequestParam Map<String, Object> paramMap,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			 HttpSession httpSession,
			 MultipartHttpServletRequest multi) throws Exception {		
		paramMap.put("B_TYPE",4);
//gdsNum
		//paramMap.put("gdsNum",mngService.selectItemListMaxNo(paramMap)+1);

		System.err.println("insert:"+paramMap);
		System.err.println("file:"+multi);
		
		try {
//			boardService.insertBoard(paramMap, multi, request);
			
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
			
			
								
			mngService.register(paramMap, multi);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateItem.do")
	public String updateItem(
			@RequestParam Map<String, Object> paramMap,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			 HttpSession httpSession,
			 MultipartHttpServletRequest multi) throws Exception {
		//Map<String, Object> paramMap=new HashMap<String, Object>();
//		paramMap.put("B_TYPE",4);
//		paramMap.put("no",paramMap.get("gdsNum"));
//		System.err.println("insert:"+paramMap);
		paramMap.put("B_TYPE",4);
//		String fileNoDel=paramMap.get("fileNoDel").toString();
//		String fileNameDel=paramMap.get("fileNameDel").toString();
//		
//		String [] files=fileNoDel.split(",");
//		String [] fileNames=fileNameDel.split(",");
		
		System.err.println("PARAM:"+paramMap);
		try {
//			paramMap.put("update","Y");
			mngService.updateItem(paramMap, files, fileNames, multi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
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
	
	@ResponseBody
	@RequestMapping(value = "/deleteCommonCodes.do")
	public int deleteCommonCodes(
			@RequestParam(value="chbox[]") int [] checkArr, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
System.err.println("fsdlmflmf:"+checkArr);
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			int CID=0;
			
			if(checkArr != null) {
				//cartList
				for(int i=0 ; i<checkArr.length ; i++) {
					CID = checkArr[i];
					System.err.println("CID:"+CID);
					paramMap.put("CID",CID);
					
					//cartStockArr
					mngService.deleteCommonCodes(paramMap);
			}
		}
			
			
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 1;
	}
	
	@RequestMapping(value = "/mngCommonCodes.do")
	public String mngCommonCodes(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="5") int recordCountPerPage,
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		
		try {
			PaginationVO pg = new PaginationVO(currentPageNo, recordCountPerPage, 3, 
					mngService.selectCommonCodesCnt(paramMap));
			
			paramMap.put("length",recordCountPerPage);
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
			paramMap.put("B_TYPE",4);

			model.addAttribute("paramMap",paramMap);
			model.addAttribute("maxNo",mngService.selectCommonCodesMaxNo(paramMap));
			List<Map<String,Object>> list=mngService.selectCommonCodes(paramMap);
			model.addAttribute("list",list);
			model.addAttribute("pg",pg);
//selectCommonCodesMaxNo
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "mng/mngCommonCodes";
	}
	
	//orderCancel
	@ResponseBody
	@RequestMapping(value = "/itemDelivery.do")
	public String itemDelivery( @RequestParam(value="orderId") String orderId, @RequestParam(value="delivery") String delivery, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			
			paramMap.put("orderId",orderId);
			paramMap.put("delivery",delivery);
			
			model.addAttribute("paramMap",paramMap);
			
			mngService.updateOrderState(paramMap);

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "mng/orderList";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/insertCommonCodes.do")
	public Map<String,Object> insertCommonCodes(
//			@RequestParam Map<String, Object> paramMap,
			@RequestParam(value="cidArr[]") int[] cidArr,
			@RequestParam(value="lCategoryArr[]") String[] lCategoryArr,
			@RequestParam(value="sCategoryArr[]") String[] sCategoryArr,
			@RequestParam(value="nameArr[]") String[] nameArr,
			@RequestParam(value="descrptArr[]") String[] descrptArr,
//			@RequestParam(value="fileNameDel[]") String[] fileNames,
			 HttpSession httpSession) throws Exception {		
		Map<String, Object> paramMap=new HashMap<String, Object>();				
		paramMap.put("B_TYPE",4);
		
		int CID=0;
		String L_CATEGORY="";
		String S_CATEGORY="";
		String NAME="";
		String DESCRPT="";
		
		if(cidArr != null) {
			//cartList
			for(int i=0 ; i<cidArr.length ; i++) {
				CID = cidArr[i];
				L_CATEGORY = lCategoryArr[i];
				S_CATEGORY = sCategoryArr[i];
				NAME = nameArr[i];
				DESCRPT = descrptArr[i];
				
				System.err.println("CID:"+CID);
				
				paramMap.put("CID",CID);
				paramMap.put("L_CATEGORY",L_CATEGORY);
				paramMap.put("S_CATEGORY",S_CATEGORY);
				paramMap.put("NAME",NAME);
				paramMap.put("DESCRPT",DESCRPT);
				
				mngService.insertCommonCodes(paramMap);
			}
		}
		return paramMap;
	}
		
}
