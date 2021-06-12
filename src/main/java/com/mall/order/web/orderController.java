package com.mall.order.web;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.mall.order.service.orderService;
import com.mall.user.UserVO;
import com.mall.vo.CartListVO;
import com.mall.vo.CartVO;
import com.mall.vo.GoodsViewVO;
import com.mall.vo.OrderDetailVO;
import com.mall.vo.OrderListVO;
import com.mall.vo.OrderVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.mall.board.service.boardService;
import com.mall.mng.service.mngService;

@Controller
public class orderController {

	private static final Logger logger = LoggerFactory.getLogger(orderController.class);

	@Resource(name = "orderService")
	private orderService orderService;

	@Resource(name = "boardService")
	private boardService boardService;
	
	@Resource(name = "mngService")
	private mngService mngService;

	@RequestMapping(value = "/orderDetail.do")
	public String boardDetail(@RequestParam Map<String, Object> paramMap, HttpSession httpSession,
			HttpServletRequest request, Model model) throws Exception {

		try {
			model.addAttribute("login", httpSession.getAttribute("login"));
			model.addAttribute("member", httpSession.getAttribute("member"));
			System.err.println("zxclmzxlcmzxclzxczmxcmzxcm");
			System.err.println(paramMap);
			System.err.println("zxclmzxlcmzxclzxczmxcmzxcm");
			paramMap.put("B_TYPE", 4);

			Map<String, Object> detail = mngService.selectItemDetail(paramMap);
			List<Map<String,Object>> imgList=mngService.selectItemImgList(paramMap);

			model.addAttribute("detail", detail);
			model.addAttribute("imgList", imgList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "order/orderDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/itemDetailPopup.do", produces = "application/text; charset=utf8")
	//@RequestParam(value="gdsNum") String gdsNum
	//public Map<String, Object> itemDetailPopup(@RequestParam(value="gdsNum") String gdsNum, @RequestParam Map<String, Object> paramMap, HttpSession httpSession,
			public String itemDetailPopup(@RequestParam(value="gdsNum") String gdsNum, @RequestParam Map<String, Object> paramMap, HttpSession httpSession,
			HttpServletRequest request, Model model) throws Exception {
	System.err.println("팝@@");
	System.err.println(paramMap);
Map<String, Object> result = new HashMap<String, Object>();
//HashMap<String, Object> result = new HashMap<String, Object>();

		try {
			model.addAttribute("login", httpSession.getAttribute("login"));
			model.addAttribute("member", httpSession.getAttribute("member"));

			paramMap.put("gdsNum", gdsNum);
			paramMap.put("B_TYPE", 4);

			Map<String, Object> detail = mngService.selectItemDetail(paramMap);
			List<Map<String,Object>> imgList=mngService.selectItemImgList(paramMap);

			model.addAttribute("detail", detail);
			model.addAttribute("imgList", imgList);
			result.put("detail",detail);
			result.put("imgList",imgList);
			System.err.println("detail"+detail);
			System.err.println("imgList"+imgList);
			System.err.println(" JSONObject.fromObject(result).toString()"+ JSONObject.fromObject(result).toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return result;
		return JSONObject.fromObject(result).toString();
	}
	
	@RequestMapping(value="/testForm.do", method=RequestMethod.GET)
	public String testForm(HttpServletRequest request, @RequestParam Map<String, Object> param, Model model) throws Exception {
	   
		Map<String, Object> detail = mngService.selectItemDetail(param);
		List<Map<String,Object>> imgList=mngService.selectItemImgList(param);
		System.err.println("@@@@테스트");
		model.addAttribute("detail", detail);
		model.addAttribute("imgList", imgList);
        return "/common/popup/testPopup";
	}

	
	// 상품 조회
//	@RequestMapping(value = "/view", method = RequestMethod.GET)
//	public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
//		logger.info("get view");
//		
//		GoodsViewVO view = service.goodsView(gdsNum);
//		model.addAttribute("view", view);
//		
//		/*
//		List<ReplyListVO> reply = service.replyList(gdsNum);
//		model.addAttribute("reply", reply);
//		*/
//		
//	}
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart.do", method = RequestMethod.POST)
	public int addCart(Model model, CartListVO cart, HttpSession session) throws Exception {
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));

		System.err.println("cart:"+cart);
		int result = 0;
		System.err.println("sessionL"+session.getAttribute("login"));

		String member = String.valueOf(session.getAttribute("login"));
//		UserVO member = (UserVO) session.getAttribute("login");
		if (member != null) {
			//cart.setUserId(member);
//			cart.setUserId(member.getID());
			orderService.addCart(cart);
			result = 1;
		}

		return result;
	}


	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart.do")
//	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart( @RequestParam(value="userId") String userId, @RequestParam(value = "chbox[]") List<String> chArr, @RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
		logger.info("delete cart");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));
		System.err.println("paramMap@"+paramMap);
		System.err.println("chArr@"+chArr);
		System.err.println("userId@"+userId);
		int result = 0;
		int cartNum = 0;
		paramMap.put("userId",userId);
		paramMap.put("orderProcess","N");
		// 로그인 여부 구분
		if(userId != null) {
			
			for(String i : chArr) {  // 에이젝스에서 받은 chArr의 갯수만큼 반복
				cartNum = Integer.parseInt(i);  // i번째 데이터를 cartNum에 저장
				paramMap.put("cartNum",cartNum);
				orderService.deleteSeparateCart(paramMap);
//				orderService.deleteCart(paramMap);
			}
			result = 1;
		}		
		return result;
	}

	// 주문
	@RequestMapping(value = "/cartList.do")
//	@RequestMapping(value = "/cartList.do", method = RequestMethod.POST)
	public String order(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		logger.info("order");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));

		HashMap<String,Object> login=(HashMap<String, Object>) session.getAttribute("member");
		paramMap.put("userId",login.get("ID"));
System.err.println("paramamamamammamama:"+login.get("ID"));
		paramMap.put("orderProcess","N");
		List<Map<String, Object>> cartList = orderService.cartList(paramMap);
System.err.println("LISITIIITITISITITIT:"+cartList);
		model.addAttribute("cartList", cartList);

//		return "redirect:/order/cartList";
		return "order/cartList";
	}
	
	@RequestMapping(value = "/orderProcessDetail.do")
//	@RequestMapping(value = "/cartList.do", method = RequestMethod.POST)
	public String orderProcessDetail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
		logger.info("order");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));
		HashMap<String,Object> login=(HashMap<String, Object>) session.getAttribute("member");
		paramMap.put("userId",login.get("ID"));
		
		System.err.println("ff"+session.getAttribute("login"));
		System.err.println("@#@JWLEKJWJL:"+paramMap);
		

		paramMap.put("orderProcess","Y");
		List<Map<String, Object>> cartList = orderService.cartList(paramMap);
		orderService.deleteCart(paramMap);
		
		List<Map<String, Object>> orderView = orderService.orderView(paramMap);
		model.addAttribute("cartList", cartList);
//		model.addAttribute("orderView", orderView);
		model.addAttribute("paramMap",paramMap);
		
		
//		return "redirect:/order/cartList";
		return "order/orderProcessDetail";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/orderProcess.do")
	public Map<String, Object> orderProcess( @RequestParam(value="userId") String userId, @RequestParam(value = "cartStockArr[]") List<String> cartStockArr, @RequestParam(value = "chbox[]") List<String> chArr, @RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
		logger.info("orderProcess cart");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));
		System.err.println("paramMap@"+paramMap);
		System.err.println("chArr@"+chArr);
		System.err.println("cartStockArr@"+cartStockArr);
		System.err.println("userId@"+userId);
		Map<String,Object> login=(Map<String, Object>) session.getAttribute("member");
		paramMap.put("userId",login.get("ID"));
		int cartNum=0;
		int cartStock=0;
		
		paramMap.put("orderId", orderService.maxOrderId()+1);
		paramMap.put("userId",userId);
		//카트리스트에서 선택된 내역 주문
		//주문서 작성 후 결제 완료->주문 내역 카트리스트에서 삭제
		//paramMap.put("orderProcess","C");//completely ordered
		
		//orderService.deleteOrderInfoDetails(paramMap);
		
		
		paramMap.put("orderProcess","Y");
		orderService.deleteCart(paramMap);
		orderService.deleteOrderDetails(paramMap);
		
		if(userId != null) {
			//cartList
			for(int i=0 ; i<chArr.size() ; i++) {
				cartNum = Integer.parseInt(chArr.get(i).toString());
				cartStock = Integer.parseInt(cartStockArr.get(i).toString());
				paramMap.put("cartNum",cartNum);
				paramMap.put("cartStock",cartStock);
				
				System.err.println("@@@@@@@@@@@@@@@@@cs:"+cartNum);
				System.err.println("@@@@@@@@@@@@@@@@@cs:"+cartStock);
				System.err.println("@@@@@@@@@@@@@@@@@cs:"+userId);
				//cartStockArr
				orderService.updateCart(paramMap);
				orderService.orderInfo_Details(paramMap);//상세주문에 선택 상품 추가
				//orderService.deleteCart(paramMap);//카트에서 해당 상품 삭제
			}
			
		}
		
		
		
		// 주문할 상품 리스트
		List<Map<String, Object>> cartList = orderService.cartList(paramMap);
		System.err.println("cartList:"+cartList);
		model.addAttribute("cartList", cartList);
		model.addAttribute("paramMap", paramMap);
		return paramMap;
	}
	
	
	
	// 주
		@ResponseBody
		@RequestMapping(value = "/orderItem.do", method = RequestMethod.POST)
		public int orderItem(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model) throws Exception {
			model.addAttribute("login", session.getAttribute("login"));
			model.addAttribute("member", session.getAttribute("member"));

			System.err.println(("orderItem:"+paramMap));
			Map<String, Object> detail = mngService.selectItemDetail(paramMap);
			model.addAttribute("detail",detail);
			model.addAttribute("paramMap",paramMap);
			System.err.println("orderD:"+detail);
			int result = 0;

			String member = String.valueOf(session.getAttribute("login"));
//			UserVO member = (UserVO) session.getAttribute("login");
			if (member != null) {
//				cart.setUserId(member);
//				cart.setUserId(member.getID());
//				orderService.addCart(cart);
				result = 1;
			}

			return result;
		}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@ResponseBody
	@RequestMapping(value = "/orderList.do")
	public Map<String,Object> orderList(
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("login",httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));

		System.err.println("insert:"+paramMap);
		System.err.println("$$$$$$$$$$");
		
		//orderProcess='C'로 변경

		//임시(API적용전 테스트)
		paramMap.put("imp_uid","imp_uid");
		paramMap.put("merchant_uid","merchant_uid");
		paramMap.put("paid_amount",1000);
		paramMap.put("apply_num",10);

		orderService.orderInfo(paramMap);
		
		logger.info("get order list");
		
		System.err.println("paramMap@:"+paramMap);

		List<Map<String, Object>> orderList = orderService.orderList(paramMap);
		//orderService.orderInfo_Details(paramMap);
		System.err.println(orderList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("paramMap", paramMap);

		return paramMap;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/orderChk.do")
//	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int orderChk( @RequestParam(value="userId") String userId, @RequestParam(value = "cartStockArr[]") List<String> cartStockArr, @RequestParam(value = "chbox[]") List<String> chArr, @RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
		logger.info("orderChk cart");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));
		System.err.println("paramMap@"+paramMap);
		System.err.println("chArr@"+chArr);
		System.err.println("userId@"+userId);
		OrderDetailVO orderDetail=new OrderDetailVO();
		int result = 0;
		int cartNum = 0;
		int cartStock = 0;
		paramMap.put("userId",userId);
		// 로그인 여부 구분
		List<Map<String, Object>> orderList = orderService.orderList(paramMap);
//		int len=orderList.size()+1;
//		paramMap.put("orderId",len);
		
//		orderService.orderInfo(paramMap);
		System.err.println("chArr:"+chArr);
		
		paramMap.put("orderId", orderService.maxOrderId());
		if(userId != null) {
			//cartList
			for(int i=0 ; i<chArr.size() ; i++) {
				cartNum = Integer.parseInt(chArr.get(i).toString());
				cartStock = Integer.parseInt(cartStockArr.get(i).toString());
				paramMap.put("cartNum",cartNum);
				paramMap.put("cartStock",cartStock);
				System.err.println("@@@@@@@@@@@@@@@@@cs:"+cartStock);
				//cartStockArr
				orderService.updateCart(paramMap);
				orderService.orderInfo_Details(paramMap);
				orderService.deleteCart(paramMap);
			}
//			for(String i : chArr) {  // 에이젝스에서 받은 chArr의 갯수만큼 반복
//				cartNum = Integer.parseInt(i);  // i번째 데이터를 cartNum에 저장
//				
//				paramMap.put("cartNum",cartNum);
//				//cartStockArr
//				orderService.orderInfo_Details(paramMap);
//				orderService.deleteCart(paramMap);
//						
//				}
			result = 1;
		}		
			
		
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("paramMap", paramMap);
		return result;
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@

	// 주문 목록
	@RequestMapping(value = "/orderList2.do")
	public String getOrderList(HttpServletRequest request, Map<String, Object> paramMap, HttpSession session, Model model) throws Exception {
//		public void getOrderList(Map<String, Object> paramMap, HttpSession session, OrderVO order, Model model) throws Exception {
		logger.info("get order list");
		model.addAttribute("login",session.getAttribute("login"));
		model.addAttribute("member",session.getAttribute("member"));
		HashMap<String,Object> login=(HashMap<String, Object>) session.getAttribute("member");
		paramMap.put("userId",login.get("ID"));
		
		System.err.println("paramMap@:"+paramMap);
		System.err.println("orderRec@:"+request.getAttribute("orderRec"));

		
		List<Map<String, Object>> orderList = orderService.orderList(paramMap);
		System.err.println("orderList@@:"+orderList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("paramMap", paramMap);
		
		paramMap.put("orderProcess","Y");
		orderService.deleteCart(paramMap);
		
		
		
		
		//@@@
//		model.addAttribute("login",session.getAttribute("login"));
//		model.addAttribute("member",session .getAttribute("member"));
//		System.err.println("login@:"+session.getAttribute("login"));
//		System.err.println("member@:"+session.getAttribute("member"));
//		UserVO member = (UserVO) session.getAttribute("login");
//		System.err.println("UserVO:"+member.getID());
//		String userId = member.getID();
//
//		order.setUserId(userId);
//		paramMap.put("userId",userId);
//		List<OrderVO> orderList = orderService.orderList(order);
//
//		model.addAttribute("orderList", orderList);
		
		return "order/orderList";

	}

	// 주문 상세 목록
	@RequestMapping(value = "/orderView.do")
//	@RequestMapping(value = "/orderView.do", method = RequestMethod.GET)
	public String getOrderList(Map<String, Object> paramMap, HttpSession session, @RequestParam(value="orderId", required=false) String orderId, OrderVO order, Model model)
//	public void getOrderList(Map<String, Object> paramMap, HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model)
			throws Exception {
		logger.info("get order view");
		model.addAttribute("login",session.getAttribute("login"));
		model.addAttribute("member",session.getAttribute("member"));
		
//		UserVO member = (UserVO) session.getAttribute("ID");
//		String userId = member.getID();

//		order.setUserId(paramMap.get("userId").toString());
//		order.setOrderId(paramMap.get("orderId").toString());
		
//		order.setUserId(userId);
		System.err.println("param:"+paramMap);
//		order.setOrderId(orderId);
//		paramMap.put("userId",session.getAttribute("login"));
//		paramMap.put("orderId",session.getAttribute("login"));
//
//		List<OrderListVO> orderView = orderService.orderView(order);
//
//		model.addAttribute("orderView", orderView);
		
		return "order/orderView";

	}

	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//주문화면
		@RequestMapping(value = "/directOrderProcessDetail.do")
//		@RequestMapping(value = "/cartList.do", method = RequestMethod.POST)
		public String directOrderProcessDetail(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
			logger.info("order");
			model.addAttribute("login", session.getAttribute("login"));
			model.addAttribute("member", session.getAttribute("member"));
			
			System.err.println("ff"+session.getAttribute("login"));
			String member = String.valueOf(session.getAttribute("login"));
			String userId = member;
			paramMap.put("userId",userId);
			System.err.println("@#@JWLEKJWJL:"+paramMap);
			
			
			

			paramMap.put("orderProcess","Y");
			List<Map<String, Object>> cartList = orderService.cartList(paramMap);
			orderService.deleteCart(paramMap);
			
			List<Map<String, Object>> orderView = orderService.orderView(paramMap);
			model.addAttribute("cartList", cartList);
//			model.addAttribute("orderView", orderView);
			model.addAttribute("paramMap",paramMap);

			//			return "redirect:/order/cartList";
			return "order/directOrderProcessDetail";
		}
		
		@ResponseBody
		@RequestMapping(value = "/directOrderProcess.do")
		public Map<String, Object> directOrderProcess( @RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
			logger.info("orderProcess cart");
			model.addAttribute("login", session.getAttribute("login"));
			model.addAttribute("member", session.getAttribute("member"));
			
			int cartNum=0;
			int cartStock=0;
			
			CartListVO cart=new CartListVO();
			cart.setGdsNum(Integer.parseInt(paramMap.get("gdsNum").toString()));
			cart.setCartStock(Integer.parseInt(paramMap.get("gdsStock").toString()));
			cart.setUserId(paramMap.get("userId").toString());
			
			//카트리스트에서 선택된 내역 주문
			//주문서 작성 후 결제 완료->주문 내역 카트리스트에서 삭제
			
//			orderService.updateOrderDetails(paramMap);
//deleteOrderDetails
			//paramMap.put("orderProcess","Y");
			//주문번호 orderId
			paramMap.put("orderId", orderService.maxOrderId()+1);
			//paramMap.put("cartNum", orderService.maxCartNum()+1);
			paramMap.put("cartStock", paramMap.get("gdsStock"));
			
			
			System.err.println("zxmcxczcxz:"+paramMap);
			paramMap.put("orderProcess","Y");
			orderService.deleteCart(paramMap);
			orderService.deleteOrderDetails(paramMap);
			
			orderService.addCart(cart);
			paramMap.put("cartNum",orderService.maxCartNum(paramMap));

			orderService.orderInfo_Details(paramMap);
			orderService.deleteSeparateCart(paramMap);
			
			System.err.println("ASDASDASDSDDSDASDASDASD@"+paramMap);

			
			return paramMap;
		}
		@ResponseBody
		@RequestMapping(value = "/directOrderProcess2.do")
		public int directOrderProcess2( @RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
			logger.info("order");
			model.addAttribute("login", session.getAttribute("login"));
			model.addAttribute("member", session.getAttribute("member"));
			paramMap.put("orderId", orderService.maxOrderId());
			List<Map<String, Object>> list=orderService.orderView(paramMap);
			System.err.println("ff"+session.getAttribute("login"));
			String member = String.valueOf(session.getAttribute("login"));
			String userId = member;
			paramMap.put("userId",userId);
			System.err.println("@#@JWLEKJWJL:"+paramMap);
			
			
//			orderService.orderInfo(order);
			
//			orderService.orderInfo_Details(orderDetail);
			
			// 주문 테이블, 주문 상세 테이블에 데이터를 전송하고, 카트 비우기
//			orderService.cartAllDelete(userId);
			
//			List<CartListVO> cartList = orderService.cartList(userId);
			
			paramMap.put("orderProcess","Y");
			model.addAttribute("paramMap",paramMap);
			model.addAttribute("list",list);

			return 1;
		}
		
		
	@RequestMapping(value = "/orderDetailView.do")
	public String orderDetailView(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		logger.info("order");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));
		
		Map<String,Object> login=(HashMap<String, Object>) session.getAttribute("login");
		paramMap.put("userId",login.get("ID"));
		
		
		List<Map<String, Object>> detailList = orderService.selectOrderDetailView(paramMap);
		Map<String, Object> detail = detailList.get(0);
		
		model.addAttribute("detailList", detailList);
		model.addAttribute("detail", detail);
		model.addAttribute("paramMap", paramMap);

		return "order/orderDetailView";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/orderDetailViewPopup.do", produces = "application/text; charset=utf8")
	public String orderDetailViewPopup(Map<String, Object> paramMap,
			@RequestParam int orderId,
			@RequestParam String pageType,
			HttpSession session,
			HttpServletRequest request, Model model) throws Exception {
			//		public Map<String, Object> orderDetailViewPopup( @RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
		logger.info("order");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));
		Map<String,Object> login=(HashMap<String, Object>) session.getAttribute("member");
		paramMap.put("userId",login.get("ID"));
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		try {
			paramMap.put("orderId",orderId);
			paramMap.put("pageType",pageType);
			//paramMap.put("orderId",orderId);
			System.err.println("param:"+paramMap);
			System.err.println("orderId:"+orderId);
			
			List<Map<String, Object>> detailList = orderService.selectOrderDetailView(paramMap);
			//Map<String, Object> detail = detailList.get(0);
			System.err.println("detailList:"+detailList);
			System.err.println("result:"+result);
			result.put("detailList",detailList);
			result.put("pageType",pageType);
			//result.put("result",result);
			
//			model.addAttribute("detailList", detailList);
//			model.addAttribute("detail", detail);
//			model.addAttribute("paramMap", paramMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSONObject.fromObject(result).toString();
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/reviewPopup.do", produces = "application/text; charset=utf8")
	public String reviewPopup(Map<String, Object> paramMap,
			@RequestParam int orderId,
			@RequestParam String pageType,
			HttpSession session,
			HttpServletRequest request, Model model) throws Exception {
			//		public Map<String, Object> orderDetailViewPopup( @RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
		logger.info("order");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));
		Map<String,Object> login=(HashMap<String, Object>) session.getAttribute("member");
		paramMap.put("userId",login.get("ID"));
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		try {
			paramMap.put("orderId",orderId);
			paramMap.put("pageType",pageType);
			//paramMap.put("orderId",orderId);
			System.err.println("param:"+paramMap);
			System.err.println("orderId:"+orderId);
			
			List<Map<String, Object>> detailList = orderService.selectOrderDetailView(paramMap);
			//Map<String, Object> detail = detailList.get(0);
			System.err.println("detailList:"+detailList);
			System.err.println("result:"+result);
			result.put("detailList",detailList);
			result.put("pageType",pageType);
			//result.put("result",result);
			
//			model.addAttribute("detailList", detailList);
//			model.addAttribute("detail", detail);
//			model.addAttribute("paramMap", paramMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSONObject.fromObject(result).toString();
	}
}
