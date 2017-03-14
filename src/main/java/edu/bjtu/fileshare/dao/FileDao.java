package edu.bjtu.fileshare.dao;

import edu.bjtu.fileshare.entity.File;

import java.util.List;

public interface FileDao {

    public List<File> getFilesbyCourseId(Integer id);

    public File getFilebyFileId(Integer id);

    public void addFile(File file);

    public void updateFile(File file);

    public void deleteFile(Integer fileId);
}
