package com.li.handler;

import com.li.entity.*;
import com.li.service.*;
import com.li.utils.DateUtil;
import com.li.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
@Controller
@RequestMapping("employee")
public class EmployeeHandler {
    @Autowired
    private PositionService positionService;
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
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private DissentService dissentService;

    /**
     * 跳转登陆界面
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("loginInput")
    public String loginInput(Integer id,ModelMap modelMap){
        if(id!=null){
            modelMap.addAttribute("updateFlag",id);
        }
        return "employee/login";
    }

    /**
     * 员工登陆验证
     * @param name
     * @param password
     * @param session
     * @param modelMap
     * @return
     */
    @RequestMapping("login")
    public String login(String name, String password, HttpSession session, ModelMap modelMap){
        password = Md5Util.md5(password);
        Employee employee = employeeService.queryByNameAndPassword(name,password);
        if(employee==null){
            modelMap.addAttribute("flag","NG");
            return "employee/login";
        }
        int flag = DateUtil.compareDate(employee.getDimissionTime(),Date.valueOf("1970-01-01"));
        if(flag!=0){
            modelMap.addAttribute("flag","overtime");
            return "employee/login";
        }
        session.removeAttribute("employee");
        session.setAttribute("employee",employee);
        List<Train> trains = trainService.queryAll();
        for(int i=0;i<trains.size();i++){
            Train train = trains.get(i);
            int time = DateUtil.compareDay(train.getStartTime(),new Date(System.currentTimeMillis()));
            if(time<0||train.getdId()!=employee.getdId()){
                trains.remove(i);
            }
        }
        if(trains.size()>0){
            modelMap.addAttribute("trains",trains);
        }
        return "employee/employee";
    }

    /**
     * 跳转更新密码界面
     * @return
     */
    @RequestMapping("updateInput")
    public String updateInput(){
        return "employee/updateEmpl";
    }

    /**
     * 更新密码
     * @param password1
     * @param password2
     * @param session
     * @param modelMap
     * @return
     */
    @RequestMapping("updateEmpl")
    public String updateEmpl(String password1,String password2,HttpSession session,ModelMap modelMap){
        password1 = Md5Util.md5(password1);
        password2 = Md5Util.md5(password2);
        Employee employee = (Employee) session.getAttribute("employee");
        Employee employee1 = employeeService.queryByNameAndPassword(employee.geteName(),password1);
        if(employee1==null){
            modelMap.addAttribute("flag","NG");
            return "employee/updateEmpl";
        }
        employee.setePassword(password2);
        employeeService.updateEmpl(employee);
        return "forward:/employee/loginInput?id=1";
    }

    /**
     * 查看用户信息
     * @param modelMap
     * @return
     */
    @RequestMapping("employeeInfo")
    public String employeeInfo(ModelMap modelMap){
        modelMap.addAttribute("emplInfo","OK");
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        return "employee/employee";
    }

    /**
     * 跳转查看部门员工
     * @param modelMap
     * @return
     */
    @RequestMapping("emplInfoByPsInput")
    public String emplInfoByPsInput(ModelMap modelMap){
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        return "employee/emplInfoByPs";
    }

    /**
     * 按条件查询员工
     * @param dId
     * @param pId
     * @param modelMap
     * @return
     */
    @RequestMapping("emplInfoByPs")
    public String emplInfoByPs(int dId,int pId,ModelMap modelMap){
        List<Employee> employees = employeeService.querySamePosition(dId,pId);
        modelMap.addAttribute("employees",employees);
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        modelMap.addAttribute("flag","OK");
        return "employee/emplInfoByPs";
    }

    /**
     * 跳转上班/下班打卡界面
     * @param modelMap
     * @return
     */
    @RequestMapping("upAndDown")
    public String upAndDown(ModelMap modelMap){
        modelMap.addAttribute("work","work");
        return "employee/employee";
    }
    /**
     * 上班打卡
     * @param session
     * @return
     */
    @RequestMapping("addAttendance")
    @ResponseBody
    public String add(HttpSession session){
        Calendar calendar = Calendar.getInstance();
        int weekOfYear = calendar.get(Calendar.DAY_OF_WEEK);
        if(weekOfYear==7||weekOfYear==1){
            return "weekend";
        }
        Employee employee = (Employee) session.getAttribute("employee");
        Date day = new Date(System.currentTimeMillis());
        List<Attendance> attendances = attendanceService.queryByEId(employee.geteId());
        if(attendances!=null){
            for(int i=0;i<attendances.size();i++){
                int a = DateUtil.compareDay(day,attendances.get(i).getDay());
                if(a==0){
                    return "NG";
                }
            }
        }
        Time morning = new Time(System.currentTimeMillis());
        int month = calendar.get(Calendar.MONTH)+1;
        double lateTime = 0;
        double absenteeism = 0;
        int flag = DateUtil.compareTime(morning,Time.valueOf("09:00:00"));
        if(flag>0){
            lateTime = DateUtil.getDisTime(morning,Time.valueOf("09:00:00"));
            if(lateTime>=3){
                lateTime=0;
                absenteeism = 1;
            }
        }
        Attendance attendance = new Attendance(-1,employee.geteId(),month,day,morning,null,lateTime,absenteeism);
        attendanceService.add(attendance);
        return "OK";
    }

    /**
     * 下班打卡
     * @param session
     * @return
     */
    @RequestMapping("updateAttendance")
    @ResponseBody
    public String updateAttendance(HttpSession session){
        Calendar calendar = Calendar.getInstance();
        int WeekOfYear = calendar.get(Calendar.DAY_OF_WEEK);
        if(WeekOfYear==7||WeekOfYear==1){
            return "weekend";
        }
        Employee employee = (Employee) session.getAttribute("employee");
        Date day = new Date(System.currentTimeMillis());
        List<Attendance> attendances = attendanceService.queryByEId(employee.geteId());
        boolean flag = false;
        if(attendances!=null){
            for(int i=0;i<attendances.size();i++){
                int a = DateUtil.compareDay(day,attendances.get(i).getDay());
                if(a==0){
                    flag = true;
                }
            }
        }
        if(!flag){
            return "null";
        }
        Attendance attendance = attendanceService.queryByDayAndEId(day,employee.geteId());
        if(attendance.getNight()!=null){
            return "double";
        }
        Time night = new Time(System.currentTimeMillis());
        double lateTime = 0;
        double absenteeism = attendance.getAbsenteeism();
        int flag1 = DateUtil.compareTime(night,Time.valueOf("18:00:00"));
        if(flag1<0){
            lateTime = DateUtil.getDisTime(night,Time.valueOf("18:00:00"));
            if(lateTime>=3){
                lateTime=0;
                absenteeism = 1;
            }
        }
        lateTime = lateTime+ attendance.getLateTime();
        attendance.setLateTime(lateTime);
        attendance.setAbsenteeism(absenteeism);
        attendance.setNight(night);
        attendanceService.update(attendance);
        return "OK";
    }

    /**
     * 查看全部考勤
     * @param session
     * @param modelMap
     * @return
     */
    @RequestMapping("attendanceInfo")
    public String attendanceInfo(HttpSession session,ModelMap modelMap){
        Employee employee = (Employee) session.getAttribute("employee");
        List<Attendance> attendances = attendanceService.queryByEId(employee.geteId());
        if(attendances!=null){
            modelMap.addAttribute("attendances",attendances);
        }
        return "employee/attendanceInfo";
    }

    /**
     * 查看个人工资
     * @param modelMap
     * @param session
     * @return
     */
    @RequestMapping("emplSalaryInfo")
    public String querySalary(ModelMap modelMap,HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        List<Salary> salaries = salaryService.queryByEid(employee.geteId());
        if(salaries!=null){
            for(int i=0;i<salaries.size();i++){
                Salary salary = salaries.get(i);
                int deduct = (int)salary.getsDeduct();
                int real = (int)salary.getsReal();
                salary.setsDeduct(deduct);
                salary.setsReal(real);
            }
        }
        modelMap.addAttribute("salaries",salaries);
        return "employee/salaryInfo";
    }

    /**
     * 新增工资异议
     * @param dissent
     * @param sId
     * @return
     */
    @RequestMapping("dissentAdd")
    @ResponseBody
    public String dissentAdd(String dissent,int sId){
        Dissent dissent1 = dissentService.queryBySId(sId);
        if(dissent1!=null){
            return "NG";
        }
        Dissent dissent2 = new Dissent(-1,sId,dissent,0);
        dissentService.add(dissent2);
        return "OK";
    }

    /**
     *
     * @param modelMap
     * @return
     */
    @RequestMapping("emplDissentInfo")
    public String emplDissentInfo(ModelMap modelMap,HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        List<Salary> salaries = salaryService.queryByEid(employee.geteId());
        List<Dissent> dissents = null;
        if(salaries!=null){
            dissents = new ArrayList<>();
            for(int i=0;i<salaries.size();i++){
                Salary salary = salaries.get(i);
                Dissent dissent = dissentService.queryBySId(salary.getsId());
                if(dissent!=null){
                    dissents.add(dissent);
                }
            }
        }
        modelMap.addAttribute("dissents",dissents);
        return "employee/dissentInfo";
    }

    /**
     * 查看培训记录
     * @param modelMap
     * @param session
     * @return
     */
    @RequestMapping("queryDeptTrain")
    public String queryDeptTrain(ModelMap modelMap,HttpSession session){
        List<Train> trains = trainService.queryAll();
        Employee employee = (Employee) session.getAttribute("employee");
        for(int i=0;i<trains.size();i++){
            Train train = trains.get(i);
            int time = DateUtil.compareDay(train.getStartTime(),new Date(System.currentTimeMillis()));
            if(time<0||train.getdId()!=employee.getdId()){
                trains.remove(i);
            }
        }
        if(trains.size()>0){
            modelMap.addAttribute("trains",trains);
        }
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        return "employee/trainInfo";
    }

}
