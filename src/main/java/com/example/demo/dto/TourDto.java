package com.example.demo.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TourDto {
	int id,readnum;
	String title, name,pwd,content,writeday,ofname,string,fname;
}
