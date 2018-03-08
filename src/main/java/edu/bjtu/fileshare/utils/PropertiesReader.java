package edu.bjtu.fileshare.utils;

import org.springframework.stereotype.Component;

import java.io.*;
import java.util.Properties;

@Component("propreader")
public class PropertiesReader {

    public String getProperty(String key) {
        InputStream inStream = PropertiesReader.class.getClassLoader().getResourceAsStream("edu/bjtu/fileshare/utils/config/context.properties");
        Properties prop = new Properties();
        try {
            prop.load(inStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return prop.getProperty(key);
    }

    public String getFileLocation() {
        InputStream inStream = PropertiesReader.class.getClassLoader().getResourceAsStream("edu/bjtu/fileshare/utils/config/context.properties");
        Properties prop = new Properties();
        try {
            prop.load(inStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return prop.getProperty("location");
    }

    public String getCorrectPassword() {
        InputStream inStream = PropertiesReader.class.getClassLoader().getResourceAsStream("edu/bjtu/fileshare/utils/config/context.properties");
        Properties prop = new Properties();
        try {
            prop.load(inStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return prop.getProperty("password");
    }

    public boolean setProperty(String key, String value) {
        InputStream inStream = PropertiesReader.class.getClassLoader().getResourceAsStream("edu/bjtu/fileshare/utils/config/context.properties");
        OutputStream fos;
        Properties prop = new Properties();
        try {
            prop.load(inStream);
            fos = new FileOutputStream(PropertiesReader.class.getClassLoader().getResource("edu/bjtu/fileshare/utils/config/context.properties").getPath());
            prop.setProperty(key, value);
            prop.store(fos, null);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        PropertiesReader p = new PropertiesReader();
        System.out.println(p.getFileLocation());
    }
}
