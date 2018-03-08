package edu.bjtu.fileshare.controller;

import edu.bjtu.fileshare.service.DownloadRawFileService;
import edu.bjtu.fileshare.utils.PropertiesReader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.io.IOException;

@Controller
@RequestMapping("/tmpfile")
public class TmpDownloadController {

    @Resource(name = "propreader")
    private PropertiesReader propertiesReader;

    @Resource(name = "rawFileService")
    private DownloadRawFileService downloadRawFileService;

    @RequestMapping("/tmpdownload")
    public ResponseEntity<byte[]> downloadTmpFile() {
        String path = propertiesReader.getProperty("tmpFilePath");
        String fileName = propertiesReader.getProperty("tmpFileName");
        try {
            ResponseEntity<byte[]> resp =  downloadRawFileService.download(path, fileName);
            return resp;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
