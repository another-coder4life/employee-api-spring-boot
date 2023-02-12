package com.coder4life.api.service;

import com.coder4life.api.domain.Employee;
import com.coder4life.api.repository.EmployeeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class EmployeeService {

    private EmployeeRepository employeeRepository;

    public List<Employee> getAll() {
        return employeeRepository.findAll();
    }

    public Employee create(final Employee employee) {
        return employeeRepository.save(employee);
    }

    public Optional<Employee> getById(final Long id) {
        return employeeRepository.findById(id);
    }

    public Employee update(final Employee employee) {
        Optional<Employee> existingEmployee = employeeRepository.findById(employee.getId());
        if (existingEmployee.isPresent()) {
            return existingEmployee.map(ee -> {
                ee.setFirstname(employee.getFirstname());
                ee.setLastname(employee.getLastname());
                ee.setEmail(employee.getEmail());
                ee.setDepartment(employee.getDepartment());
                ee.setSkill(employee.getSkill());
                return employeeRepository.save(ee);
            }).get();
        }

        return null;
    }

    public void delete(final Long id) {
        employeeRepository.deleteById(id);
    }

}
