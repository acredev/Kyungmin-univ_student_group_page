package cs;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class CsEmail
{
	public boolean csMailSend (String email, String title, String content)
	{
        String google_id = ".h@gmail.com";
        String google_pwd = "";

        // SMTP 서버 정보
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(google_id, google_pwd);
            }
        });

        try
        {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(google_id));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

            //발신자메일주소
            message.setFrom(new InternetAddress(email));
            
            // 이메일 제목
            message.setSubject(title); //메일 제목을 입력

            // 이메일 내용
            message.setText(content + "\n\n\n ★ 답변받을 메일주소 : " + email);    //메일 내용을 입력

            // 메시지 전송
            Transport.send(message); ////전송
            System.out.println("이메일 발송완료.");
            
            return true;
        }
        catch (AddressException ae)
        {
            ae.printStackTrace();
            System.out.println("이메일 발송오류. 오류메시지 : " + ae);
            
            return false;
        }
        catch (MessagingException me)
        {
            me.printStackTrace();
            System.out.println("이메일 발송오류. 오류메시지 : " + me);
            
            return false;
        }
    }
}