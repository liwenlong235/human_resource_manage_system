package com.li.handler;

import com.li.entity.Attendance;
import com.li.entity.Employee;
import com.li.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by 99234 on 2018/10/20.
 */
@Controller
@RequestMapping("managers3")
public class ManagerHandler3 extends ManagerHandler {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private SalaryService salaryService;
    @Autowired
    private AwardService awardService;
    @Autowired
    private TrainService trainService;

    /**
     * 查看全部考勤
     * @param modelMap
     * @return
     */
    @RequestMapping("queryAttendances")
    public String queryAttendance(ModelMap modelMap){
        List<Attendance> attendances = attendanceService.queryAll();
        modelMap.addAttribute("attendances",attendances);
        List<Employee> employees = employeeService.queryEmployees();
        modelMap.addAttribute("employees",employees);
        return "manager/allAttendanceInfo";
    }

    /**
     * 输入查询条件
     * @return
     */
    @RequestMapping("queryAttendanceInput")
    public String queryAttendanceInput(){
        return "manager/emplAttendanceInfo";
    }

    /**
     * 条件查询考勤记录
     * @param name
     * @param month
     * @param modelMap
     * @return
     */
    @RequestMapping("queryEmplAttendance")
    public String queryAttendance(String name,Integer month,ModelMap modelMap){
        if(month<=0||month>12){
            modelMap.addAttribute("flag","monthNG");
            return "manager/emplAttendanceInfo";
        }
        Employee employee = employeeService.queryByName(name);
        if(employee==null){
            if(month!=null){
                List<Attendance> attendances2 = attendanceService.queryByMonth(month);
                modelMap.addAttribute("attendances2",attendances2);
                modelMap.addAttribute("month",month);
                List<Employee> employees = employeeService.queryEmployees();
                modelMap.addAttribute("employees",employees);
                return "manager/emplAttendanceInfo";
            }
            modelMap.addAttribute("flag","nameNG");
            return "manager/emplAttendanceInfo";
        }
        if(month==null){
            List<Attendance> attendances = attendanceService.queryByEId(employee.geteId());
            modelMap.addAttribute("attendances",attendances);
            modelMap.addAttribute("employee",employee);
            return "manager/emplAttendanceInfo";
        }
        List<Attendance> attendances = attendanceService.queryByEIdAndMonth(employee.geteId(),month);
        modelMap.addAttribute("attendances1",attendances);
        modelMap.addAttribute("month",month);
        modelMap.addAttribute("employee",employee);
        return "manager/emplAttendanceInfo";
    }


}
