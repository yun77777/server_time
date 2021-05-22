package com.mall.order.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mall.order.service.orderService;

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

}
