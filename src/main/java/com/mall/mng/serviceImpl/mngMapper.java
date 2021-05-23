package com.mall.mng.serviceImpl;

import java.util.List;

import com.mall.vo.CategoryVO;
import com.mall.vo.GoodsVO;

public interface mngMapper {
	public List<CategoryVO> category() throws Exception;

	public void register(GoodsVO vo) throws Exception;
}
