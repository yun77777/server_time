package com.mall.order.web;

import java.text.DecimalFormat;
import java.util.Calendar;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

			paramMap.put("B_TYPE", 4);

			Map<String, Object> detail = mngService.selectItemDetail(paramMap);
//			Map<String, Object> detail = orderService.selectOrderDetail(paramMap);
			List<Map<String, Object>> list = boardService.selectItemList(paramMap);
			model.addAttribute("list", list);
			System.err.println("detailP");
			System.err.println(paramMap);
			System.err.println(detail);
			model.addAttribute("detail", detail);
			
			
//			GoodsViewVO view = orderService.goodsView(gdsNum);
//			model.addAttribute("view", view);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "order/orderDetail";
	}
	
	// 카테고리별 상품 리스트
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public void getList(@RequestParam("c") int cateCode,
//						@RequestParam("l") int level, Model model) throws Exception {
//		logger.info("get llist");
//		
//		List<GoodsViewVO> list = null;
//		list = orderService.list(cateCode, level);
//	
//		model.addAttribute("list", list);
//		
//	}
	
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
	public int addCart(CartListVO cart, HttpSession session) throws Exception {

		int result = 0;
		System.err.println("sessionL"+session.getAttribute("login"));

		String member = String.valueOf(session.getAttribute("login"));
//		UserVO member = (UserVO) session.getAttribute("login");
		if (member != null) {
			cart.setUserId(member);
//			cart.setUserId(member.getID());
			orderService.addCart(cart);
			result = 1;
		}

		return result;
	}

	// 카트 목록
//	@RequestMapping(value = "/cartList.do", method = RequestMethod.GET)
//	public void getCartList(HttpSession session, Model model) throws Exception {
//		logger.info("get cart list");
//
//		String member = String.valueOf(session.getAttribute("login"));
//		String userId = member;
//		
////		UserVO member = (UserVO) session.getAttribute("ID");
////		String userId = member.getID();
//
//		List<CartListVO> cartList = orderService.cartList(userId);
//
//		model.addAttribute("cartList", cartList);
//	}

	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart")
//	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart( @RequestParam(value="userId") String userId, @RequestParam(value = "chbox[]") List<String> chArr, @RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
		logger.info("delete cart");
		model.addAttribute("login", session.getAttribute("login"));
		System.err.println("paramMap@"+paramMap);
		System.err.println("chArr@"+chArr);
		System.err.println("userId@"+userId);
		int result = 0;
		int cartNum = 0;
		paramMap.put("userId",userId);
		// 로그인 여부 구분
		if(userId != null) {
			
			for(String i : chArr) {  // 에이젝스에서 받은 chArr의 갯수만큼 반복
				cartNum = Integer.parseInt(i);  // i번째 데이터를 cartNum에 저장
				
				paramMap.put("cartNum",cartNum);
				orderService.deleteCart(paramMap);
			}
			result = 1;
		}		
		return result;
	}

	// 주문
	@RequestMapping(value = "/cartList.do")
//	@RequestMapping(value = "/cartList.do", method = RequestMethod.POST)
	public String order(Model model, HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		logger.info("order");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));

		System.err.println("ff"+session.getAttribute("login"));
		String member = String.valueOf(session.getAttribute("login"));
		String userId = member;
		
//		UserVO member = (UserVO) session.getAttribute("ID");
//		String userId = member.getID();

		// 캘린더 호출
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR); // 연도 추출
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // 월 추출
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // 일 추출
		String subNum = ""; // 랜덤 숫자를 저장할 문자열 변수

		for (int i = 1; i <= 6; i++) { // 6회 반복
			subNum += (int) (Math.random() * 10); // 0~9까지의 숫자를 생성하여 subNum에 저장
		}

		String orderId = ymd + "_" + subNum; // [연월일]_[랜덤숫자] 로 구성된 문자

		order.setOrderId(orderId);
		order.setUserId(userId);

//		orderService.orderInfo(order);

		orderDetail.setOrderId(orderId);
//		orderService.orderInfo_Details(orderDetail);

		// 주문 테이블, 주문 상세 테이블에 데이터를 전송하고, 카트 비우기
//		orderService.cartAllDelete(userId);
		List<CartListVO> cartList = orderService.cartList(userId);

		model.addAttribute("cartList", cartList);

//		return "redirect:/order/cartList";
		return "order/cartList";
	}
	
	@RequestMapping(value = "/orderProcess.do")
//	@RequestMapping(value = "/cartList.do", method = RequestMethod.POST)
	public String orderProcess(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session) throws Exception {
		logger.info("order");
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("member", session.getAttribute("member"));

		
		Map<String, Object> detail = orderService.selectOrderDetail(paramMap);

		model.addAttribute("detail", detail);
		model.addAttribute("paramMap",paramMap);
		return "order/orderProcess";
	}
	
	// 주
		@ResponseBody
		@RequestMapping(value = "/orderItem.do", method = RequestMethod.POST)
		public int orderItem(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model) throws Exception {
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
		orderService.orderInfo(paramMap);
		
		logger.info("get order list");
		
		System.err.println("paramMap@:"+paramMap);
	//				System.err.println("order@:"+session.getAttribute("login"));
	//
	//				UserVO member = (UserVO)session.getAttribute("login");
	//				String userId = member.getID();
	//				System.err.println("order@:"+order);
	//				
	//				order.setUserId(session.getAttribute("login").toString());
	//				order.setOrderId(session.getAttribute("login").toString());
	
		List<Map<String, Object>> orderList = orderService.orderList(paramMap);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("paramMap", paramMap);

		return paramMap;
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@

	// 주문 목록
	@RequestMapping(value = "/orderList2.do")
//	@RequestMapping(value = "/orderList.do", method = RequestMethod.GET)
	public String getOrderList(HttpServletRequest request, Map<String, Object> paramMap, HttpSession session, Model model) throws Exception {
//		public void getOrderList(Map<String, Object> paramMap, HttpSession session, OrderVO order, Model model) throws Exception {
		logger.info("get order list");
		model.addAttribute("login",session.getAttribute("login"));
		model.addAttribute("member",session.getAttribute("member"));
		
		System.err.println("paramMap@:"+paramMap);
		System.err.println("orderRec@:"+request.getAttribute("orderRec"));
//		System.err.println("order@:"+session.getAttribute("login"));
//
//		UserVO member = (UserVO)session.getAttribute("login");
//		String userId = member.getID();
//		System.err.println("order@:"+order);
//		
//		order.setUserId(session.getAttribute("login").toString());
//		order.setOrderId(session.getAttribute("login").toString());
		paramMap.put("userId",session.getAttribute("login"));

		List<Map<String, Object>> orderList = orderService.orderList(paramMap);
		System.err.println("orderList@@:"+orderList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("paramMap", paramMap);
		
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

}
