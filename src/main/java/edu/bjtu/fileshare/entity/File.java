package edu.bjtu.fileshare.entity;

import java.util.Date;

public class File {
    private Integer fileId;

    private String fileName;

    private Integer size;

    private Course course;

    private String teacher;

    private String location;

    private String description;

    private Date uploadDate;

    public Integer getFileId() { return fileId; }

    public void setFileId(Integer fileId) { this.fileId = fileId; }

    public String getFileName() { return fileName; }

    public void setFileName(String fileName) { this.fileName = fileName; }

    public Integer getSize() { return size; }

    public void setSize(Integer size) { this.size = size; }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getUploadDate() { return uploadDate; }

    public void setUploadDate(Date uploadDate) { this.uploadDate = uploadDate; }

    public File(Integer fileId, String fileName, Integer size, Course course, String teacher, String location, String description, Date uploadDate) {
        this.fileId = fileId;
        this.fileName = fileName;
        this.size = size;
        this.course = course;
        this.teacher = teacher;
        this.location = location;
        this.description = description;
        this.uploadDate = uploadDate;
    }

    public File() {}
}
