package com.cons.write;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.AjaxWriteListJson;
import com.cons.beans.consDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class AjaxListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// parameter 받아오기, 없으면 json 동작 디폴트로
		String reqType = request.getParameter("reqType");
		if (reqType == null)
			reqType = "json";

		// "xml" 혹은 "json" 으로 response 하기
		switch (reqType) {
		default:
			// responseJSON(request, response); // org.json 사용
			responseJSON2(request, response); // Jackson 사용
		} // end switch

	} // end execute()

	private void responseJSON2(HttpServletRequest request, HttpServletResponse response) {
		consDTO[] dtoArr = (consDTO[]) request.getAttribute("list");

		AjaxWriteListJson list = new AjaxWriteListJson(); // response 할 Java 객체

		if (dtoArr == null) {
			list.setStatus("FAIL");
		} else {
			list.setStatus("OK");
			list.setCount(dtoArr.length);
			list.setList(Arrays.asList(dtoArr));
		}

		ObjectMapper mapper = new ObjectMapper();// JSON 으로 매핑할 Mapper 객체

		try {
			// Java객체 --> JSON 문자열로 변환
			String jsonString = mapper.writeValueAsString(list);

			response.setContentType("application/json; charset=utf-8"); // MIME 설정
			response.getWriter().write(jsonString); // response 보내기.
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // end responseJSON2()

}
