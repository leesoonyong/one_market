package com.honjok.app.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.honjok.app.vo.AdminVO;




@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	//썸머노트 상세입력 시 이미지 업로드 AJAX 컨트롤러
	@RequestMapping(value = "/admin/imageUpload.do", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String handleFileUpload(@RequestParam("uploadFile") MultipartFile multiPartFile) {
		
		String fileName = multiPartFile.getOriginalFilename();
		String filePath = "C:/Users/82103/Documents/GitHub/honjok/src/main/webapp/resources/img/product/"; // 원하는위치 (storage로 잡아주세요)
		File file = new File(filePath, fileName);
		try {
			FileCopyUtils.copy(multiPartFile.getInputStream(), new FileOutputStream(file)); // spring저장소에서 storage로 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("파일네임 알려줘" + fileName);
		return fileName;
	}
	
	//상품등록 시 INSERT시키는 컨트롤러
	@RequestMapping(value="/admin/productWrite.do", method=RequestMethod.POST)
	public String signUp(AdminVO vo, HttpServletRequest request, @RequestParam MultipartFile thumnail) {
		System.out.println("thumnail");
		String filePath = "C:/Users/82103/Documents/GitHub/honjok/src/main/webapp/resources/img/";
		try {
			FileCopyUtils.copy(thumnail.getInputStream(),
					new FileOutputStream(new File(filePath, thumnail.getOriginalFilename()))); // spring저장소에서 storage로 복사
		} catch (IOException e) {
			e.printStackTrace();
		}	
		vo.setThumnailImg(thumnail.getOriginalFilename());
		adminService.insertProduct(vo);
		System.out.println("vo :" + vo);
		return "/main/main.jsp";
    }
	
	
	@RequestMapping(value="/admin/subImageUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public List<String> subImageUpload(MultipartHttpServletRequest multiFile) throws IOException{
		
		System.out.println("안녕");
		List<String> list = new ArrayList<String>();
		String filePath = "C:/Users/82103/Documents/GitHub/honjok/src/main/webapp/resources/img/product";
		List<MultipartFile> fileList = multiFile.getFiles("subImage");
		Iterator<String> fileNames = multiFile.getFileNames();
		System.out.println("src value : " + fileNames);
		
		for(MultipartFile multiFile2 : fileList) {
			//파일 실제이름 
			String fileName = multiFile2.getOriginalFilename();
    		System.out.println(fileName);
			
			//파일 이름 하나씩 저장
			System.out.println(fileList);
			File file = new File(filePath, fileName);
			if( multiFile2.getSize() != 0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
			}		
			fileName = UUID.randomUUID().toString();
			System.out.println(fileName);
			multiFile2.transferTo(new File(filePath, fileName));
				
			
			AdminVO vo = new AdminVO();
			list.add(fileName);
			vo.setSubImg(list);
			System.out.println(list);
			System.out.println(vo);
		}
		
		return list;
	}
	
	@RequestMapping(value="/admin/subImageUploadDel.do", method=RequestMethod.POST)
	@ResponseBody
	public void subImageUploadDel(String fileName) {
		System.out.println("데이터");
		System.out.println(fileName);
		String filePath = "C:/Users/82103/Documents/GitHub/honjok/src/main/webapp/resources/img/"+fileName;
		System.out.println(filePath);
		
		File file = new File(filePath);
		if(file.exists()==true) {
			System.out.println("삭제하고있냐");
			file.delete();
			
		}
	}
	
}
