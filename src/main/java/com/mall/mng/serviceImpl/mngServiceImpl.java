package com.mall.mng.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mall.mng.service.mngService;

@Service("mngService")
public class mngServiceImpl implements mngService{
	@Autowired
	private mngMapper mngMapper;
	

}
