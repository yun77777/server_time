package com.mall.mng.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.board.serviceImpl.boardMapper;
import com.mall.common.FileUtils;
import com.mall.mng.service.mngService;
import com.mall.vo.CategoryVO;
import com.mall.vo.GoodsVO;

@Service("mngService")
public class mngServiceImpl implements mngService {
	@Autowired
	private mngMapper mngMapper;

	@Autowired
	private boardMapper boardMapper;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<CategoryVO> category() throws Exception {
		return mngMapper.category();
	}

	// 상품등록
	@Override
	public void register(GoodsVO vo, Map<String, Object> paramMap, MultipartHttpServletRequest multi,
			HttpServletRequest request) throws Exception {

		paramMap.put("no", vo.getGdsNum());
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(paramMap, multi);
		int size = list.size();
		System.err.println("multi list:" + list);
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				boardMapper.insertFile(list.get(i));
			}
		}

		mngMapper.register(vo);
	}

	@Override
	public List<Map<String, Object>> selectItemList(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectItemImgList(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemImgList(paramMap);
	}

	@Override
	public Map<String, Object> selectItemDetail(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemDetail(paramMap);
	}

	public Integer selectItemListMaxNo(Map<String, Object> paramMap) throws Exception {
		int maxNo;

		if (mngMapper.selectItemListMaxNo(paramMap) == null)
			maxNo = 0;
		else
			maxNo = mngMapper.selectItemListMaxNo(paramMap);
		return maxNo;
	}

	public Integer selectItemListCnt(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemListCnt(paramMap);
	}
}
