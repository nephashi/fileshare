package edu.bjtu.fileshare.service;

import edu.bjtu.fileshare.entity.File;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface FileService {
    public List<File> getAllFiles();

    public File getFilebyFileId(Integer id);

    public List<File> getFilesbyCourseId(Integer id);

    public boolean upload(MultipartFile file, String fileName, String teacher, Integer courseId, String desp);

    //从数据库删除和从文件系统脱离等操作
    public boolean delete(Integer courseId);

    public void addFile(File file);

    public void updateFile(File file);

    //只是从数据库删除
    public void deleteFile(Integer id);

    public ResponseEntity<byte[]> download(Integer fileId) throws IOException;
}
