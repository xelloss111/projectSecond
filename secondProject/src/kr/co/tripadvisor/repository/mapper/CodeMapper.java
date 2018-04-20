package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Code;


public interface CodeMapper {
  
   List<Code> selectCodeList(int codeType);
      
}
