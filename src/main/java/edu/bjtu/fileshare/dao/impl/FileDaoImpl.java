package edu.bjtu.fileshare.dao.impl;

import edu.bjtu.fileshare.dao.FileDao;
import edu.bjtu.fileshare.entity.File;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("fileDao")
public class FileDaoImpl implements FileDao{

    @Autowired
    private SqlSession sqlSession;

    public List<File> getFilesbyCourseId(Integer id) {
        return sqlSession.selectList("File.queryFilesbyCourseId", id);
    }

    public File getFilebyFileId(Integer id) {
        return sqlSession.selectOne("File.queryFilesbyId", id);
    }

    //File对象封装了Course的全部信息，但该方法不会对Course表操作，只会在File表中记录对应的CourseId。
    //新增Course需要到CourseDao中操作
    public void addFile(File file) {
        sqlSession.insert("File.insertFile", file);
    }

    public void updateFile(File file) {

    }

    public void deleteFile(Integer fileId) {
        sqlSession.delete("File.deleteFile", fileId);
    }
}
