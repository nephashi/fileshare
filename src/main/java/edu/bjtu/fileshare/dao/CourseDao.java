package edu.bjtu.fileshare.dao;

import edu.bjtu.fileshare.entity.Course;

import java.util.List;

public interface CourseDao {

    public List<Course> getCoursebyDepartment(String department);

    public List<Course> getAllCourses();

    public List<String> getAllDepartments();

    public Course getCoursebyId(Integer id);

    public void insertCourse(Course course);

    public void deleteCourse(Integer id);
}
