package kr.co.tripadvisor.repository.domain;

public class NoticeImage {
	private Integer imageNo;
    private Integer no;
    private String path;
    private String oriName;
    private String sysName;
    private Integer fileSize;
    
    public Integer getImageNo() {
        return imageNo;
    }
    public void setImageNo(Integer imageNo) {
        this.imageNo = imageNo;
    }
    public Integer getNo() {
        return no;
    }
    public void setNo(Integer no) {
        this.no = no;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public String getOriName() {
        return oriName;
    }
    public void setOriName(String oriName) {
        this.oriName = oriName;
    }
    public String getSysName() {
        return sysName;
    }
    public void setSysName(String sysName) {
        this.sysName = sysName;
    }
    public Integer getFileSize() {
        return fileSize;
    }
    public void setFileSize(Integer fileSize) {
        this.fileSize = fileSize;
    }
}
