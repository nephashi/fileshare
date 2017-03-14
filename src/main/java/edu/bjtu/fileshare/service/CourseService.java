package edu.bjtu.fileshare.service;


import edu.bjtu.fileshare.entity.Course;

import java.util.List;

public interface CourseService {

    public List<String> getAllDepartmetns();

    public List<Course> getAllCourses();

    public List<Course> getCoursesbyDepartment(String department);

    public Course getCoursebyId(Integer courseId);

    public void addCourse(Course course);

    public void updateCourse(Course course);

    public void deleteCourse(Integer id);
}
