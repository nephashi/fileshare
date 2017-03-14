package edu.bjtu.fileshare.service;

import java.util.List;

public interface AuthorizationService {

    public List<String> getAll();

    public boolean check(String address);

    public void addAuthorization(String address);

    public void deleteAuthorization(String address);

    public void deleteAllAuthorization();
}
