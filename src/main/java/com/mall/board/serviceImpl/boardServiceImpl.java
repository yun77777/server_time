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

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectItemList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectItemList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectBoardHisList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardHisList(paramMap);
	}
	
	@Override
	public List<Map<String, Object>> selectBoardFileList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardFileList(paramMap);
	}

	@Override
	public Map<String, Object> selectContent(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectContent(paramMap);
	}

	@Override
	public void updateReply(Map<String, Object> paramMap) throws Exception {
		boardMapper.updateReply(paramMap);
	}
	@Override
	public Map<String, Object> selectFile(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectFile(paramMap);
	}

	@Override
	public Integer selectBoardListCnt(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardListCnt(paramMap);
	}

	@Override
	public Integer memberLogin(Map<String, Object> paramMap) throws Exception {
		System.err.println("login@:" + paramMap);
		System.err.println(boardMapper.memberLogin(paramMap));
		return boardMapper.memberLogin(paramMap);
	}

	@Override
	public Integer selectBoardMaxNo(Map<String, Object> paramMap) throws Exception {
		int maxNo;

		if (boardMapper.selectBoardMaxNo(paramMap) == null)
			maxNo = 0;
		else
			maxNo = boardMapper.selectBoardMaxNo(paramMap);
		return maxNo;
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> paramMap) throws Exception {
		System.err.println("param:" + paramMap);
		System.err.println("oardMapper.selectBoardDetail(paramMap:" + boardMapper.selectBoardDetail(paramMap));
		boardMapper.updateCnt(paramMap);
		return boardMapper.selectBoardDetail(paramMap);
	}

	@Override
	public void insertBoard(Map<String, Object> paramMap, String[] files, String[] fileNames,
			MultipartHttpServletRequest multi) throws Exception {
		System.err.println("$$$$$$$$$:" + paramMap);
		boardMapper.mergeBoard(paramMap);
		//boardMapper.insertHisBoard(paramMap);
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(paramMap, multi);
		int size = list.size();
		
		System.err.println("multi list:" + list);
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				boardMapper.insertFile(list.get(i));
			}
		}

	}
	
	
	
	@Override
	public void updateBoard(Map<String, Object> paramMap, String[] files, String[] fileNames,
			MultipartHttpServletRequest multi) throws Exception {
		// paramMap.put("gdsNum", vo.getGdsNum());
//		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(paramMap, multi);
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(paramMap, files, fileNames, multi);
		int size = list.size();
		boardMapper.updateBoard(paramMap);
		System.err.println("multi list:" + list);
		// 파일지우기
		// boardMapper.deleteFile(paramMap);
		paramMap.put("DEL_GB","N");
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				if (list.get(i).get("NEW_ITEM").equals("Y"))
					boardMapper.insertFile(list.get(i));
				else {
					boardMapper.updateFile(list.get(i));
					System.err.println("기존리스트:" + boardMapper.selectBoardFileList(paramMap));
					System.err.println("기존리스@트:" + boardMapper.selectFile(list.get(i)));
				}
			}
		}

	}


	@Override
	public void insertReply(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		System.err.println("$$$$$$$$$:" + paramMap);
		boardMapper.insertReply(paramMap);

	}

	@Override
	public void insertMember(Map<String, Object> paramMap,
			HttpServletRequest request) throws Exception {
		System.err.println("$$$$$$$$$:" + paramMap);
		boardMapper.insertMember(paramMap);
		boardMapper.insertMemberHis(paramMap);
	}

	@Override
	public void deleteBoard(Map<String, Object> paramMap, HttpServletRequest request)
			throws Exception {
		boardMapper.deleteBoard(paramMap);
		paramMap.put("DEL_YN", "Y");
		boardMapper.insertHisBoard(paramMap);
	}

	@Override
	public void updateFile(Map<String, Object> paramMap, MultipartHttpServletRequest multi, HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
