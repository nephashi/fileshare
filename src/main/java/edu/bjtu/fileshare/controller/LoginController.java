package edu.bjtu.fileshare.controller;

import edu.bjtu.fileshare.utils.PropertiesReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @RequestMapping("/check")
    public String login(@RequestParam("password") String password, HttpSession session) {
        PropertiesReader propReader = new PropertiesReader();
        String corrPassword = propReader.getCorrectPassword();
        if(password != null && password.equals(corrPassword)) {
            session.setAttribute("certified", 1);
            return "redirect:/secret/path/admin/overview";
        } else {
            return "redirect:/index/welcome";
        }
    }

    @RequestMapping("")
    public String loginView() {
        return "/admin/login";
    }
}
