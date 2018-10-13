package com.li.entity;

import java.util.List;

/**
 * Created by 99234 on 2018/10/12.
 */
public class Department {
    private int id;
    private String name;
    private List<Position> positions;
    private List<Employee> employees;

    public Department() {
    }

    public Department(int id, String name, List<Position> positions) {
        this.id = id;
        this.name = name;
        this.positions = positions;
    }

    public Department(int id, String name, List<Position> positions, List<Employee> employees) {
        this.id = id;
        this.name = name;
        this.positions = positions;
        this.employees = employees;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Position> getPositions() {
        return positions;
    }

    public void setPositions(List<Position> positions) {
        this.positions = positions;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", positions=" + positions +
                ", employees=" + employees +
                '}';
    }
}
