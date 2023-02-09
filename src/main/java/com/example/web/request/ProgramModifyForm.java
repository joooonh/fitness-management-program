package com.example.web.request;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.example.vo.ProgramDay;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("ProgramModifyForm")
@Getter
@Setter
public class ProgramModifyForm {

	// 프로그램 정보
	private int programNo;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String startHour;
	private String endHour;
	private int quota;
	private int price;
	// 직원 정보
	private String employeeId;
	private String employeeName;
	// 프로그램 분류 정보
	private int categoryNo;
	// 프로그램 진행 요일
	private String day;
}
