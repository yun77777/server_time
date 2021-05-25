package com.mall.order.service;

import java.util.List;
import java.util.Map;

import com.mall.vo.CartListVO;
import com.mall.vo.CartVO;
import com.mall.vo.GoodsViewVO;
import com.mall.vo.OrderDetailVO;
import com.mall.vo.OrderListVO;
import com.mall.vo.OrderVO;

public interface orderService {

	public Map<String, Object> selectOrderDetail(Map<String, Object> paramMap) throws Exception;

	// 카테고리별 상품 리스트
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;

	// 상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;

	// 상품 소감(댓글) 작성
//	public void registReply(ReplyVO reply) throws Exception;

	// 상품 소감(댓글) 리스트
//	public List<ReplyListVO> replyList(int gdsNum) throws Exception;

	// 상품 소감(댓글) 삭제
//	public void deleteReply(ReplyVO reply) throws Exception;

	// 아이디 체크
//	public String idCheck(int repNum) throws Exception;

	// 상품 소감(댓글) 수정
//	public void modifyReply(ReplyVO reply) throws Exception;

	// 카트 담기
	public void addCart(CartListVO cart) throws Exception;

	// 카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;

	// 카트 삭제
	public void deleteCart(Map<String, Object> paramMapt) throws Exception;
//	public void deleteCart(CartVO cart) throws Exception;

	// 주문 정보
	public void orderInfo(Map<String, Object> paramMap) throws Exception;

	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	// 카트 비우기
	public void cartAllDelete(String userId) throws Exception;

	// 주문 목록
	public List<Map<String, Object>> orderList(Map<String, Object> paramMap) throws Exception;
//	public List<OrderVO> orderList(Map<String, Object> paramMap) throws Exception;
//	public List<OrderVO> orderList(OrderVO order) throws Exception;

	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
}
