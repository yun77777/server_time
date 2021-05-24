package com.mall.mng.serviceImpl;

import java.util.List;
import java.util.Map;

import com.mall.vo.CategoryVO;
import com.mall.vo.GoodsVO;

public interface mngMapper {
	public List<CategoryVO> category() throws Exception;

	public void register(GoodsVO vo) throws Exception;

	public List<Map<String, Object>> selectItemList(Map<String, Object> paramMap) throws Exception;

	public Map<String, Object> selectItemDetail(Map<String, Object> paramMap) throws Exception;

	public Integer selectItemListMaxNo(Map<String, Object> paramMap) throws Exception;

}
