//package com.itwillbs.order.controller;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.inject.Inject;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.JSONArray;
//import org.json.JSONObject;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.itwillbs.order.service.OrderService;
//
//
//
//
//
//@RestController
//public class OrderAjaxController {
//
//	
//	@Inject
//	private OrderService OrderService;
//	
//
//	@RequestMapping(value = "/order/oaList", method = RequestMethod.GET)
//	public String ODlist(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		System.out.println("OrderAjaxController oaList()");
//		String clntId = request.getParameter("clntId"); // �???�??? ?��? ?�기
//		String orderId = request.getParameter("orderId");
//		JSONArray array = new JSONArray(); // Json 배�??
//		List<Map<String, Object>> oalist = OrderService.getOaLiMap(clntId); // �???�??? ?��?��???? ?��??리�?��??
//		
//		if(oalist.size()==0) {
//			JSONObject jsobject = new JSONObject();
//			
//			jsobject.put("clntId", clntId);
//			jsobject.put("orderId", orderId);
//			array.put(jsobject);
//		}
//		else {
//		for(int i=0;i<oalist.size();i++) {
//			Map<String, Object> oaliDTO = oalist.get(i);
//			JSONObject jsobject = new JSONObject(); // ???��?? �?�?
//			System.out.println("clntCd : " + oaliDTO.get("clntCd"));
//			if(oaliDTO.get("dbReason")==null){ // �????��??�? null?�면 공백 �??��??�?
//				jsobject.put("dbReason", "");
//			}else {
//				jsobject.put("dbReason", oaliDTO.get("dbReason"));
//			}
//			jsobject.put("workNum", oaliDTO.get("workNum"));
//			jsobject.put("itemNum", oaliDTO.get("itemNum"));
//			jsobject.put("itemName", oaliDTO.get("itemName"));
//			jsobject.put("performDate", oaliDTO.get("performDate"));
//			jsobject.put("gbYn", oaliDTO.get("gbYn"));
//			jsobject.put("performQty", oaliDTO.get("performQty"));
//			jsobject.put("performId", oaliDTO.get("performId"));
//			jsobject.put("instrId", oaliDTO.get("instrId"));
//			// ???��?��?체�?? ??�??? ?�기
//			System.out.println("dbReason : " + oaliDTO.get("dbReason"));
//			
//			array.put(jsobject); // ???��?? 배�?��?? �?�? ?�기
//		}
//		}
//		System.out.println("array : "+ array);
//		response.setContentType("application/x-json; charset=UTF-8"); // ??�? ??깨�?�?
//		response.getWriter().print(array); // ??린�?��??�?
//
//		return null;
//	}
//	
//	
//	@RequestMapping(value = "/work/reqlist", method = RequestMethod.GET)
//	public ResponseEntity<List<Map<String, Object>>> reqlist(HttpServletRequest request, HttpServletResponse response){
//		System.out.println("PerformAjaxController reqlist()");
//		String performId= request.getParameter("performId"); // ?��?? �??? ?��? ?�기
//		List<Map<String, Object>> reqlist = OrderService.ReqList(performId); // �???�??? ?��?��???? ?��??리�?��??
//
//		ResponseEntity<List<Map<String, Object>>> entity =
//				new ResponseEntity<List<Map<String, Object>>>(reqlist,HttpStatus.OK);
//		return entity;
//	}
//	
//	
//	
//	
//	
//}
