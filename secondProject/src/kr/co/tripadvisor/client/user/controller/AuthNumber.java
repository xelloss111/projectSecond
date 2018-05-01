package kr.co.tripadvisor.client.user.controller;

import java.util.Random;

public class AuthNumber {
	
	public String MakeNumber() {
		
		Random r = new Random();
		String result = "";
		
		for(int i=0; i<5; i++) {
			int num = r.nextInt(10);
			result += num;
		}
		return result;

	}

}