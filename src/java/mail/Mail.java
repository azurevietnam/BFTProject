/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mail;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {

   private String d_email = "fairteam.fpt@gmail.com",
           d_password = "fair1234",
           d_host = "smtp.gmail.com",
           d_port = "465",
           m_to = "sontungpytn@gmail.com",
           m_subject = "Change password F-AIR",
           m_text = "<h1>this is just a test mail</h1>"
           + "<p>hello</p>",
           name = "",
           newPassword = "";

   public Mail() {

   }

   public String getD_email() {
      return d_email;
   }

   public void setD_email(String d_email) {
      this.d_email = d_email;
   }

   public String getD_password() {
      return d_password;
   }

   public void setD_password(String d_password) {
      this.d_password = d_password;
   }

   public String getD_host() {
      return d_host;
   }

   public void setD_host(String d_host) {
      this.d_host = d_host;
   }

   public String getD_port() {
      return d_port;
   }

   public void setD_port(String d_port) {
      this.d_port = d_port;
   }

   public String getM_to() {
      return m_to;
   }

   public void setM_to(String m_to) {
      this.m_to = m_to;
   }

   public String getM_subject() {
      return m_subject;
   }

   public void setM_subject(String m_subject) {
      this.m_subject = m_subject;
   }

   public String getM_text() {
      return m_text;
   }

   public void setM_text() {
      this.m_text
              = "<h3>Hi " + name + ",</h3>"
              + "<p>Your recently request to reset your password for your "
              + "F-AIR account. Here is your new password:</p>"
              + "<hr>"
              + "<h4>" + newPassword + "</h4>"
              + "<hr>"
              + "<p>Your can change it later by <b>Change password option</b></p>"
              + "<p>Thank,</p>"
              + "<p><b>F-AIR</b> team</p>"
              + "<p>FPT-university</p>";

   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public void setNewPassword(String newPassword) {
      this.newPassword = newPassword;
   }

   public void send() {
      Properties props = new Properties();
      props.put("mail.smtp.user", d_email);
      props.put("mail.smtp.host", d_host);
      props.put("mail.smtp.port", d_port);
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.auth", "true");
//props.put("mail.smtp.debug", "true");
      props.put("mail.smtp.socketFactory.port", d_port);
      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      props.put("mail.smtp.socketFactory.fallback", "false");

      SecurityManager security = System.getSecurityManager();

      try {
         Authenticator auth = new SMTPAuthenticator();
         Session session = Session.getInstance(props, auth);
//session.setDebug(true);

         MimeMessage msg = new MimeMessage(session);
         msg.setContent(m_text, "text/html");
         msg.setSubject(m_subject);
         msg.setFrom(new InternetAddress(d_email));
         msg.addRecipient(Message.RecipientType.TO, new InternetAddress(m_to));
         Transport.send(msg);
      } catch (Exception mex) {
         mex.printStackTrace();
      }
   }

   private class SMTPAuthenticator extends javax.mail.Authenticator {

      @Override
      public PasswordAuthentication getPasswordAuthentication() {
         return new PasswordAuthentication(d_email, d_password);
      }
   }
   public static void main(String[] args) {
      Mail m=new Mail();
      m.setName("Tung");
      m.setNewPassword("newpass");
      m.setM_text();
      m.send();
   }

   
}
