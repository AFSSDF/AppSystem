package cn.appsys.service.datadictionary;

import java.util.List;

import cn.appsys.pojo.DataDictionary;

public interface DataDictionaryService {

	List<DataDictionary> getDataDictionaryList(String tcode) throws Exception;

}
