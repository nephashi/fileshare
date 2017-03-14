package edu.bjtu.fileshare.controller;

import edu.bjtu.fileshare.dao.AuthorizationDao;
import edu.bjtu.fileshare.entity.File;
import edu.bjtu.fileshare.service.CourseService;
import edu.bjtu.fileshare.service.FileService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/getfile")
public class FileController {

    @Resource(name = "authorizationDao")
    private AuthorizationDao authorizationDao;

    @Resource(name = "courseService")
    private CourseService courseService;

    @Resource(name = "fileService")
    private FileService fileService;

    @RequestMapping("")
    public String view(Model model, HttpServletRequest request) {
        String addr = request.getRemoteAddr();
        boolean check;
        //如果出错就让他访问好了
        if(addr == null)
            check = true;
        else
            check = authorizationDao.check(addr);
        if(check) {
            List<String> departments = courseService.getAllDepartmetns();
            model.addAttribute("departments", departments);
            return "findfile";
        } else {
            return "forbidden";
        }
    }

    @RequestMapping("/download/{fileId}")
    public ResponseEntity<byte[]> download(@PathVariable Integer fileId) {
        try {
            ResponseEntity<byte[]> resp =  fileService.download(fileId);
            return resp;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/info/{fileId}")
    public String fileInfo(@PathVariable Integer fileId, Model model) {
        File file = fileService.getFilebyFileId(fileId);
        String realName = getRealFileName(file.getLocation());
        file.setLocation(realName);
        model.addAttribute("file", file);
        return "fileinfo";
    }

    private String getRealFileName(String location) {
        String[] tmp = location.split("/");
        return tmp[tmp.length - 1];
    }

}
