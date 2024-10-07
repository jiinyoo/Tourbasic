package com.example.demo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.TourDto;
import com.example.demo.mapper.TourMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TourController {
	@Autowired
	TourMapper mapper;
	
	@RequestMapping("/write")
	public String write() {
		return "write";
	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest request) {
		
		int page=request.getParameter("page")==null? 1: Integer.parseInt(request.getParameter("page"));
		int index=(page-1)*10;
		int  pstart=page/10;
		if(page%10==0) {
			pstart=pstart-1;
		}
		pstart=pstart*10+1;
		int pend=pstart+9;
		
		int chong=mapper.chong();
		if(pend > chong) {
			pend=chong;
		}
		
		ArrayList<TourDto> tlist=mapper.list(index);
		model.addAttribute("tlist",tlist);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("page",page);
		
		
		return "list";
	}
	
	@RequestMapping("/writeOk")
	public String wirteOk(MultipartHttpServletRequest multi, TourDto tdto) throws Exception {

		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()) {
		String fname=file.getOriginalFilename();
		String fname1=System.currentTimeMillis()%100000+"_"+fname;  
		String str=ResourceUtils.getFile("classpath:static/file").toPath().toString()+"/"+fname1;
		Path path=Paths.get(str);
		Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
		tdto.setFname(fname1);
		}
		mapper.writeOk(tdto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/readnum")
	public String content(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.readnum(id);
		return "redirect:/content?id="+id;
	}
	
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		TourDto tdto=mapper.content(id);
		tdto.setContent(tdto.getContent().replace("\r\n", "<br>"));
		model.addAttribute("tdto",tdto);
		return "content";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		TourDto tdto=mapper.content(id);
		tdto.setContent(tdto.getContent().replace("\r\n", "<br>"));
		model.addAttribute("tdto",tdto);
		return "update";
	}
	
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) throws Exception {
		String id=request.getParameter("id");
		String str=ResourceUtils.getFile("classpath:static/file").toPath().toString()+"/"+mapper.originfname(id);
		File file=new File(str);
		if(file.exists()) {
			file.delete();
		}
		mapper.delete(id);
		return "redirect:/list";
	}
	
	
@RequestMapping("uploadOk") 
	public String uploadOk(MultipartHttpServletRequest multi, TourDto tdto) throws Exception{
		String id=multi.getParameter("id");
		MultipartFile file =multi.getFile("file");
		if(!file.isEmpty()) {
			String fname=file.getOriginalFilename();
			String fname1=System.currentTimeMillis()%100000+"_"+fname;
			String str=ResourceUtils.getFile("classpath:static/file").toPath().toString()+"/"+fname1;
			Path path=Paths.get(str);
			Files.copy(file.getInputStream(), path,StandardCopyOption.REPLACE_EXISTING);
			String strorigin=ResourceUtils.getFile("classpath:static/file").toPath().toString()+"/"+mapper.originfname(id);
			File file1 =new File(strorigin);
			if(file1.exists()) {
				file1.delete();
			}
			tdto.setFname(fname1);
		} else {
			String originfname=mapper.originfname(id);
			 tdto.setFname(originfname);
		}
		mapper.updateOk(tdto);
		return "redirect:/content?id="+id;
	}




}
