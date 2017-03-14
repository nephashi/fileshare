package edu.bjtu.fileshare.dao.impl;

import edu.bjtu.fileshare.dao.CourseDao;
import edu.bjtu.fileshare.entity.Course;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("courseDao")
public class CourseDaoImpl implements CourseDao{

    @Autowired
    private SqlSession sqlSession;

    public List<Course> getCoursebyDepartment(String department) {
        return sqlSession.selectList("Course.queryCoursesbyDepartment", department);
    }

    public List<Course> getAllCourses() {
        return sqlSession.selectList("Course.queryAllCourses");
    }

    public Course getCoursebyId(Integer id) {
        return sqlSession.selectOne("queryCoursesbyId", id);
    }

    public List<String> getAllDepartments() {
        return sqlSession.selectList("Department.queryAllDepartments");
    }

    public void insertCourse(Course course) {
        sqlSession.insert("Course.insertCourse", course);
    }

    public void deleteCourse(Integer id) {
        sqlSession.delete("Course.deleteCourse", id);
    }

    public static void main(String[] args) {
        System.out.println();
    }
}
