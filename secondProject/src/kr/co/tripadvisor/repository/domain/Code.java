package kr.co.tripadvisor.repository.domain;

public class Code {

    private Integer codeNo;

    private String codeName;

    private Integer codeType;

    private String useType;

    public Integer getCodeNo() {
        return codeNo;
    }

    public void setCodeNo(Integer codeNo) {
        this.codeNo = codeNo;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public Integer getCodeType() {
        return codeType;
    }

    public void setCodeType(Integer codeType) {
        this.codeType = codeType;
    }

    public String getUseType() {
        return useType;
    }

    public void setUseType(String useType) {
        this.useType = useType;
    }

    // Code ¸ðµ¨ º¹»ç
    public void CopyData(Code param)
    {
        this.codeNo = param.getCodeNo();
        this.codeName = param.getCodeName();
        this.codeType = param.getCodeType();
        this.useType = param.getUseType();
    }
}