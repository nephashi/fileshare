package edu.bjtu.fileshare.utils;

import edu.bjtu.fileshare.dao.AuthorizationDao;
import edu.bjtu.fileshare.thread.AuthoriClearThread;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.File;

@Component("executor")
public class Executor {

    @Resource(name = "authorizationDao")
    private AuthorizationDao authorizationDao;

    @Resource(name = "propreader")
    private PropertiesReader propReader;

    //这个方法太恶心了，应该重构
    public String execute(String cmd) {
        String[] cmds = cmd.split(" ");
        cmd = cmds[0];
        if(cmd.equals("runclearthread")) {
            Thread clearThread = new Thread(new AuthoriClearThread());
            clearThread.start();
            return "clear thread has started";
        } else if(cmd.equals("clearauthorization")) {
            authorizationDao.deleteAllAuthorization();
            return "authorization has clear";
        } else if(cmd.equals("setdir")){
            if(cmds[1] != null) {
                File dir = new File(cmds[1]);
                if(!dir.exists() || !dir.isDirectory()) {
                    return "directory does not exist";
                }
                if(propReader.setProperty("location", cmds[1]))
                    return "setdir:" + cmds[1];
                else return "setdir failed";
            }
            else return "parameter error";
        } else if(cmd.equals("setpwd")) {
            if(cmds[1] != null) {
                if(propReader.setProperty("password", cmds[1]))
                    return "setpsd:" + cmds[1];
                else return "setpsd failed";
            }
            else return "parameter error";
        } else if(cmd.equals("getpwd")) {
            return propReader.getCorrectPassword();
        } else if(cmd.equals("getdir")) {
            return propReader.getFileLocation();
        } else
            return "unrecognized command";
    }
}
