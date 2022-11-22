package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.send_mail;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class SendEmail {
    private static SendEmail instance;
    private SendEmail(){}
    public static SendEmail getInstance(){
        if(instance == null) instance = new SendEmail();
        return instance;
    }

    public String getRandom() {
        int min = 100000;
        int max = 999999;
        return (int) Math.floor(Math.random() * (max - min + 1) + min)+"";
    }

    public boolean sendEmail(String email,String content) {
        String fromEmail = "trasuanuocloc@gmail.com";
        String password = "pyafmlnseddcapfv";
        try {
            // sets SMTP server properties
            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            //SSL
//            prop.setProperty("mail.imap.ssl.enable", "true");
//            prop.put("mail.smtp.socketFactory.port", "465");
//            prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
//            prop.put("mail.smtp.port", "465");
//            prop.put("mail.smtp.auth", "true");
            //TSL
            prop.put("mail.smtp.starttls.required", "true");
            prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.port", "587");
            // creates a new session, no Authenticator (will connect() later)
            Session session = Session.getDefaultInstance(prop);

            //create 1 new email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("Dear The StarBuck");
            message.setSentDate(new Date());
            message.setContent(content,"text/html; charset=utf-8");

            // sends the e-mail
            Transport transport = session.getTransport("smtp");
//            session.setDebug(true);
            transport.connect(fromEmail,password);
            transport.sendMessage(message,message.getAllRecipients());
            transport.close();
           return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

}
