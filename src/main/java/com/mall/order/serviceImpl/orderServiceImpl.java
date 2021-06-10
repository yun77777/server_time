package com.mall.order.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mall.order.service.orderService;
import com.mall.vo.CartListVO;
import com.mall.vo.CartVO;
import com.mall.vo.GoodsViewVO;
import com.mall.vo.OrderDetailVO;
import com.mall.vo.OrderListVO;
import com.mall.vo.OrderVO;

@Service("orderService")
public class orderServiceImpl implements orderService {
	@Autowired
	private orderMapper orderMapper;

	@Override
	public Map<String, Object> selectOrderDetail(Map<String, Object> paramMap) throws Exception {
		System.err.println("param:" + paramMap);
		System.err.println("oardMapper.selectBoardDetail(paramMap:" + orderMapper.selectOrderDetail(paramMap));
		return orderMapper.selectOrderDetail(paramMap);
	}

	@Override
	public Map<String, Object> orderProcess(Map<String, Object> paramMap) throws Exception {
		return orderMapper.orderProcess(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectOrderDetailView(Map<String, Object> paramMap) throws Exception {
		return orderMapper.selectOrderDetailView(paramMap);
	}

	// 카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
		int cateCodeRef = 0; // 카테고리 참조 코드. 없어도 무관

		if (level == 1) { // lavel 1 = 1차 분류.
			cateCodeRef = cateCode;
			return orderMapper.list(cateCode, cateCodeRef);
			// 두가지 모두 cateCode로 해도 무관
		} else { // lavel 2 = 2차 분류
			return orderMapper.list(cateCode, cateCode);
		}
	}

	// 상품 조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return orderMapper.goodsView(gdsNum);
	}

	// 상품 소감(댓글) 작성
//		@Override
//		public void registReply(ReplyVO reply) throws Exception {
//			dao.registReply(reply);		
//		}

	// 상품 소감(댓글) 리스트
//		@Override
//		public List<ReplyListVO> replyList(int gdsNum) throws Exception {
//			return dao.replyList(gdsNum);
//		}

	// 상품 소감(댓글) 삭제
//		@Override
//		public void deleteReply(ReplyVO reply) throws Exception {
//			dao.deleteReply(reply);
//		}

	// 아이디 체크
//		@Override
//		public String idCheck(int repNum) throws Exception {
//			return dao.idCheck(repNum);
//		}

	// 상품 소감(댓글) 수정
//		@Override
//		public void modifyReply(ReplyVO reply) throws Exception {
//			dao.modifyReply(reply);
//		}

	// 카트 담기
	@Override
	public void addCart(CartListVO cart) throws Exception {
		orderMapper.addCart(cart);
	}

	// 카트 리스트
	@Override
	public List<Map<String, Object>> cartList(Map<String, Object> paramMap) throws Exception {
//		public List<CartListVO> cartList(String userId) throws Exception {
		return orderMapper.cartList(paramMap);
	}

	// 카트 삭제
	@Override
//		public void deleteCart(CartVO cart) throws Exception {
	public void deleteCart(Map<String, Object> paramMap) throws Exception {
		orderMapper.deleteCart(paramMap);
	}
	
	@Override
	public void deleteSeparateCart(Map<String, Object> paramMap) throws Exception {
		orderMapper.deleteSeparateCart(paramMap);
	}
	
	@Override
	public void deleteOrderInfoDetails(Map<String, Object> paramMap) throws Exception {
		orderMapper.deleteOrderInfoDetails(paramMap);
	}

	// 주문 정보
	@Override
	public void orderInfo(Map<String, Object> paramMap) throws Exception {
		orderMapper.orderInfo(paramMap);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(Map<String, Object> paramMap) throws Exception {
		orderMapper.orderInfo_Details(paramMap);
	}

	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		orderMapper.cartAllDelete(userId);
	}

	@Override
	public void updateCart(Map<String, Object> paramMap) throws Exception {
		orderMapper.updateCart(paramMap);
	}

	@Override
	public void deleteOrderDetails(Map<String, Object> paramMap) throws Exception {
		orderMapper.deleteOrderDetails(paramMap);
	}

	@Override
	public int maxOrderId() throws Exception {
		return orderMapper.maxOrderId();
	}

	@Override
	public int maxCartNum(Map<String, Object> paramMap) throws Exception {
		return orderMapper.maxCartNum(paramMap);
	}

	// 주문 목록
	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> paramMap) throws Exception {
		// public List<OrderVO> orderList(OrderVO order) throws Exception {
		return orderMapper.orderList(paramMap);
	}

	// 특정 주문
	@Override
	public List<Map<String, Object>> orderView(Map<String, Object> paramMap) throws Exception {
		return orderMapper.orderView(paramMap);
	}

}
