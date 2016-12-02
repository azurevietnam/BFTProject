/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tag;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author SoN-TunG
 */
public class Login extends SimpleTagSupport {

   private String url;
   private String message;

   /**
    * Called by the container to invoke this tag. The implementation of this
    * method is provided by the tag library developer, and handles all tag
    * processing, body iteration, etc.
    */
   @Override
   public void doTag() throws JspException {
      JspWriter out = getJspContext().getOut();

      try {
         // TODO: insert code to write html before writing the body content.
         // e.g.:
         //
         // out.println("<strong>" + attribute_1 + "</strong>");
         // out.println("    <blockquote>");

         JspFragment f = getJspBody();
         if (f != null) {
            f.invoke(out);
         }
         //get session object from jsp
         PageContext pc = (PageContext) getJspContext();
         HttpSession session = pc.getSession();
         //user has logined ---> found session "login" 
         if (session.getAttribute("login") == null) {
            //init login error
            session.setAttribute("loginError", message);
            HttpServletResponse response = (HttpServletResponse) pc.getResponse();
            response.sendRedirect(url);
         }

         // TODO: insert code to write html after writing the body content.
         // e.g.:
         //
         // out.println("    </blockquote>");
      } catch (java.io.IOException ex) {
         throw new JspException("Error in Login tag", ex);
      }
   }

   public void setUrl(String url) {
      this.url = url;
   }

   public void setMessage(String message) {
      this.message = message;
   }

}
