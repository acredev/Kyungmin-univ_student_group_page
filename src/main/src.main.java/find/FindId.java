package find;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class FindId
{
	public int findmailSend (String email)
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
        
        int chknum = (int)(Math.random() * 100000);

        try
        {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(google_id));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

            // 이메일 제목
            message.setSubject("[경민대학교 대나무숲] 이메일 본인인증 인증번호 입니다."); //메일 제목을 입력

            // 이메일 내용
            message.setText("[경민대학교 대나무숲] 서비스를 이용하기 위한 이메일 인증번호는 다음과 같습니다.\n인증번호 : " + chknum);    //메일 내용을 입력

            // 메시지 전송
            Transport.send(message); ////전송
            System.out.println("이메일 발송완료.");
        }
        catch (AddressException ae)
        {
            ae.printStackTrace();
            System.out.println("이메일 발송오류. 오류메시지 : " + ae);
        }
        catch (MessagingException me)
        {
            me.printStackTrace();
            System.out.println("이메일 발송오류. 오류메시지 : " + me);
        }
        return chknum;
    }
}