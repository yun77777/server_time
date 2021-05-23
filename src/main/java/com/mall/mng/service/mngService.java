package com.mall.mng.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.vo.CategoryVO;
import com.mall.vo.GoodsVO;

public interface mngService {
	
	public List<CategoryVO> category() throws Exception;

	public void register(GoodsVO vo) throws Exception;
}
