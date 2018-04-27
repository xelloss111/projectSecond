package kr.co.tripadvisor.repository.domain;

public class NoticeImage {
	private Integer imageNo;
    private Integer no;
    private String defaultPath;
    private String detailPath;
    private String oriName;
    private String sysName;
    private long fileSize;
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
	public String getDefaultPath() {
		return defaultPath;
	}
	public void setDefaultPath(String defaultPath) {
		this.defaultPath = defaultPath;
	}
	public String getDetailPath() {
		return detailPath;
	}
	public void setDetailPath(String detailPath) {
		this.detailPath = detailPath;
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
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
    
    
}
