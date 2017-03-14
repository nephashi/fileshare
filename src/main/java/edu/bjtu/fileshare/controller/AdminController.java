package edu.bjtu.fileshare.controller;

import edu.bjtu.fileshare.entity.Course;
import edu.bjtu.fileshare.entity.File;
import edu.bjtu.fileshare.service.CourseService;
import edu.bjtu.fileshare.service.FileService;
import edu.bjtu.fileshare.utils.Executor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 几乎所有与后台有关的功能都集中在这个控制器
 */
@Controller
@RequestMapping("/secret/path/admin")
public class AdminController {

    @Resource(name = "fileService")
    private FileService fileService;

    @Resource(name = "courseService")
    private CourseService courseService;

    @Resource(name = "executor")
    private Executor executor;

    @RequestMapping("/overview")
    public String overviewView(Model model, RedirectAttributes attr, HttpSession session) {
        if(session.getAttribute("certified") == null || !((Integer)session.getAttribute("certified")).equals(new Integer(1)))
            return "/index/welcome";
        List<String> dpts = courseService.getAllDepartmetns();
        model.addAttribute("departments", dpts);
        return "admin/overview";
    }

    @RequestMapping("/add")
    public String goAddFile(Model model, HttpSession session) {
        if(session.getAttribute("certified") == null || !((Integer)session.getAttribute("certified")).equals(new Integer(1)))
            return "/index/welcome";
        List<String> dpts = courseService.getAllDepartmetns();
        List<Course> courses = courseService.getAllCourses();
        model.addAttribute("dpts", dpts);
        model.addAttribute("courses", courses);
        return "admin/fileupload";
    }

    @RequestMapping("/delete")
    public @ResponseBody HashMap<String, Object> goDeleteFile(@RequestParam("courseId") Integer courseId, @RequestParam("fileId") Integer fileId, HttpSession session) {
        if(session.getAttribute("certified") == null || !((Integer)session.getAttribute("certified")).equals(new Integer(1)))
            return null;
        HashMap<String, Object> rst = new HashMap<String, Object>();
        boolean status = fileService.delete(fileId);
        if(status == true) {
            rst.put("status", "succ");
        } else {
            rst.put("status", "fail");
        }
        rst.put("files", fileService.getFilesbyCourseId(courseId));
        return rst;
    }

    @RequestMapping("/upload")
    public String upload(@RequestParam(value = "file") MultipartFile file, @RequestParam(value = "fileName") String fileName,
                         @RequestParam(value = "teacher") String teacher, @RequestParam(value = "course") Integer courseId,
                         @RequestParam(value = "description") String desp, RedirectAttributes attr, HttpSession session) {
        if(session.getAttribute("certified") == null || !((Integer)session.getAttribute("certified")).equals(new Integer(1)))
            return "/index/welcome";
        if("".equals(fileName) || file.getSize() < 1.0) {
            attr.addFlashAttribute("upload_status", "param-error");
        }
        boolean status = fileService.upload(file, fileName, teacher, courseId, desp);
        if(status == true) {
            attr.addFlashAttribute("upload_status", "succ");
        } else {
            attr.addFlashAttribute("upload_status", "fail");
        }
        return "redirect:/secret/path/admin/overview";
    }

    @RequestMapping("/courses")
    public String coursesView(@RequestParam(value = "dept-select", required = false) String department, Model model, HttpSession session) {
        if(session.getAttribute("certified") == null || !((Integer)session.getAttribute("certified")).equals(new Integer(1)))
            return "/index/welcome";
        List<String> dpts = courseService.getAllDepartmetns();
        model.addAttribute("dpts", dpts);
        if(!model.containsAttribute("courses")) {
            List<Course> courses;
            if (department != null) {
                courses = courseService.getCoursesbyDepartment(department);
            } else {
                courses = new ArrayList<Course>();
            }
            model.addAttribute("courses", courses);
        }
        return "admin/coursemanage";
    }

    @RequestMapping("/deletecourse/{courseId}")
    public String deleteCourse(@PathVariable Integer courseId, RedirectAttributes attr, HttpSession session) {
        if(session.getAttribute("certified") == null || !((Integer)session.getAttribute("certified")).equals(new Integer(1)))
            return "/index/welcome";
        List<File> files = fileService.getFilesbyCourseId(courseId);
        String dept = courseService.getCoursebyId(courseId).getDepartment();
        if(files.size() == 0) {
            courseService.deleteCourse(courseId);
            attr.addFlashAttribute("delete_status", "succ");
        } else {
            attr.addFlashAttribute("delete_status", "fail-has-file");
        }
        List<Course> courses = courseService.getCoursesbyDepartment(dept);
        attr.addFlashAttribute("courses", courses);//重定向后，该方法设定的参数会出现在Model中
        return "redirect:/secret/path/admin/courses";
    }

    @RequestMapping("/addcourse")
    public String addCourse(@RequestParam("courseName") String courseName, @RequestParam("department") String department, RedirectAttributes attr, HttpSession session) {
        if(session.getAttribute("certified") == null || !((Integer)session.getAttribute("certified")).equals(new Integer(1)))
            return "/index/welcome";
        Course course = new Course(0, courseName, department);
        courseService.addCourse(course);
        List<Course> courses = courseService.getCoursesbyDepartment(department);
        attr.addFlashAttribute("courses", courses);//重定向后，该方法设定的参数会出现在Model中
        return "redirect:/secret/path/admin/courses";
    }

    @RequestMapping("/command")
    public String command(@RequestParam(value = "command", required = false) String command, Model model, HttpSession session) {
        if(session.getAttribute("certified") == null || !((Integer)session.getAttribute("certified")).equals(new Integer(1)))
            return "/index/welcome";
        if(command != null) {
            String resp = executor.execute(command);
            model.addAttribute("resp", resp);
        }
        return "admin/command";

    }
}
