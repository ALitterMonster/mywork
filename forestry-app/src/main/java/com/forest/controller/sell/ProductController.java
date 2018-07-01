package com.forest.controller.sell;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.product.ProductQueryReusltDTO;
import com.forest.dto.product.ProductQueryReusltData;
import com.forest.entity.product.ForestryProductHistory;
import com.forest.entity.product.ForestryProductInfo;
import com.forest.service.product.ProductHisService;
import com.forest.service.product.ProductService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	@Autowired
	private ProductService productService; 
	@Autowired
	private ProductHisService productHisService;
	/**
	 * 采伐计划管理页面
	 * @return
	 */
	 @RequestMapping(value="/queryList.do",method = RequestMethod.GET)
	 public String planList() {
	    return "product/product";
	  }
	 
	 @RequestMapping(value="/otherProdect.do",method = RequestMethod.GET)
	 public String productList() {
	    return "product/otherProduct";
	  }
	 @ResponseBody
	 @RequestMapping(value="/queryProductList.do",produces = "application/json; charset=utf-8")
	 public String queryPlanList(@RequestParam(value="productName",required=false) String productName,
			 @RequestParam(value="type",required=false) String type,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 ProductQueryReusltDTO resultDTO= new ProductQueryReusltDTO();
		 queryParam.put("pageIndex",Integer.parseInt(pageIndex)*Integer.parseInt(pageSize));
		 queryParam.put("pageSize",Integer.parseInt(pageSize));
		 queryParam.put("isValid","1");
		 queryParam.put("type",type);
		 try {
		 if(!StringUtils.isEmpty(productName)){
			 queryParam.put("productName",productName);
		 }
		
		 resultDTO = productService.queryList(queryParam);
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
	 @ResponseBody
	 @RequestMapping(value="/queryById.do",produces = "application/json; charset=utf-8")
	 public String queryById(@RequestParam(value="id") String id) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 ProductQueryReusltData resultDTO= new ProductQueryReusltData();
		 
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = productService.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
	 /**
	  * 新增采伐计划
	  * @param planInfo
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/add.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String addPlan(@RequestParam("data") String data) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryProductInfo dto = gson.fromJson(data, ForestryProductInfo.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 resultDTO = productService.insert(dto);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDelete.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String batchDelete(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = productService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 
	 /**
	  * 更新采伐计划
	  * @param planInfo
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/update.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String update(@RequestParam("data") String data) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryProductInfo dto = gson.fromJson(data, ForestryProductInfo.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(dto.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = productService.update(dto);
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/addProduct.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String addProduct(@RequestParam("data") String data) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryProductHistory dto = gson.fromJson(data, ForestryProductHistory.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(dto.getProductId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = productHisService.insert(dto);
		 return new Gson().toJson(resultDTO);
	  }
	
}
