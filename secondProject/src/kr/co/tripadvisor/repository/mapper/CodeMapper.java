package kr.co.tripadvisor.repository.mapper;

import java.util.List;
import kr.co.tripadvisor.repository.domain.Code;

public interface CodeMapper {
	
	//혜리_갤러리
   List<Code> selectCodeList(int codeType);
   String selectCodeName(String codeNo);
      
}