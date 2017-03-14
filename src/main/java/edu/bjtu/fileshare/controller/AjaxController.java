package edu.bjtu.fileshare.controller;

import edu.bjtu.fileshare.entity.Course;
import edu.bjtu.fileshare.entity.File;
import edu.bjtu.fileshare.service.CourseService;
import edu.bjtu.fileshare.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/ajax", method = RequestMethod.GET)
public class AjaxController {

    @Resource(name = "courseService")
    private CourseService courseService;

    @Resource(name = "fileService")
    private FileService fileService;

    @RequestMapping("/course/{department}")
    public @ResponseBody List<Course> getCoursesbyDepartment(@PathVariable String department) {
        List<Course> courses = courseService.getCoursesbyDepartment(department);
        return courses;
    }

    @RequestMapping("/file/{courseId}")
    public @ResponseBody List<File> getFilesbyCourseId(@PathVariable Integer courseId) {
        List<File> files = fileService.getFilesbyCourseId(courseId);
        return files;
    }
}
