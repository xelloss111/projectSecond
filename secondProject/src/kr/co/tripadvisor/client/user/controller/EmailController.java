package kr.co.tripadvisor.client.user.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/kr/co/tripadvisor/user/emailauth")
public class EmailController extends HttpServlet {

  @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	  
	  
	  String host     = "smtp.naver.com";
	  final String user   = "statandnow";
	  final String password  = "vmfhwprxm";
	  
	  String email = request.getParameter("email");
	  
	  String to     = email;
	  
	  
	  // Get the session object
	  Properties props = new Properties();
	  props.put("mail.smtp.host", host);
	  props.put("mail.smtp.auth", "true");
	  
	  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		  protected PasswordAuthentication getPasswordAuthentication() {
			  return new PasswordAuthentication(user, password);
		  }
	  });
	  
	  // Compose the message
	  try {
		  MimeMessage message = new MimeMessage(session);
		  message.setFrom(new InternetAddress(user));
		  message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		  
		  // Subject
		  message.setSubject("[TripAdvisor] 이메일을 인증해주세요.");
		  
		  AuthNumber auth = new AuthNumber();
		  String authNum = auth.MakeNumber();
//		  request.setAttribute("authNum", authNum);

		  //ajax
		  response.setContentType("application/json; charset=utf-8"); 
		  PrintWriter out = response.getWriter();
		  out.write("{\"authNum\": \"" + authNum + "\"}");
		  out.close();
		  
		  
		  MimeMultipart multipart = new MimeMultipart();
		  
		  MimeBodyPart part = new MimeBodyPart();
		  part.setContent("<img src=\"cid:authmsg\"><br><h1>인증번호 : "+ authNum +"</h1>"
				  
				  ,"text/html; charset=utf-8");
		  multipart.addBodyPart(part);
		  
		  part = new MimeBodyPart();
		  FileDataSource fds = new FileDataSource("C:\\java-lec\\workspace\\mini2_web1\\secondProject\\WebContent/images/authmsg.PNG");
		  part.setDataHandler(new DataHandler(fds));
		  part.setHeader("Content-ID","<authmsg>");
		  part.setFileName("tripadvisor");
		  multipart.addBodyPart(part);
		  
		  message.setContent(multipart);
		  
		  // send the message
		  Transport.send(message);
		  System.out.println("인증 메일 발송에 성공했습니다.");
	
		  
	  } catch (MessagingException e) {
		  e.printStackTrace();
	  }
  }
	}
  
