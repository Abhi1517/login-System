package com.employee.dao;

import java.util.List;
import com.employee.model.Employee;

public interface EmployeeDAO {

    void save(Employee emp);

    Employee login(String loginId, String password);

    List<Employee> getAllEmployees();

	boolean isLoginIdExists(String login_id);

}
