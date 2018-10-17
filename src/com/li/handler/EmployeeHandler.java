package com.li.handler;

import com.li.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 99234 on 2018/10/16.
 */
@Controller
@RequestMapping("employee")
public class EmployeeHandler {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private TrainService trainService;
    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private AwardService awardService;
    @Autowired
    private SalaryService salaryService;



}
