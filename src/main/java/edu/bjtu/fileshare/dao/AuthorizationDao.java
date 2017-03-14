package edu.bjtu.fileshare.dao;

import java.util.List;

/**
 * Created by Lenovo on 2017/3/8.
 */
public interface AuthorizationDao {

    public List<String> getAll();

    public boolean check(String address);

    public void addAuthorization(String address);

    public void deleteAuthorization(String address);

    public void deleteAllAuthorization();
}
