package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.TourDto;

@Mapper
public interface TourMapper {
	void writeOk(TourDto tdto);
	ArrayList<TourDto> list(int index);
	void readnum(String id);
	TourDto content(String id);
	String originfname(String id);
	void updateOk(TourDto tdto);
	void delete(String id);
	int chong();

}
