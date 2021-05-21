package com.mall.login.serviceImpl;

import java.util.Map;

public interface loginMapper {

	public Integer memberLogin(Map<String, Object> paramMap) throws Exception;

	public void insertMember(Map<String, Object> paramMap) throws Exception;

	public void insertMemberHis(Map<String, Object> paramMap) throws Exception;

	public Map<String, Object> selectMember(String member) throws Exception;
}
