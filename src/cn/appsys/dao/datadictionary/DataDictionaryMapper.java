package cn.appsys.dao.datadictionary;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.DataDictionary;

public interface DataDictionaryMapper {

	List<DataDictionary> getDateByTypeCode(@Param("typeCode") String typeCode) throws Exception;

}
