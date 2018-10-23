package com.li.handler;

import com.alibaba.fastjson.JSON;
import com.li.entity.*;
import com.li.service.*;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 99234 on 2018/10/18.
 */
@Controller
@RequestMapping("managers2")
public class ManagerHandlerSon extends ManagerHandler {
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private CommitRecordService commitRecordService;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private JobService jobService;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private InvitationService invitationService;
    @Autowired
    private EmployeeService employeeService;

    /**
     * 查看申请记录
     * @param session
     * @return
     */
    @RequestMapping("queryCommit")
    public String commitInfo(HttpSession session){
        List<CommitRecord> commitRecords = commitRecordService.queryCommitRecords();
        List<Employee> employees = employeeService.queryEmployees();
        for(int i=0;i<commitRecords.size();i++){
            CommitRecord commitRecord = commitRecords.get(i);
            if(commitRecord.getiId()!=0){
                commitRecords.remove(i);
            }
            for(int j=0;j<employees.size();j++){
                if(commitRecord.getrId()==employees.get(j).getrId()){
                    commitRecords.remove(i);
                }
            }
        }
        if(commitRecords!=null){
            session.setAttribute("commitRecords",commitRecords);
        }
        List<Job> jobs = jobService.queryJobs();
        session.setAttribute("jobs",jobs);
        return "manager/commitInfo";
    }

    /**
     * 查看指定简历
     * @param rId
     * @param modelMap
     * @return
     */
    @RequestMapping("resumeInfo")
    public String resumeInfo(int rId, ModelMap modelMap){
        Resume resume = resumeService.queryById(rId);
        modelMap.addAttribute("resume",resume);
        return "manager/resumeInfo";
    }

    /**
     * 跳转新增面试邀请界面
     * @param cId
     * @param modelMap
     * @return
     */
    @RequestMapping("addInvitationInput")
    public String addInvitationInput(int cId,ModelMap modelMap){
        modelMap.addAttribute("cId",cId);
        List<Manager> managers = managerService.queryAll();
        modelMap.addAttribute("managers",managers);
        return "manager/addInvitation";
    }

    /**
     * 新增面试邀请
     * @param cId
     * @param inviteTime
     * @param manager
     * @param address
     * @return
     * @throws ParseException
     */
    @RequestMapping("addInvitation")
    public String addInvitation(int cId,String inviteTime,String manager,String address) throws ParseException {
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(inviteTime);
        Invitation invitation = new Invitation(-1,cId,date,manager,address,-1,0);
        invitationService.add(invitation);
        Invitation invitation1 = invitationService.queryByCId(cId);
        CommitRecord commitRecord = commitRecordService.queryByCId(cId);
        commitRecord.setrStatus(true);
        commitRecord.setiId(invitation1.getiId());
        commitRecordService.update(commitRecord);
        return "forward:/managers2/invitationInfo";
    }

    /**
     * 拒绝职位申请
     * @param id
     * @return
     */
    @RequestMapping("commitAjax")
    @ResponseBody
    public String commitAjax(int id){
        System.out.println(id);
        CommitRecord commitRecord = commitRecordService.queryByCId(id);
        commitRecord.setrStatus(true);
        commitRecord.setiId(-1);
        commitRecordService.update(commitRecord);
        return "OK";
    }

    /**
     * 查看面试
     * @param modelMap
     * @return
     */
    @RequestMapping("queryInvitation")
    public String queryInvitation(ModelMap modelMap){
        List<Invitation> invitations = invitationService.queryAll();
        for(int i=0;i<invitations.size();i++){
            if(invitations.get(i).getConfirmed()!=1||invitations.get(i).getPass()!=0){
                invitations.remove(i);
            }
        }
        modelMap.addAttribute("invitations",invitations);
        return "leader/invitationConfirm";
    }

    /**
     * 查看全部面试记录
     * @param modelMap
     * @return
     */
    @RequestMapping("invitationInfo")
    public String invitationInfo(ModelMap modelMap){
        List<Invitation> invitations = invitationService.queryAll();
        modelMap.addAttribute("invitations",invitations);
        return "manager/invitationInfo";
    }

    /**
     * 是否录用
     * @param iId
     * @param flag
     * @return
     */
    @RequestMapping("invitationAjax")
    @ResponseBody
    public String invitationAjax(int iId,String flag){
        Invitation invitation = invitationService.queryByIid(iId);
        if("yes".equals(flag)){
            invitation.setPass(1);
            invitationService.update(invitation);
            return "OK";
        }else {
            invitation.setPass(-1);
            invitationService.update(invitation);
            return "NG";
        }
    }

    /**
     * 进入新增部门/职位页面
     * @param dId
     * @param modelMap
     * @return
     */
    @RequestMapping("addDeptInput")
    public String addDeptInpu(Integer dId,ModelMap modelMap){
        if(dId!=null){
            modelMap.addAttribute("flag","dept");
            return "manager/departmentAdd";
        }
        modelMap.addAttribute("flag","position");
        List<Department> departments = departmentService.queryAll();
        modelMap.addAttribute("departments",departments);
        return "manager/departmentAdd";
    }

    /**
     * 跳转部门/职位更新界面
     * @param dId
     * @param pId
     * @param modelMap
     * @return
     */
    @RequestMapping("updateDeptInput")
    public String updateDepartInput(Integer dId,Integer pId,ModelMap modelMap){
        if(dId!=null){
            Department department = departmentService.queryById2(dId);
            System.out.println(department);
            modelMap.addAttribute("department",department);
            return "manager/departmentUpdate";
        }
        Position position = positionService.queryByPId(pId);
        modelMap.addAttribute("position",position);
        List<Department> departments = departmentService.queryAll();
        modelMap.addAttribute("departments",departments);
        return "manager/departmentUpdate";
    }

    /**
     * 验证部门/职位名字是否存在
     * @param name
     * @param flag
     * @return
     */
    @RequestMapping("deptAjax")
    @ResponseBody
    public String deptAjax(String name,String flag){
        if(name==null||name==""){
            return "null";
        }
        if("dept".equals(flag)){
            Department department = departmentService.queryByName2(name);
            if(department==null){
               return "OK";
            }else {
                return "NG";
            }
        }
        Position position = positionService.queryByName(name);
        if(position!=null){
            return "NG";
        }else {
            return "OK";
        }

    }
    /**
     * 新增部门
     * @param deptName
     * @return
     */
    @RequestMapping("addDepartment")
    public String addDepartment(String deptName){
        Department department = new Department(-1,deptName,new Date());
        departmentService.add(department);
        return "forward:/managers2/departmentInfo";
    }

    /**
     * 新增职位
     * @param pName
     * @param dId
     * @return
     */
    @RequestMapping("addPosition")
    public String addPosition(String pName,int dId){
        Position position = new Position(-1,pName,dId,new Date());
        positionService.add(position);
        return "forward:/managers2/departmentInfo";
    }

    /**
     * 查看部门和职位信息
     * @param modelMap
     * @return
     */
    @RequestMapping("departmentInfo")
    public String departmentInfo(ModelMap modelMap){
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        return "manager/departmentInfo";
    }

    /**
     * 修改职位
     * @param dId
     * @param pId
     * @param pName
     * @return
     */
    @RequestMapping("positionUpdate")
    public String departmentUpdate(int dId,int pId,String pName,ModelMap modelMap){
        Position position1 = positionService.queryByPId(pId);
        Position position = new Position(pId,pName,dId);
        List<Employee> employees = employeeService.querySamePosition(position1.getdId(),pId);
        if(employees==null||employees.size()==0){
            positionService.update(position);
            modelMap.addAttribute("flagP","OK");
            return "forward:/managers2/departmentInfo";
        }
        modelMap.addAttribute("flagP","NG");
        return "forward:/managers2/departmentInfo";
    }

    /**
     * 修改部门
     * @param id
     * @param deptName
     * @return
     */
    @RequestMapping("departmentUpdate")
    public String positionUpdate(int id,String deptName,ModelMap modelMap){
        Department department1 = departmentService.queryById2(id);
        Department department = new Department(id,deptName,department1.getCreateTime());
        List<Position> positions = positionService.queryByDId(id);
        if (positions==null||positions.size()==0) {
            modelMap.addAttribute("flagD","OK");
            departmentService.update(department);
            return "forward:/managers2/departmentInfo";
        }
        modelMap.addAttribute("flagD","NG");
        return "forward:/managers2/departmentInfo";
    }

    /**
     * 删除部门
     * @param dId
     * @return
     */
    @RequestMapping("deptDelete")
    @ResponseBody
    public String deptDelete(int dId){
        List<Position> positions = positionService.queryByDId(dId);
        System.out.println(positions);
        if(positions==null||positions.size()==0){
            departmentService.deleteById(dId);
            return "OK";
        }
        return "NG";

    }

    /**
     * 删除职位
     * @param pId
     * @return
     */
    @RequestMapping("positionDelete")
    @ResponseBody
    public String positionDelete(int pId){
        Position position = positionService.queryByPId(pId);
        List<Employee> employees = employeeService.querySamePosition(position.getdId(),pId);
        if(employees==null||employees.size()==0){
            positionService.deleteById(pId);
            return "OK";
        }
        return "NG";
    }

    @RequestMapping("positionAjax")
    @ResponseBody
    public void positionAjax(PrintWriter printWriter){
        System.out.println("aaa");
        List<Position> positions = positionService.queryAll();
        Object json = JSON.toJSON(positions);
        System.out.println(json);
        printWriter.print(json);
        printWriter.close();
    }

}
