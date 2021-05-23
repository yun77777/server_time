package com.mall.mng.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mall.mng.service.mngService;
import com.mall.vo.CategoryVO;
import com.mall.vo.GoodsVO;

@Service("mngService")
public class mngServiceImpl implements mngService{
	@Autowired
	private mngMapper mngMapper;
	
	@Override
	public List<CategoryVO> category() throws Exception {
		return mngMapper.category();
	}

	// 상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		mngMapper.register(vo);		
	}
}
