package edu.bjtu.fileshare.service.impl;

import edu.bjtu.fileshare.dao.CourseDao;
import edu.bjtu.fileshare.dao.FileDao;
import edu.bjtu.fileshare.entity.Course;
import edu.bjtu.fileshare.entity.File;
import edu.bjtu.fileshare.service.FileService;
import edu.bjtu.fileshare.utils.PropertiesReader;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("fileService")
public class FileServiceImpl implements FileService {

    @Resource(name = "fileDao")
    private FileDao fileDao;

    @Resource(name = "courseDao")
    private CourseDao courseDao;

    @Resource(name = "propreader")
    private PropertiesReader propReader;

    public List<File> getAllFiles() {
        return null;
    }

    public File getFilebyFileId(Integer id) {
        return fileDao.getFilebyFileId(id);
    }

    public List<File> getFilesbyCourseId(Integer id) {
        return fileDao.getFilesbyCourseId(id);
    }

    public void addFile(File file) {
        fileDao.addFile(file);
    }

    public void updateFile(File file) {

    }

    public void deleteFile(Integer id) {
        fileDao.deleteFile(id);
    }

    public boolean upload(MultipartFile file, String fileName, String teacher, Integer courseId, String desp) {
        long size = file.getSize();
        size /= 1024.0; //Count as MB
        Date uploadDate = new Date();
        Course course = courseDao.getCoursebyId(courseId);

        String location = propReader.getFileLocation();
        String realFileName = file.getOriginalFilename();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        realFileName += ('-' + df.format(uploadDate));

        boolean discFlag = uploadDiscSave(file, location, realFileName);
        if(discFlag == false) return false;

        File dbFile = new File(0, fileName, new Integer((int)size), course, teacher, location + realFileName, desp, uploadDate);
        fileDao.addFile(dbFile);
        return true;
    }

    //将上传的文件保存到操作系统
    public boolean uploadDiscSave(MultipartFile file, String location, String fileName) {
        java.io.File dir = new java.io.File(location);
        if(!dir.exists()) {
            dir.mkdir();
        }
        java.io.File targetFile = new java.io.File(location, fileName);
        try {
            file.transferTo(targetFile);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ResponseEntity<byte[]> download(Integer fileId) throws IOException{
        File fileObj = getFilebyFileId(fileId);
        String location = fileObj.getLocation();
        java.io.File file = new java.io.File(location);
        HttpHeaders headers = new HttpHeaders();
        String realName = getRealFileName(fileObj.getLocation());
        String fileName = new String(realName.getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

    private String getRealFileName(String location) {
        String[] tmp = location.split("/");
        return tmp[tmp.length - 1];
    }

    public boolean delete(Integer fileId) {
        boolean flag = deleteFromDisc(fileId);
        if (flag == false)
            return false;
        fileDao.deleteFile(fileId);
        return true;
    }

    public boolean deleteFromDisc(Integer fileId) {
        File file = fileDao.getFilebyFileId(fileId);
        String location = file.getLocation();
        java.io.File discFile = new java.io.File(location);
        if (discFile.exists() && discFile.isFile()) {
            discFile.delete();
            return true;
        } else {
            return false;
        }
    }
}
