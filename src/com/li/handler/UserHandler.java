package com.li.handler;

import com.alibaba.fastjson.JSON;
import com.li.entity.*;
import com.li.service.*;
import com.li.utils.DateUtil;
import com.li.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 99234 on 2018/10/11.
 */
@Controller
@RequestMapping("user")
public class UserHandler {
    @Autowired
    @Qualifier("userService")
    private UserService userService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private JobService jobService;
    @Autowired
    private CommitRecordService commitRecordService;
    @Autowired
    private InvitationService invitationService;

    /**
     * 招聘信息界面
     * @param modelMap
     * @return
     */
    @RequestMapping("jobs")
    public String queryJob(ModelMap modelMap){
        List<Job> jobs = jobService.queryJobs();
        modelMap.addAttribute("jobs",jobs);
        return "user/jobs";
    }

    /**
     * 详细招聘信息查询
     * @param modelMap
     * @return
     */
    @RequestMapping("jobInfo")
    public String jobDetail(int id,ModelMap modelMap){
        Job job = jobService.queryByJId(id);
        modelMap.addAttribute("job",job);
        return "user/jobInfo";
    }

    /**
     * 查看游客详细信息
     * @return
     */
    @RequestMapping("userInfo")
    public String userInfo(){
        return "user/userInfo";
    }
    /**
     * 转入游客登陆界面
     * @return
     */
    @RequestMapping("loginInput")
    public String loginInput(){
        return "user/login";
    }

    /**
     * 转入游客注册界面
     * @return
     */
    @RequestMapping("registInput")
    public String registInput(){
        return "user/regist";
    }

    /**
     * 返回开始界面
     * @return
     */
    @RequestMapping("begin")
    public String begin(){
        return "redirect:/begin.jsp";
    }

    /**
     * 部门联动
     * @param dId
     * @param pw
     */
    @RequestMapping("deptAjax")
    @ResponseBody
    public void deptAjax(int dId,PrintWriter pw){
        List<Position> positions = departmentService.queryById(dId).getPositions();
        Object json = JSON.toJSON(positions);
        pw.print(json);
    }
    /**
     * 登陆提交验证
     * @param name
     * @param password
     * @param modelMap
     * @return
     */
    @RequestMapping("login")
    public String login(String name, String password, HttpSession session,ModelMap modelMap){
        password = Md5Util.md5(password);
        User user = userService.queryByNameAndPassword(name,password);
        if(user==null){
            User user1 = new User(-1,name,password);
            modelMap.addAttribute("userL1",user1);
            return "user/login";
        }
        session.removeAttribute("userL");
        session.removeAttribute("resume");
        session.removeAttribute("commitRecords");
        session.setAttribute("userL",user);
        List<Department> departments = departmentService.queryDepartments();
        session.setAttribute("departments",departments);
        List<String> educations = new ArrayList<>();
        educations.add("高中及以下");
        educations.add("大专");
        educations.add("本科");
        educations.add("硕士");
        educations.add("博士及以上");
        session.setAttribute("educations",educations);
        List<Job> jobs = jobService.queryJobs();
        session.setAttribute("jobs",jobs);
        Resume resume = resumeService.queryByUserId(user.getId());
        if(resume!=null){
            session.setAttribute("resume",resume);
            List<CommitRecord> commitRecords = commitRecordService.queryByRId(resume.getrId());
            if(commitRecords!=null&&commitRecords.size()>0){

                session.setAttribute("commitRecords",commitRecords);
            }
        }
        return "forward:/user/jobs";
    }

    /**
     * 注册提交验证
     * @param name
     * @param password
     * @param
     * @return
     */
    @RequestMapping("regist")
    public String regist(String name,String password,ModelMap modelMap){
        User userR = new User(-1,name,password);
        modelMap.addAttribute("userR",userR);
        String password1 = Md5Util.md5(password);
        User user = new User(-1,name,password1);
        userService.addUser(user);
        return "user/login";
    }

    /**
     * 账号内容验证
     * @param name
     * @return
     */
    @RequestMapping("ajaxName")
    @ResponseBody
    public String ajaxName(String name){
        if(name==""||name==null){
            return "null";
        }
        User user = userService.queryByName(name);
        if(user!=null){
            return "NG";
        }else {
            return "OK";
        }
    }

    /**
     * 跳转填写/修改简历页面
     * @param rId
     * @param modelMap
     * @return
     */
    @RequestMapping("resumeInput")
    public String addInput(Integer rId,ModelMap modelMap){
        if(rId!=null&&rId>0){
            Resume resume = resumeService.queryById(rId);
            modelMap.addAttribute("resume",resume);
            return "user/updateResume";
        }else {}
        return "user/addResume";
    }

    /**
     * 创建简历
     * @return
     */
    @RequestMapping("addResume")
    public String addResume(String rTitle,String uName,String uGender,String uBirth1,String firstWorkTime1,String tel,
                            String email, int deptId,Integer position,double expectSalary,String education,String workExperience,
                            String hobbies,HttpSession session){
        java.sql.Date uBirth = java.sql.Date.valueOf(uBirth1);
        java.sql.Date firstWorkTime = java.sql.Date.valueOf(firstWorkTime1);
        User user = (User) session.getAttribute("userL");
        Department department = departmentService.queryById(deptId);
        List<Position> positions = department.getPositions();
        Position position1 = new Position();
        for(Position position2:positions){
            if(position==position2.getpId()){
                position1=position2;
                break;
            }
        }
        department = new Department(department.getId(),department.getName());
        Resume resume = new Resume(-1,user,rTitle,uName,uBirth,uGender,firstWorkTime,tel,email,department,position1,
                workExperience,education,expectSalary,hobbies);
        resumeService.addResume(resume);
        resume = resumeService.queryByUserId(user.getId());
        session.setAttribute("resume",resume);
        return "user/userInfo";
    }

    /**
     * 修改简历
     * @return
     */
    @RequestMapping("updateResume")
    public String updateResume(String rTitle,String uName,String uGender,String uBirth1,String firstWorkTime1,String tel,
                               String email, int deptId,Integer position,double expectSalary,String education,String workExperience,
                               String hobbies,HttpSession session){
        Resume resume = (Resume) session.getAttribute("resume");
        java.sql.Date uBirth = java.sql.Date.valueOf(uBirth1);
        java.sql.Date firstWorkTime = java.sql.Date.valueOf(firstWorkTime1);
        User user = (User) session.getAttribute("userL");
        Department department = departmentService.queryById(deptId);
        List<Position> positions = department.getPositions();
        Position position1 = new Position();
        for(Position position2:positions){
            if(position==position2.getpId()){
                position1=position2;
                break;
            }
        }
        department = new Department(department.getId(),department.getName());
        resume = new Resume(resume.getrId(),user,rTitle,uName,uBirth,uGender,firstWorkTime,tel,email,department,position1,
                workExperience,education,expectSalary,hobbies);
        resumeService.updateResume(resume);
        session.removeAttribute("resume");
        session.setAttribute("resume",resume);
        return "user/userInfo";
    }

    /**
     * 职位申请确认验证
     * @param jId
     * @param rId
     * @param session
     * @return
     */
    @RequestMapping("commit")
    @ResponseBody
    public String commit(int jId,int rId,HttpSession session){
        CommitRecord commitRecord = commitRecordService.queryByRIdAndJId(rId,jId);
        if(commitRecord!=null){
            return "NG";
        }
        Date date = new Date();
        CommitRecord commitRecord1 = new CommitRecord(-1,jId,rId,date,false,0);
        commitRecordService.add(commitRecord1);
        List<CommitRecord> commitRecords = commitRecordService.queryByRId(rId);
        session.removeAttribute("commitRecords");
        session.setAttribute("commitRecords",commitRecords);
        return "OK";
    }

    /**
     * 面试邀请确认
     * @param iId
     * @param flag
     * @return
     */
    @RequestMapping("invitationAjax")
    @ResponseBody
    public String invitationAjax(int iId,String flag){
        if("yes".equals(flag)){
            Invitation invitation = invitationService.queryByIid(iId);
            Date date = new Date();
            int time = DateUtil.compareDate(date,invitation.getInviteTime());
            if(time>=0){
                invitation.setConfirmed(true);
                return "OK";
            }else {return "NG";}
        }else {
            return "NG";
        }

    }

}
