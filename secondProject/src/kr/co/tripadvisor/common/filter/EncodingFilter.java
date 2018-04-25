package kr.co.tripadvisor.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	private String charset;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		charset = filterConfig.getInitParameter("charset");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 각 페이지 호출전에 utf-8 인코딩 처리(파라미터)
		request.setCharacterEncoding(charset);
		
		chain.doFilter(request, response);
	}

	
}




