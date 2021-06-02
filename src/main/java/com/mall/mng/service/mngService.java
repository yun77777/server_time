package com.mall.mng.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.vo.CategoryVO;
import com.mall.vo.GoodsVO;

public interface mngService {

	public List<CategoryVO> category() throws Exception;

	public void register(GoodsVO vo, Map<String, Object> paramMap, MultipartHttpServletRequest multi,
			HttpServletRequest request) throws Exception;

	public void updateItem(Map<String, Object> paramMap, MultipartHttpServletRequest multi,
//			public void updateItem(GoodsVO vo, Map<String, Object> paramMap, MultipartHttpServletRequest multi,
			HttpServletRequest request) throws Exception;

	List<Map<String, Object>> selectItemList(Map<String, Object> paramMap) throws Exception;

	List<Map<String, Object>> selectItemImgList(Map<String, Object> paramMap) throws Exception;

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
