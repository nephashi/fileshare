package edu.bjtu.fileshare.controller;

import edu.bjtu.fileshare.dao.AuthorizationDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller("indexController")
@RequestMapping("/index")
public class IndexController {

    @Resource(name = "authorizationDao")
    private AuthorizationDao authorizationDao;

    @RequestMapping("/forward")
    public String forwardView() {
        return "forward";
    }

    @RequestMapping("authorize")
    @ResponseBody
    public String authorize(HttpServletRequest request) {
        try {
            String addr = request.getRemoteAddr();
            authorizationDao.addAuthorization(addr);
        } catch (Exception e) {
            return "fail";
        }
        return "succ";
    }

    @RequestMapping("/test")
    public String testView() {
        authorizationDao.deleteAllAuthorization();
        return "index";
    }

    @RequestMapping("welcome")
    public String indexView(HttpServletRequest request) {
        String addr = request.getRemoteAddr();
        //如果出错就让他访问好了
        if(addr == null) return "index";
        boolean check = authorizationDao.check(addr);
        if(check)
            return "index";
        else
            return "forbidden";
    }


}
