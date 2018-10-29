package cn.appsys.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.appsys.pojo.DataDictionary;
import cn.appsys.service.datadictionary.DataDictionaryService;

/**
 * 
 * @author Li
 *
 */
@Controller
@RequestMapping("/datadictionary")
public class DataDictionaryController {
	@Resource
	private DataDictionaryService dataDictionaryService;
	
	//根据类型编码获得列表
	@RequestMapping(value = "/datadictionarylist", method = RequestMethod.GET)
	@ResponseBody
	public Object dataDictionaryList(@RequestParam String tcode) throws Exception {
		List<DataDictionary> dataDictionaries = dataDictionaryService.getDataDictionaryList(tcode);
		return dataDictionaries;
	}

}
