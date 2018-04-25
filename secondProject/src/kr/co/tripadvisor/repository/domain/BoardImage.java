package kr.co.tripadvisor.repository.domain;

public class BoardImage {
	private Integer imageNo;
    private Integer boardNo;
    private String path;
    private String oriName;
    private String sysName;
    private long fileSize;

    public Integer getImageNo() {
        return imageNo;
    }
    public void setImageNo(Integer imageNo) {
        this.imageNo = imageNo;
    }
    public Integer getBoardNo() {
        return boardNo;
    }
    public void setBoardNo(Integer boardNo) {
        this.boardNo = boardNo;
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
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

}
