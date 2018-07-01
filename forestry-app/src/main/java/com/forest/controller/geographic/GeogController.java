package com.forest.controller.geographic;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.dto.geoinfo.GeoInfoQueryResultDTO;
import com.forest.entity.geographic.GeogInfo;
import com.forest.service.geographic.GeogService;
import com.google.gson.Gson;

/**   
* @Title: UserController.java 
* @Description: ÓÃ»§¿ØÖÆÆ÷
* @author TingTing Song
* @version V1.0   
*/
@Controller
@RequestMapping(value = "/geog")
public class GeogController {

	@Resource
    private GeogService geogService;

    @RequestMapping("/toList.do")
    public String toList() {
        return "geographic/list";
    }

    @RequestMapping(value="list.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public String getList(@RequestParam(name="name",required=false) String name,
    		@RequestParam(name="type",required=false) String type,
    		@RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
    	GeogInfo ou = new GeogInfo();
    	ou.setPageIndex(Integer.parseInt(pageIndex)*Integer.parseInt(pageSize));
    	ou.setPageSize(Integer.parseInt(pageSize));
    	ou.setName(name);
    	if(!StringUtils.isEmpty(type))
    	ou.setType(Integer.parseInt(type));
		GeoInfoQueryResultDTO resultDTO = geogService.geogList(ou);
    	return new Gson().toJson(resultDTO);
    }
    
    @RequestMapping(value="save.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public void save(@RequestParam(name="data")String data) {
    	GeogInfo ou = new GeogInfo();
    	ou = new Gson().fromJson(data, GeogInfo.class);
    	if(0 != ou.getId()){
    		geogService.updateGeogInfo(ou);
    	} else {
    		geogService.insertGeogInfo(ou);
    	}
    	
    }
    
    
    @RequestMapping(value="delete.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public void delete(@RequestParam(name="ids")String ids) {
    	String[] ss = ids.split(",");
    	for(String s : ss){
    		if(!StringUtils.isEmpty(s))
    			geogService.deleteGeogInfo(Integer.parseInt(s));
    	}
    	
    }
    

}
