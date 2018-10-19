package com.li.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by 99234 on 2018/10/12.
 */
public class Department {
    private int id;
    private String name;
    private List<Position> positions;
    private Date createTime;

    public Department() {
    }

    public Department(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Department(int id, String name, Date createTime) {
        this.id = id;
        this.name = name;
        this.createTime = createTime;
    }

    public Department(int id, String name, List<Position> positions) {
        this.id = id;
        this.name = name;
        this.positions = positions;
    }

    public Department(int id, String name, List<Position> positions, Date createTime) {
        this.id = id;
        this.name = name;
        this.positions = positions;
        this.createTime = createTime;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", positions=" + positions +
                ", createTime=" + createTime +
                '}';
    }
}
