package com.mall.mng.serviceImpl;

import java.util.List;
import java.util.Map;

import com.mall.vo.CategoryVO;
import com.mall.vo.GoodsVO;

public interface mngMapper {
	public List<CategoryVO> category() throws Exception;

	public void register(GoodsVO vo) throws Exception;

	public void updateItem(Map<String, Object> paramMap) throws Exception;
//	public void updateItem(GoodsVO vo) throws Exception;

	public List<Map<String, Object>> selectItemList(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> selectItemImgList(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> selectCommonCodes(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> selectCategoryCode(Map<String, Object> paramMap) throws Exception;

	public Integer selectItemListCnt(Map<String, Object> paramMap) throws Exception;

	public Map<String, Object> selectItemDetail(Map<String, Object> paramMap) throws Exception;

	public Integer selectItemListMaxNo(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> selectOrderList(Map<String, Object> paramMap) throws Exception;

	public Integer selectOrderListCnt(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> selectOrderDetail(Map<String, Object> paramMap) throws Exception;

	public void updateOrderState(Map<String, Object> paramMap);
}
