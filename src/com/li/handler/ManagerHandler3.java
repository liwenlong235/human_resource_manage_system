package com.li.handler;

import com.li.entity.*;
import com.li.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
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
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private DissentService dissentService;

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
        if(month!=null&&(month<=0||month>12)){
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

    /**
     * 跳转新增培训界面
     * @return
     */
    @RequestMapping("addTrainInput")
    public String addTrainInput(ModelMap modelMap){
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        return "manager/addTrain";
    }

    /**
     * 新增培训信息
     * @param title
     * @param time
     * @param dId
     * @param pId
     * @param modelMap
     * @return
     */
    @RequestMapping("addTrain")
    public String addTrain(String title,String time,int dId,int pId,ModelMap modelMap){
        Date date = Date.valueOf(time);
        Train train = new Train(-1,title,dId,pId,date);
        trainService.add(train);
        modelMap.addAttribute("addTrain","OK");
        return "manager/manage";
    }

    /**
     * 跳转修改培训界面
     * @param tId
     * @param modelMap
     * @return
     */
    @RequestMapping("updateTrainInput")
    public String addTrainInput(int tId,ModelMap modelMap){
        Train train = trainService.queryById(tId);
        modelMap.addAttribute("train",train);
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        return "manager/trainUpdate";
    }

    /**
     * 修改培训信息
     * @param tId
     * @param title
     * @param time
     * @param dId
     * @param pId
     * @param modelMap
     * @return
     */
    @RequestMapping("updateTrain")
    public String updateTrain(Integer tId,String title,String time,int dId,int pId,ModelMap modelMap){
        Date date = Date.valueOf(time);
        Train train = new Train(tId,title,dId,pId,date);
        trainService.update(train);
        modelMap.addAttribute("updateTrain","OK");
        return "manager/manage";
    }

    /**
     * 查看培训信息
     * @param modelMap
     * @return
     */
    @RequestMapping("trainInfo")
    public String trainInfo(ModelMap modelMap){
        List<Train> trains = trainService.queryAll();
        modelMap.addAttribute("trains",trains);
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        return "manager/trainInfo";
    }

    /**
     * 删除培训信息
     * @param tId
     * @return
     */
    @RequestMapping("deleteTrain")
    @ResponseBody
    public String deleteTrain(int tId){
        System.out.println(tId);
        trainService.deleteById(tId);
        return "OK";
    }

    /**
     * 发放工资
     * @param modelMap
     * @return
     */
    @RequestMapping("addSalary")
    public String addSalary(ModelMap modelMap){
        Calendar calendar = Calendar.getInstance();
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        if(day!=5){
            modelMap.addAttribute("salaryTime","NG");
            return "manager/manage";
        }
        List<Salary> salaries = salaryService.queryByMonth(month);
        if(salaries!=null&&salaries.size()>0){
            modelMap.addAttribute("doubleSalary","NG");
            return "manager/manage";
        }
        List<Award> awards = awardService.queryAll();
        List<Attendance> attendances = attendanceService.queryByMonth(month);
        List<Employee> employees = employeeService.queryEmployees();
        for(int i=0;i<employees.size();i++){
            Employee employee = employees.get(i);
            List<Attendance> attendances1 = new ArrayList<>();
            double lateTime = 0;
            double absenteeism = 0;
            for(int j=0;j<attendances.size();j++){
                Attendance attendance = attendances.get(j);
                if(attendance.geteId()==employee.geteId()){
                    attendances1.add(attendance);
                    lateTime = lateTime + attendance.getLateTime();
                    absenteeism = absenteeism + attendance.getAbsenteeism();
                    if(attendance.getNight()==null){
                        absenteeism += 1;
                    }
                }
            }
            double money = 0;
            for(int j=0;j<awards.size();j++){
                Award award = awards.get(j);
                if(award.geteId()==employee.geteId()){
                    Calendar calendar1 = Calendar.getInstance();
                    calendar1.setTime(award.getCreateTime());
                    if(month==(calendar1.get(Calendar.MONTH)+1)){
                        money += award.getMoney();
                    }
                }
            }
            double basic = 3000;
            double deduct = (basic/22)*(22-attendances1.size()+absenteeism) + (basic/(22*8))*lateTime;
            double backPay = 0;
            double real = basic + money - deduct;
            if(real<0){
                real=0;
            }
            Salary salary1 = salaryService.queryByEidAndMonth(employee.geteId(),month-1);
            if(salary1!=null&&!salary1.getRemarks().equals(null)){
                salary1 = salaryService.queryByEidAndMonth(employee.geteId(),month);
                salary1 = new Salary(salary1.getsId(),month,employee.geteId(),employee.geteName(),basic,money,deduct,salary1.getBackPay(),real,null);
            }
            Salary salary = new Salary(-1,month,employee.geteId(),employee.geteName(),basic,money,deduct,backPay,real,null);
            salaryService.addSalary(salary);
        }
        modelMap.addAttribute("salary","OK");
        return "manager/manage";
    }

    /**
     * 查看工资
     * @return
     */
    @RequestMapping("querySalary")
    public String querySalary(ModelMap modelMap){
        List<Salary> salaries = salaryService.querySalaries();
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
        return "manager/salaryInfo";
    }

    /**
     * 工资复议答复
     * @param dId
     * @param str
     * @param flag
     * @return
     */
    @RequestMapping("updateDissent")
    @ResponseBody
    public String updateDissent(int dId,String str,Integer flag){
        Dissent dissent = dissentService.queryByDId(dId);
        if(dissent!=null&&dissent.getAgree()!=0){
            return "NG";
        }
        if(flag!=null&&flag==-1){
            dissent.setAgree(-1);
            dissentService.update(dissent);
            return "OK";
        }
        dissent.setAgree(1);
        dissentService.update(dissent);
        Integer backPay = Integer.valueOf(str);
        System.out.println(backPay);
        Salary salary = salaryService.queryBySid(dissent.getsId());
        Salary salary1 = new Salary(-1,salary.getsMonth()+1,salary.geteId(),salary.geteName(),0,0,0,backPay,0,"上月不补发工资");
        salaryService.addSalary(salary1);
        return "OK";
    }

    /**
     * 查看复议记录
     * @param modelMap
     * @return
     */
    @RequestMapping("queryDissent")
    public String queryDissent(ModelMap modelMap){
        List<Dissent> dissents = dissentService.queryNeedAll(0);
        modelMap.addAttribute("dissents",dissents);
        return "manager/dissentInfo";
    }
}
