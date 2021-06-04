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
	public void updateItem(Map<String, Object> paramMap, String [] files, String [] fileNames, MultipartHttpServletRequest multi) throws Exception {
		// paramMap.put("gdsNum", vo.getGdsNum());
//		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(paramMap, multi);
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(paramMap, files, fileNames, multi);
		int size = list.size();
		//mngMapper.updateItem(paramMap, files, fileNames, multi);
		System.err.println("multi list:" + list);
		// 파일지우기
		// boardMapper.deleteFile(paramMap);
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				if(list.get(i).get("NEW_ITEM").equals("Y"))
					
					boardMapper.insertFile(list.get(i));
				else {
					boardMapper.updateFile(list.get(i));
					boardMapper.selectFile(list.get(i));
					System.err.println("기존리스트:"+boardMapper.selectBoardFileList(paramMap));
					System.err.println("기존리스@트:"+boardMapper.selectFile(list.get(i)));
				}
			}
		}
		
		//mngMapper.updateItem(paramMap); //본문수정 나중에
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
	public List<Map<String, Object>> selectCommonCodes(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCommonCodes(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectCategoryCode(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectCategoryCode(paramMap);
	}

	@Override
	public Map<String, Object> selectItemDetail(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemDetail(paramMap);
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
	public Integer selectItemListCnt(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectItemListCnt(paramMap);
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
	public List<Map<String, Object>> selectOrderDetail(Map<String, Object> paramMap) throws Exception {
		return mngMapper.selectOrderDetail(paramMap);
	}
	
	@Override
	public void updateOrderState(Map<String, Object> paramMap) {
		mngMapper.updateOrderState(paramMap);
	}

}
