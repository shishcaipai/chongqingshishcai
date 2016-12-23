package com.caijin.I000Wan.util;

import java.io.FileOutputStream;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.caijin.I000Wan.entity.MemberUser;

/**
 * 发送邮件工具类
 * @author pingan
 * @since  2014-07-26
 */

public class EmailUtils {
	private static final String FROM = "jj1000w@126.com";
	private static final String FROM_PASSWORD = "jj1000w123";
	  
    /** 
     * 注册成功后,向用户发送帐户激活链接的邮件 
     * @param user 未激活的用户 
     */  
    public static void sendAccountActivateEmail(MemberUser user) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("感谢您注册jj1000w网-帐号激活邮件");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getUserName()));  
            //message.setContent("<a href='" + GenerateLinkUtils.generateActivateLink(user)+"'>点击激活帐户</a>","text/html;charset=utf-8");  

            String body = "<h1>恭喜您，成功注册jj1000w的用户！</h1> " +  
                    "<a href = 'http://www.jj1000w.com/'> 官方网站:www.jj1000w.com </a><br/>" +   
                    "<a href='" + GenerateLinkUtils.generateActivateLink(user)+"'>点击激活帐户</a><br/>";
                    //"<img src = \"cid:haolloyin_logo_jpg\"></a>";
                     // "<img src= \"cid:email_activate_jpg\">"; 
            
            
            
            /*  
             *  上面的 cid 是指 MIME 协议中的 Content-ID 头，它是  
             *  对于文件资源的唯一标识符，下面的 setContentID()方法  
             *  中传入的 ID 号就必须与这个haolloyin_logo_jpg相一致  
             */ 
              
            /*  
             *  创建一个子类型为 “related” 的 MIME 消息组合对象，  
             *  其实 MimeMultipart 类还有另外两种子类型，请自行  
             *  查阅并比较其中的适用场景  
             */ 
            //MimeMultipart multipart = new MimeMultipart("related");  
              
            /*  
             * 创建一个表示 HTML 正文部分的 MimeBodyPart 对象，   
             * 并加入 到上一语句创建的 MimeMultiPart 对象中，  
             * 由于 HTML 正文中包含中文，故下面应该指定字符集为 gbk 或 gb2312  
             */ 
            /*MimeBodyPart htmlBodyPart = new MimeBodyPart();  
            htmlBodyPart.setContent(body, "text/html;charset=gbk");  
            multipart.addBodyPart(htmlBodyPart);*/  
              
            /*  
             *  创建一个表示图片文件的 MimeBodyPart 对象，  
             *  并加入 到上面所创建的 MimeMultiPart 对象中，  
             *  使用 JAF 框架中的 FileDataSource 类获取图片文件源，  
             *  它能够自动获知文件的 MIME 格式并设置好消息头  
             */ 
            /*MimeBodyPart jpgBodyPart = new MimeBodyPart();  
            FileDataSource fds = new FileDataSource("C:\\Users\\pingan\\Desktop\\email_activate.jpg");  
            jpgBodyPart.setDataHandler(new DataHandler(fds));  
            jpgBodyPart.setContentID("email_activate_jpg");  
              
            multipart.addBodyPart(jpgBodyPart); */ 
              
            /*  
             *  这里不用再设置字符集了，因为上面的 HTML MimeBodyPart 对象中  
             *  已经设置了，而图片文件的因为使用了 DataSource 对象，即 JAF 框架  
             *  中的具体数据处理操作类，能够自动判断获知数据的 MIME 类型  
             */ 
            message.setContent(body,"text/html;charset=utf-8");  
              
            // 保存对邮件的修改并写入文件中  
            message.saveChanges();        
            
            // 发送邮件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
      
    /** 
     * 发送重设密码链接的邮件 
     */  
    public static void sendResetPasswordEmail(MemberUser user) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("找回您的帐户与密码");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getUserName()));  
            message.setContent("要使用新的密码, 请使用以下链接启用密码:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(user) +"'>点击重新设置密码</a>","text/html;charset=utf-8");  
            // 发送邮件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
      
    public static Session getSession() {  
        Properties props = new Properties();  
        props.setProperty("mail.transport.protocol", "smtp");  
        props.setProperty("mail.smtp.host", "smtp.126.com");  
        props.setProperty("mail.smtp.port", "25");  
        props.setProperty("mail.smtp.auth", "true");  
        Session session = Session.getDefaultInstance(props,new Authenticator() {  
            protected PasswordAuthentication getPasswordAuthentication() {  
                return new PasswordAuthentication(FROM, FROM_PASSWORD);  
            }  
        });  
        return session;  
    }
}
