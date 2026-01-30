package com.employee.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.employee.model.Employee;

@Repository
@Transactional
public class EmployeeDAOImpl implements EmployeeDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Employee emp) {
        sessionFactory.getCurrentSession().save(emp);
    }

    @Override
    public Employee login(String loginId, String password) {
        String hql = "from Employee where login_id = :lid and password = :pwd";
        return sessionFactory.getCurrentSession()
                .createQuery(hql, Employee.class)
                .setParameter("lid", loginId)
                .setParameter("pwd", password)
                .uniqueResult();
    }

    @Override
    public List<Employee> getAllEmployees() {
        return sessionFactory.getCurrentSession()
                .createQuery("from Employee", Employee.class)
                .list();
    }

    @Override
    public boolean isLoginIdExists(String login_id) {

        String hql = "select count(*) from Employee where login_id = :loginId";

        Long count = (Long) sessionFactory.getCurrentSession()
                .createQuery(hql)
                .setParameter("loginId", login_id)
                .uniqueResult();

        return count != null && count > 0;
    }
}
