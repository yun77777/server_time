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
	public void register(Map<String, Object> paramMap, MultipartHttpServletRequest multi) throws Exception {
		paramMap.put("no", paramMap.get("gdsNum"));
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(paramMap, multi);
		int size = list.size();
		System.err.println("multi list:" + list);
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				boardMapper.insertFile(list.get(i));
			}
		}
		System.err.println("zxczxczxczcx:" + paramMap);
		mngMapper.register(paramMap);
	}

	@Override
	public void updateItem(Map<String, Object> paramMap, String[] files, String[] fileNames,
			MultipartHttpServletRequest multi) throws Exception {
		// paramMap.put("gdsNum", vo.getGdsNum());
//		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(paramMap, multi);
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(paramMap, files, fileNames, multi);
		int size = list.size();
		mngMapper.updateItem(paramMap);
		System.err.println("multi list:" + list);
		// 파일지우기
		// boardMapper.deleteFile(paramMap);
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				if (list.get(i).get("NEW_ITEM").equals("Y"))

					boardMapper.insertFile(list.get(i));
				else {
					boardMapper.updateFile(list.get(i));
					boardMapper.selectFile(list.get(i));
					System.err.println("기존리스트:" + boardMapper.selectBoardFileList(paramMap));
					System.err.println("기존리스@트:" + boardMapper.selectFile(list.get(i)));
				}
			}
		}

		// mngMapper.updateItem(paramMap); //본문수정 나중에
	}

	@Override
	public List<Map<String, Object>> selectCustomerList(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCustomerList(paramMap);
	}
	@Override
	public List<Map<String, Object>> selectItemList(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectItemMainList(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemMainList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectItemImgList(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemImgList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectCommonCodes(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCommonCodes(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectCategoryCode(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCategoryCode(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectCategorySCode(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCategorySCode(paramMap);
	}

	@Override
	public Map<String, Object> selectItemDetail(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemDetail(paramMap);
	}
	
	@Override
	public Map<String, Object> selectCustomerDetail(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCustomerDetail(paramMap);
	}

	@Override
	public Integer selectItemListMaxNo(Map<String, Object> paramMap) throws Exception {
		int maxNo;

		if (mngMapper.selectItemListMaxNo(paramMap) == null)
			maxNo = 0;
		else
			maxNo = mngMapper.selectItemListMaxNo(paramMap);
		return maxNo;
	}

	@Override
	public Integer selectCustomerListCnt(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCustomerListCnt(paramMap);
	}
	@Override
	public Integer selectItemListCnt(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemListCnt(paramMap);
	}

	@Override
	public Integer selectCommonCodesCnt(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCommonCodesCnt(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectOrderList(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectOrderList(paramMap);
	}

	@Override
	public Integer selectOrderListCnt(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectOrderListCnt(paramMap);
	}

	@Override
	public Integer selectCommonCodesMaxNo(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCommonCodesMaxNo(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectOrderDetail(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectOrderDetail(paramMap);
	}

	@Override
	public void updateOrderState(Map<String, Object> paramMap) {
		mngMapper.updateOrderState(paramMap);
	}

	@Override
	public void updateCommonCodes(Map<String, Object> paramMap) {
		mngMapper.updateCommonCodes(paramMap);
	}

	@Override
	public void deleteCommonCodes(Map<String, Object> paramMap) {
		mngMapper.deleteCommonCodes(paramMap);
	}
	
	@Override
	public void deleteItem(Map<String, Object> paramMap) {
		mngMapper.deleteItem(paramMap);
	}
	@Override
	public void deleteCustomer(Map<String, Object> paramMap) {
		mngMapper.deleteCustomer(paramMap);
	}

	@Override
	public void insertCommonCodes(Map<String, Object> paramMap) throws Exception {
		mngMapper.insertCommonCodes(paramMap);
	}

}
