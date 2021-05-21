package com.mall.mng.serviceImpl;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mall.common.FileUtils;
import com.mall.mng.service.mngService;

@Service("mngService")
public class mngServiceImpl implements mngService{
	@Autowired
	private mngMapper mngMapper;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

}
