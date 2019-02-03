package com.student.stuman.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {

	private JavaMailSender javaMailSender;

	@Autowired
	public NotificationService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public void sendNotification(String toMail,int userId,String validator) throws MailException, MessagingException {
		
		String content = "<html>" + 
				"<body>" + 
				"    <div class='container-fluid'>" + 
				"        <div class='row'>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'></div>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'>" + 
				"                <h2 style='color:blue' align='center'>Click the button to verify your App</h2>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'></span>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'>" + 
				"                    <center>"
				+ "						<a href='http://stumankce.herokuapp.com/verifyEmail?id="+userId+"&validator="+validator+"'>" + 
				"                        <button style='width:30%;padding:10px;background-color:green;color:white' class='btn btn-success'>Verify</button>" + 
				"                    </a><center>" + 
				"                </span>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'></span>" + 
				"            </div>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'></div>" + 
				"        </div>" + 
				"    </div>" + 
				"</body>" + 
				"</html>";
		
//		SimpleMailMessage mail = new SimpleMailMessage();
//		mail.setTo(toMail);
//		mail.setFrom("aajay0288@gmail.com");
//		mail.setSubject("Hello Creepy");
//		mail.setText(content);
//		javaMailSender.send(mail);
		
		MimeMessage mime = this.javaMailSender.createMimeMessage();
		  MimeMessageHelper helper = new MimeMessageHelper(mime, true);
		  helper.setFrom("aajay0288@gmail.com");
		  helper.setTo(toMail);
		  helper.setSubject("Stuman Welcomes You");
		  helper.setText(content,true);
		  this.javaMailSender.send(mime);
	}
	
	public void sendContactNotification(String name,String email,String comment) throws MailException, MessagingException {
		String content = "<html>\r\n" + 
				"<body>\r\n" + 
				"	<form style='background-color:silver;'>\r\n" + 
				"	<p align='center'>\r\n" + 
				"		<table>\r\n" + 
				"			<tr><td>From : </td><td>"+name+"</td></tr>\r\n" + 
				"			<tr><td>Email : </td><td>"+email+"</td></tr>\r\n" + 
				"			<tr><td>Message : </td><td><textarea rows='5' cols='20' readonly>"+comment+"</textarea></td></tr>\r\n" + 
				"		</table>\r\n" + 
				"	</p>\r\n" + 
				"	</form>\r\n" + 
				"</body>\r\n" + 
				"</html>";
		
//		SimpleMailMessage mail = new SimpleMailMessage();
//		mail.setTo(email);
//		mail.setFrom("aajay0288@gmail.com");
//		mail.setSubject("Hello Creepy");
//		mail.setText(content);
//		javaMailSender.send(mail);
		
			MimeMessage mime = this.javaMailSender.createMimeMessage();
		  MimeMessageHelper helper = new MimeMessageHelper(mime, true);
		  helper.setFrom("aajay0288@gmail.com");
		  helper.setTo(email);
		  helper.setSubject("Stuman Message");
		  helper.setText(content,true);
		  this.javaMailSender.send(mime);
	}
	
	public void sendf(String toMail,String validator) throws MessagingException {

		String content = "<html>" + 
				"<body>" + 
				"    <div class='container-fluid'>" + 
				"        <div class='row'>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'></div>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'>" + 
				"                <h2 style='color:blue' align='center'>Click the button to verify your App</h2>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'></span>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'>" + 
				"                    <center>"
				+ "						<a href='http://stumankce.herokuapp.com/passwordReset?email="+toMail+"&forgetCode="+validator+"'>" + 
				"                        <button style='width:30%;padding:10px;background-color:green;color:white' class='btn btn-success'>Reset password</button>" + 
				"                    </a><center>" + 
				"                </span>" + 
				"                <span class='col-lg-4 col-md-4 col-xs-4 col-sm-4'></span>" + 
				"            </div>" + 
				"            <div class='col-lg-4 col-md-4 col-xs-12 col-sm-12'></div>" + 
				"        </div>" + 
				"    </div>" + 
				"</body>" + 
				"</html>";
		
		MimeMessage mime = this.javaMailSender.createMimeMessage();
	  MimeMessageHelper helper = new MimeMessageHelper(mime, true);
	  helper.setFrom("aajay0288@gmail.com");
	  helper.setTo(toMail);
	  helper.setSubject("Reset Password");
	  helper.setText(content,true);
	  this.javaMailSender.send(mime);
	}
	
	
}
