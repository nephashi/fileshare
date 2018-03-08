package edu.bjtu.fileshare.service;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service("rawFileService")
public class DownloadRawFileService {

    public ResponseEntity<byte[]> download(String path, String fileName) throws IOException {
        fileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");     //为了解决中文名称乱码问题
        path = new String(path.getBytes("UTF-8"),"iso-8859-1");     //为了解决中文名称乱码问题
        java.io.File file = new java.io.File(path + fileName);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
}
