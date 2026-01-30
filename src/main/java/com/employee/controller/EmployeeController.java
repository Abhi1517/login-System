package com.employee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;   // ✅ IMPORTANT
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;

@Controller 
public class EmployeeController {

    @Autowired
    private EmployeeDAO employeeDAO;


    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }


    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        return "register";
    }

    @PostMapping("/save")
    public String saveEmployee(Employee emp, Model model) {

        if (emp == null || emp.getLogin_id() == null || emp.getLogin_id().trim().isEmpty()) {
            model.addAttribute("error", "Login ID is required");
            return "register";
        }

        if (employeeDAO.isLoginIdExists(emp.getLogin_id().trim())) {
            model.addAttribute("error", "Login ID already registered");
            return "register";
        }

        employeeDAO.save(emp);

        return "redirect:/login";
    }

    @PostMapping("/login")
    public String login(HttpServletRequest request, Model model) {

        String loginId = request.getParameter("login_id");
        String password = request.getParameter("password");

        if (loginId == null || password == null) {
            model.addAttribute("error", "Login ID and Password required");
            return "login";
        }

        Employee emp = employeeDAO.login(loginId.trim(), password);

        if (emp != null) {
            request.getSession().setAttribute("loggedUser", emp);
            return "redirect:/welcome";
        }

        model.addAttribute("error", "Invalid Login Credentials");
        return "login";
    }


    @GetMapping("/welcome")
    public String showWelcomePage(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        Employee emp = (Employee) session.getAttribute("loggedUser");

        model.addAttribute("name", emp.getName());
        model.addAttribute("list", employeeDAO.getAllEmployees());

        return "welcome";
    }


    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        return "redirect:/login";
    }
}
