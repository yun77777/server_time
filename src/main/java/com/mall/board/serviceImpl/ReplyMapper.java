package com.mall.board.serviceImpl;

import java.util.List;
import java.util.Map;

public interface ReplyMapper {
	public List<Map<String, Object>> list(Map<String, Object> paramMap) throws Exception;

	public void write(Map<String, Object> paramMap) throws Exception;

	public void modify(Map<String, Object> paramMap) throws Exception;

	public void delete(Map<String, Object> paramMap) throws Exception;

}
