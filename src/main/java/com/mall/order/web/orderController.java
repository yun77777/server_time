package com.mall.order.web;

import java.util.List;
import java.util.Map;
import com.mall.order.service.orderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mall.board.service.boardService;

@Controller
public class orderController {

	private static final Logger logger = LoggerFactory.getLogger(orderController.class);

	@Resource(name = "orderService")
	private orderService orderService;
	
	@Resource(name = "boardService")
	private boardService boardService;

	@RequestMapping(value = "/orderDetail.do")
	public String boardDetail(@RequestParam Map<String, Object> paramMap, HttpSession httpSession,
			HttpServletRequest request, Model model) throws Exception {
		
		try {
			model.addAttribute("login", httpSession.getAttribute("login"));
			model.addAttribute("member", httpSession.getAttribute("member"));

			paramMap.put("B_TYPE", 4);

			Map<String, Object> detail = orderService.selectOrderDetail(paramMap);
			List<Map<String, Object>> list=boardService.selectItemList(paramMap);
			model.addAttribute("list",list);
			System.err.println("detailP");
			System.err.println(paramMap);
			System.err.println(detail);
			model.addAttribute("detail", detail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "order/orderDetail";
	}

}
