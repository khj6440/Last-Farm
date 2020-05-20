package member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendPw {
	public String mailSend(String email) {
		// 1.랜덤코드 생성
		char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};

        StringBuffer sb = new StringBuffer();

        Random rn = new Random();

        for( int i = 0 ; i < 14 ; i++ ){

            sb.append( charaters[ rn.nextInt( 14 ) ] );

        }

		System.out.println(sb.toString());
		// 2. 메일 설정(사용할 메일 서버 설정)
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		// 3. 메일 계정 정보 설정
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("wjdwuq1@gmail.com", "wlduq8992");
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("wjdwuq1@gmail.com", "LastFarm"));
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);

			msg.setSubject("임시비밀번호.", "UTF-8");
			msg.setContent("<h1>라스트 팜</h1><br><h3>인증번호[" + sb.toString() + "]" + "</h3>",
					"text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sb.toString();

	}
}
