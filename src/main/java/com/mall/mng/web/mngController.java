package com.mall.mng.web;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import com.mall.mng.service.mngService;

@Controller
public class mngController {

	private static final Logger logger = LoggerFactory.getLogger(mngController.class);

	@Resource(name = "mngService")
	private mngService mngService;

}
