package com.example.web.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.example.dto.EmployeeDetail;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;
import com.example.service.admin.EmployeeService;
import com.example.vo.Employee;
import com.example.web.request.EmployeeModifyForm;

@Controller
@RequestMapping("/emp")
@SessionAttributes({"form"})
public class EmployeeController {

	private final String directory = "C:\\app\\eGovFrameDev-4.0.0-64bit\\workspace\\fitness-management\\src\\main\\webapp\\resources\\images";
	
	@Autowired
	EmployeeService employeeService;
	
	// 직원 조회
	@GetMapping("/list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "status", required = false, defaultValue = "") String status,
			@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword, Model model) {
		Map<String, Object> result = employeeService.getAllEmployee(page,status,keyword);
		// 직원 목록 정보
		model.addAttribute("employees", result.get("employees"));
		// 페이징처리에 필요한 정보
		model.addAttribute("pagination", result.get("pagination"));
		
		return "admin/employee/list";
	}
	
	// 아이디로 직원 정보 조회
	@GetMapping("/detail.json")
	@ResponseBody
	public Employee detail(@RequestParam(name = "empId") String empId) {
		return employeeService.getEmployeeById(empId);
	}
	
	// 내 정보 조회
	@GetMapping("/mypage")
	public String mypage(@AuthenticatedUser LoginUser loginUser, Model model) {
		EmployeeDetail employeeDetail = employeeService.getEmployeeDetail(loginUser.getId());
		model.addAttribute("employee", employeeDetail);
		
		return "/employee/mypage";
	}
	
	// 내 정보 수정페이지
	@GetMapping("/modify")
	public String modifyForm(@AuthenticatedUser LoginUser loginUser, Model model) {
		EmployeeDetail employeeDetail = employeeService.getEmployeeDetail(loginUser.getId());
		model.addAttribute("employee", employeeDetail);
		
		return "/employee/modify";
	}
	
	// 내 정보 수정
	@PostMapping("/modify")
	public String mypageModify(@Valid @ModelAttribute("form") EmployeeModifyForm form, BindingResult errors) throws IOException {
		System.out.println(errors);
		if (errors.hasErrors()) {			
			return "admin/employee/mypage-modify";
		}
		
		MultipartFile upfile = form.getUpfile();
		if (!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			form.setPhoto(filename);
			
			FileCopyUtils.copy(upfile.getInputStream(), new FileOutputStream(new File(directory, filename)));
		}
		
		employeeService.updateEmployee(form);
		
		return "redirect:mypage?empId=" + form.getId();
	}
}
