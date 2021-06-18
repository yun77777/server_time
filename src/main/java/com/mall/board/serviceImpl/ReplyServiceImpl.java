package com.mall.board.serviceImpl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.board.service.ReplyService;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper replyMapper;

		@Override
		public List<Map<String, Object>> list(Map<String, Object> paramMap) throws Exception {
			return replyMapper.list(paramMap);
		}

		@Override
		public void write(Map<String, Object> paramMap) throws Exception {
			replyMapper.write(paramMap);
		}

		@Override
		public void modify(Map<String, Object> paramMap) throws Exception {
			replyMapper.modify(paramMap);
		}

		@Override
		public void delete(Map<String, Object> paramMap) throws Exception {
			replyMapper.delete(paramMap);
		}
}
