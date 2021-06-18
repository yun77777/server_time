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

import com.mall.board.service.ReplyService;
import com.mall.board.service.boardService;
import com.mall.common.PaginationVO;
import com.mall.mng.service.mngService;
import com.mall.order.service.orderService;
import com.mall.vo.GoodsVO;

import net.sf.json.JSONObject;

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
	
	@Resource(name = "replyService")
	private ReplyService replyService;
	
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
					mngService.selectItemListCnt(paramMap));
			
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
	public String orderListMng(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="20") int recordCountPerPage,
			@RequestParam(defaultValue="all") String delivery,
			@RequestParam Map<String, Object> paramMap,
			HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));
		
		paramMap.put("recordCountPerPage", 20);
		paramMap.put("currentPageNo", currentPageNo);
		
		//paramMap.put("B_TYPE",4);
		
		try {
			paramMap.put("delivery",delivery);
			PaginationVO pg = new PaginationVO(currentPageNo, 20, 5, 
					mngService.selectOrderListCnt(paramMap));
			
			paramMap.put("length",20);
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
//			if(delivery.toString().equals("cancel"))
//				delivery="취소";
//			else if(delivery.toString().equals("delivery"))
//				delivery="발송";
			
			
			List<Map<String,Object>> list=mngService.selectOrderList(paramMap);
			
			System.err.println("PAPRAPRAP:"+paramMap);
			System.err.println("LISTLSIT:"+list);
			
			model.addAttribute("list",list);
			model.addAttribute("delivery",delivery);
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
			
			paramMap.put("L_CATEGORY","L");
			List<Map<String, Object>> category1=mngService.selectCategoryCode(paramMap);
			paramMap.put("S_CATEGORY","상의");
			List<Map<String, Object>> category3=mngService.selectCategorySCode(paramMap);
			paramMap.put("S_CATEGORY","하의");
			List<Map<String, Object>> category4=mngService.selectCategorySCode(paramMap);

			model.addAttribute("category1",category1);
			model.addAttribute("top",category3);
			model.addAttribute("bottom",category4);
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
			paramMap.put("L_CATEGORY","L");
			List<Map<String, Object>> category1=mngService.selectCategoryCode(paramMap);
			paramMap.put("S_CATEGORY","상의");
			List<Map<String, Object>> category3=mngService.selectCategorySCode(paramMap);
			paramMap.put("S_CATEGORY","하의");
			List<Map<String, Object>> category4=mngService.selectCategorySCode(paramMap);

			model.addAttribute("category1",category1);
			model.addAttribute("top",category3);
			model.addAttribute("bottom",category4);		
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

			paramMap.put("L_CATEGORY","L");
			List<Map<String, Object>> category1=mngService.selectCategoryCode(paramMap);
			paramMap.put("S_CATEGORY","상의");
			List<Map<String, Object>> category3=mngService.selectCategorySCode(paramMap);
			paramMap.put("S_CATEGORY","하의");
			List<Map<String, Object>> category4=mngService.selectCategorySCode(paramMap);
			paramMap.put("S_CATEGORY","신발");
			List<Map<String, Object>> category5=mngService.selectCategorySCode(paramMap);
			paramMap.put("S_CATEGORY","반려동물용품");
			List<Map<String, Object>> category6=mngService.selectCategorySCode(paramMap);

			model.addAttribute("category1",category1);
			model.addAttribute("top",category3);
			model.addAttribute("bottom",category4);
			model.addAttribute("shoes",category5);
			model.addAttribute("pet",category6);

		
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
	@RequestMapping(value = "/deleteItems.do")
	public int deleteItems(
			@RequestParam(value="chbox[]") int [] checkArr, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
System.err.println("fsdlmflmf:"+checkArr);
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			int gdsNum=0;
			
			if(checkArr != null) {
				for(int i=0 ; i<checkArr.length ; i++) {
					gdsNum = checkArr[i];
					System.err.println("gdsNum:"+gdsNum);
					paramMap.put("gdsNum",gdsNum);
					
					mngService.deleteItem(paramMap);
			}
		}
			
			
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 1;
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

			boardService.deleteBoard(paramMap, request);
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
	public String mngCommonCodes(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="20") int recordCountPerPage,
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
	
	
	
	//BOARD
	
	@RequestMapping(value = "/boardList.do")
	public String boardListMng(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="20") int recordCountPerPage,
			@RequestParam(defaultValue="1") int B_TYPE, 
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));

		paramMap.put("recordCountPerPage", 20);
		paramMap.put("currentPageNo", currentPageNo);
		
		System.err.println("PRAMAMSPDMASPD:"+paramMap);
		System.err.println("B_TYPE:"+B_TYPE);
		try {
			paramMap.put("B_TYPE", B_TYPE);
			PaginationVO pg = new PaginationVO(currentPageNo, 20, 5, 
					boardService.selectBoardListCnt(paramMap));
			
			paramMap.put("length",20);
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
			List<Map<String,Object>> list=boardService.selectBoardList(paramMap);
			System.err.println("LISISISI:"+list);
			model.addAttribute("list",list);
			model.addAttribute("paramMap",paramMap);
			model.addAttribute("B_TYPE",B_TYPE);
			model.addAttribute("pg",pg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return "mng/board/boardList";
	}
	
	
	@RequestMapping(value = "/boardDetail.do")
	public String boardDetailMng(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));

			Map<String,Object> detail=boardService.selectBoardDetail(paramMap);
			System.err.println("detailP");
			System.err.println(paramMap);
			System.err.println(detail);

			List<Map<String,Object>> list=boardService.selectBoardHisList(paramMap);
			List<Map<String,Object>> fileList=boardService.selectBoardFileList(paramMap);
			List<Map<String,Object>> replyList=replyService.list(paramMap);
			
			int len=boardService.selectBoardMaxNo(paramMap);
			int replyListLen=replyList.size();
			
			if(paramMap.get("replyType")!=null && paramMap.get("replyType").toString().equals("Y"))
				paramMap.put("title","[Re:] "+paramMap.get("title").toString());

			model.addAttribute("detail",detail);
			model.addAttribute("list",list);
			model.addAttribute("replyList",replyList);
			model.addAttribute("fileList",fileList);
			model.addAttribute("len",len);
			model.addAttribute("replyListLen",replyListLen);
			model.addAttribute("paramMap",paramMap);
			

		} catch (Exception e) {
			e.printStackTrace();
		}		
	return "mng/board/boardDetail";
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

	
	
	@RequestMapping(value = "/boardInsert.do")
	public String boardInsertMng(
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			
			paramMap.put("no",boardService.selectBoardMaxNo(paramMap)+1);
			model.addAttribute("paramMap",paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	return "mng/board/boardInsert";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertBoard.do")
	public Map<String,Object> insertBoardMng(
			MultipartHttpServletRequest multi,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));

		System.err.println("insert:"+paramMap);
		System.err.println("file:"+multi);
		

		try {
			if(paramMap.get("no").toString()!=null||!paramMap.get("no").toString().trim().equals(""))
				paramMap.put("no",paramMap.get("no"));
			
			if(paramMap.get("replyType")!=null && paramMap.get("replyType").toString().equals("Y")) {
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
	@RequestMapping(value = "/deleteBoard.do")
	public Map<String,Object> deleteBoardMng(
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
	
	@ResponseBody
	@RequestMapping(value = "/deleteBoards.do")
	public int deleteBoards(
			@RequestParam(value="chbox[]") int [] checkArr, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
System.err.println("fsdlmflmf:"+checkArr);
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			
			if(checkArr != null) {
				for(int i=0 ; i<checkArr.length ; i++) {
					paramMap.put("no",checkArr[i]);
					boardService.deleteBoard(paramMap, request);
			}
		}
			
			
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 1;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/deliverItems.do")
	public int deliverItems(
			@RequestParam(value="chbox[]") int [] checkArr, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			System.err.println("fsdlmflmf:"+checkArr);
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			
			if(checkArr != null) {
				for(int i=0 ; i<checkArr.length ; i++) {
					paramMap.put("orderId",checkArr[i]);
					paramMap.put("delivery","D2");//발송
					model.addAttribute("paramMap",paramMap);
					mngService.updateOrderState(paramMap);
				}
			}
			
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/cancelItems.do")
	public int cancelItems(
			@RequestParam(value="chbox[]") int [] checkArr, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
			System.err.println("fsdlmflmf:"+checkArr);
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			
			if(checkArr != null) {
				for(int i=0 ; i<checkArr.length ; i++) {
					paramMap.put("orderId",checkArr[i]);
					paramMap.put("delivery","D3");//취소
					model.addAttribute("paramMap",paramMap);
					mngService.updateOrderState(paramMap);
				}
			}
			
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 1;
	}
	
	@RequestMapping(value = "/customerList.do")
	public String customerList(@RequestParam(defaultValue="1") int currentPageNo, @RequestParam(defaultValue="20") int recordCountPerPage,
			@RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));

		paramMap.put("recordCountPerPage", recordCountPerPage);
		paramMap.put("currentPageNo", currentPageNo);
		
		try {
			PaginationVO pg = new PaginationVO(currentPageNo, recordCountPerPage, 5, 
					mngService.selectCustomerListCnt(paramMap));
			
			paramMap.put("length",recordCountPerPage);
			paramMap.put("start",pg.getFirstRecordIndex()-1);
			
			List<Map<String,Object>> list=mngService.selectCustomerList(paramMap);
			
			model.addAttribute("list",list);
			model.addAttribute("paramMap",paramMap);
			model.addAttribute("pg",pg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return "mng/customerList";
	}

	@ResponseBody
	@RequestMapping(value = "/deleteCustomer.do")
	public int deleteCustomer(
			@RequestParam(value="chbox[]") String [] checkArr, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		try {
			model.addAttribute("login",httpSession.getAttribute("login"));
			model.addAttribute("member",httpSession.getAttribute("member"));
System.err.println("fsdlmflmf:"+checkArr);
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			String id="";
			
			if(checkArr != null) {
				for(int i=0 ; i<checkArr.length ; i++) {
					id = checkArr[i];
					paramMap.put("ID",id);
					System.err.println("ID@:"+id);
					mngService.deleteCustomer(paramMap);
			}
		}
			
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 1;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/customerDetailopup.do", produces = "application/text; charset=utf8")
	public String customerDetailopup(Map<String, Object> paramMap,@RequestParam(value="userId") String userId, HttpSession session,
			HttpServletRequest request, Model model) throws Exception {
		logger.info("order");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));
		Map<String,Object> login=(HashMap<String, Object>) session.getAttribute("member");
		paramMap.put("userId",login.get("ID"));
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		try {
			paramMap.put("userId",userId);
			System.err.println("param:"+paramMap);
			
			Map<String, Object> detail = mngService.selectCustomerDetail(paramMap);
			//Map<String, Object> detail = detailList.get(0);
			System.err.println("detail:"+detail);
			System.err.println("result:"+result);
			result.put("detail",detail);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSONObject.fromObject(result).toString();
	}
}
