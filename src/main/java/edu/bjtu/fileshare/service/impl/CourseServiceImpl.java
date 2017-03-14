package edu.bjtu.fileshare.service.impl;

import edu.bjtu.fileshare.dao.CourseDao;
import edu.bjtu.fileshare.entity.Course;
import edu.bjtu.fileshare.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService{

    @Resource(name="courseDao")
    private CourseDao courseDao;

    public List<Course> getAllCourses() {
        return courseDao.getAllCourses();
    }

    public List<Course> getCoursesbyDepartment(String department) {
        return courseDao.getCoursebyDepartment(department);
    }

    public List<String> getAllDepartmetns() {
        return courseDao.getAllDepartments();
    }

    public Course getCoursebyId(Integer courseId) {
        return courseDao.getCoursebyId(courseId);
    }

    public void addCourse(Course course) {
        courseDao.insertCourse(course);
    }

    public void updateCourse(Course course) {

    }

    public void deleteCourse(Integer id) {
        courseDao.deleteCourse(id);
    }
}
