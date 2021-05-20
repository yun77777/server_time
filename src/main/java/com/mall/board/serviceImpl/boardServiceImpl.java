package com.mall.board.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.board.service.boardService;
import com.mall.common.FileUtils;

@Service("boardService")
public class boardServiceImpl implements boardService {
	@Autowired
	private boardMapper boardMapper;
	
//	@Resource(name = "fileUtils")
//	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectBoardHisList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardHisList(paramMap);
	}

	@Override
	public Map<String, Object> selectContent(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectContent(paramMap);
	}

	public Integer selectBoardListCnt(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardListCnt(paramMap);
	}

	public Integer memberLogin(Map<String, Object> paramMap) throws Exception {
		System.err.println("login@:" + paramMap);
		System.err.println(boardMapper.memberLogin(paramMap));
		return boardMapper.memberLogin(paramMap);
	}

	public Integer selectBoardMaxNo(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardMaxNo(paramMap);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> paramMap) throws Exception {
		boardMapper.updateCnt(paramMap);
		return boardMapper.selectBoardDetail(paramMap);
	}

	@Override
	public void insertBoard(Map<String, Object> paramMap, MultipartHttpServletRequest multi, HttpServletRequest request)
			throws Exception {
		System.err.println("$$$$$$$$$:" + paramMap);
		boardMapper.mergeBoard(paramMap);
		boardMapper.insertHisBoard(paramMap);
		
//		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(paramMap, multi); 
//		int size = list.size();
//		for(int i=0; i<size; i++){ 
//			boardMapper.insertFile(list.get(i)); 
//		}
	}

	@Override
	public void insertMember(Map<String, Object> paramMap, MultipartHttpServletRequest multi,
			HttpServletRequest request) throws Exception {
		System.err.println("$$$$$$$$$:" + paramMap);
		boardMapper.insertMember(paramMap);
		boardMapper.insertMemberHis(paramMap);
	}

	@Override
	public void deleteBoard(Map<String, Object> paramMap, MultipartHttpServletRequest multi, HttpServletRequest request)
			throws Exception {
		boardMapper.deleteBoard(paramMap);
		paramMap.put("DEL_YN", "Y");
		boardMapper.insertHisBoard(paramMap);
	}

}
