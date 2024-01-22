package com.EmpManagement.System.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.EmpManagement.System.entity.Employee;
import com.EmpManagement.System.service.EmpService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService service;
	
	@GetMapping("/")
	public String home(Model m)
	{
		List<Employee> emp = service.getAllEmp();
		m.addAttribute("emp", emp);
		
		return "new.html";
	}
	
	@GetMapping("/addemp")
	public String Add_EmpForm()
	{
		return "add_emp.html";
	}
	
	
	@PostMapping("/register")
	public String empRegister(@ModelAttribute Employee e)
	{
		service.addEmp(e);
		
		System.out.println(e);
		
		return "redirect:/";
	}
	
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable int id, Model m)
	{
		Employee e = service.getEmpById(id);
		m.addAttribute("emp", e);
		
		return "edit.html";
	}
	
	
	
	
	@PostMapping("/update")
	public String updateEmp(@ModelAttribute Employee e, HttpSession session)
	{
		service.addEmp(e);
		session.setAttribute("msg", "Emp data updated sucessfully...");
		return "redirect:/";
	}	
	
	
	@GetMapping("/delete/{id}")
	public String deleteEmp(@PathVariable int id, HttpSession session)
	{
		service.deleteEmp(id);
		session.setAttribute("msg", "Emp data deleted sucessfully...");
		return "redirect:/";
	}
	
	
	
	
	
	
}
