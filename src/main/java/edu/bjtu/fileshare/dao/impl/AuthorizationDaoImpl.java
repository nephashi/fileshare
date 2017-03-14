package edu.bjtu.fileshare.dao.impl;

import edu.bjtu.fileshare.dao.AuthorizationDao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("authorizationDao")
public class AuthorizationDaoImpl implements AuthorizationDao{

    @Autowired
    private SqlSession sqlSession;

    public List<String> getAll() {
        return sqlSession.selectList("Authorization.queryAllAuthorization");
    }

    public boolean check(String address) {
        List<String> lst = sqlSession.selectList("Authorization.queryAuthorizationbyAddress", address);
        return lst.size() == 0 ? false : true;
    }

    public void addAuthorization(String address) {
        sqlSession.insert("Authorization.insertAuthorization", address);
    }

    public void deleteAuthorization(String address) {
        sqlSession.delete("Authorization.deleteAuthorization", address);
    }

    public void deleteAllAuthorization() {
        sqlSession.delete("Authorization.deleteAllAuthorization");
    }
}
