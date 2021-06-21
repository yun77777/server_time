package com.server.time.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.server.time.service.boardService;

@Controller
public class boardController {

	private static final Logger logger = LoggerFactory.getLogger(boardController.class);

	@Resource(name = "boardService")
	private boardService boardService;

	@RequestMapping(value = "/test.do")
	public String test(Map<String, Object> paramMap, HttpSession httpSession, Model model) {

		return "/test";
	}

}
