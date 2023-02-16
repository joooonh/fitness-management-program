package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.ProgramDayDto;
import com.example.dto.ProgramDto;
import com.example.vo.Program;
import com.example.vo.ProgramCategory;
import com.example.vo.ProgramDay;
import com.example.vo.User;

@Mapper
public interface ProgramMapper {
	
	// 프로그램 번호로 해당 프로그램 정보 조회
	Program getProgramByProgramNo(int programNo);
	// 모든 프로그램 목록
	List<Program> getAllPrograms(Map<String, Object> param);
	int getTotalRowsBySearch(Map<String, Object> rows);
	// 프로그램 상세정보
	ProgramDto getProgramDetail(int programNo); 
	// 프로그램에 해당하는 요일 조회
	List<ProgramDayDto> getDaysByProgramNo(int programNo);
	// 프로그램에 해당하는 요일 조회
	List<ProgramDayDto> getDaysByProgramNoStatusY(int programNo);
	// 프로그램 신청자 목록
	List<User> getUsersByProgramNo(int programNo);
	// 프로그램 카테고리 목록
	List<ProgramCategory> getProgramCategory();
	// 프로그램 등록
	void insertProgram(Program program);
	// 프로그램 진행 요일 등록
	void insertProgramDays(ProgramDay programDay);
	// 프로그램 수정
	void updateProgram(Program program);
	// 프로그램 요일 수정
	void updateProgramDay(ProgramDay programDay);
	// 프로그램 삭제
	void deleteProgram(int programNo);
	// 프로그램 진행 요일 삭제
	void deleteProgramDays(int programNo);
	
}
