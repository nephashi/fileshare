package edu.bjtu.fileshare.thread;

import edu.bjtu.fileshare.dao.AuthorizationDao;

import javax.annotation.Resource;

/**
 * Created by Lenovo on 2017/3/8.
 */
public class AuthoriClearThread implements Runnable {

    @Resource(name = "authorizationDao")
    private AuthorizationDao authorizationDao;

    public void run() {
        System.out.println("authorization clear thread running");
        while (true) {
            try {
                Thread.sleep(86400000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            authorizationDao.deleteAllAuthorization();
            System.out.println("clear");
        }
    }

}
