/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.Flight;
import com.entities.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SoN-TunG
 */
public class UserContext extends DBContext {

   public UserContext() throws Exception {
   }

   @Override
   protected void finalize() throws Throwable {
      super.close();
   }

   public void addUser(User user) throws Exception {

      String sql = "INSERT into USERS values(?,?,?,?,?,?,?,?)";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, user.getUsername());
      ps.setString(2, user.getPassword());
      ps.setString(3, user.getFirstName());
      ps.setString(4, user.getLastName());
      ps.setString(5, user.getEmail());
      ps.setString(6, user.getFacebookID());
      ps.setString(7, user.getFacebookLink());
      ps.setInt(8, user.isAdmin() ? 1 : 0);
      ps.executeUpdate();
   }

   public User checkUser(String username, String password) throws Exception {
      String sql = "select * from [USERS] where username=? and password=?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, username);
      ps.setString(2, password);
      ResultSet rs = ps.executeQuery();
      if (rs.next()) {
         User user = new User();
         user.setUsername(rs.getString(1));
         user.setPassword(rs.getString(2));
         user.setFirstName(rs.getString(3));
         user.setLastName(rs.getString(4));
         user.setEmail(rs.getString(5));
         user.setAdmin(rs.getInt(8) == 1);
         return user;
      }
      return null;
   }

   public User searchUser(String username) {
      String sql = "SELECT * FROM USERS WHERE username='" + username + "'";
      User u = null;
      try {
         ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
         while (rs.next()) {
            String usr = rs.getString(1);
            String pwd = rs.getString(2);
            String firstName = rs.getString(3);
            String lastName = rs.getString(4);
            String email = rs.getString(5);
            String facebookID = rs.getString(6);
            String facebookLink = rs.getString(7);
            int isAdmin = rs.getInt(8);
            u = new User(usr, pwd, firstName, lastName, email, facebookID, facebookLink, isAdmin == 1 ? true : false);
         }
      } catch (SQLException ex) {

      }
      return u;
   }

   public List<User> searchUserByName(String username) {
      List<User> lstUser = new ArrayList<>();
      String sql = "SELECT * FROM USERS WHERE username = '" + username + "'";
      User u = null;
      try {
         ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
         while (rs.next()) {
            String usr = rs.getString(1);
            String pwd = rs.getString(2);
            String firstName = rs.getString(3);
            String lastName = rs.getString(4);
            String email = rs.getString(5);
            String facebookID = rs.getString(6);
            String facebookLink = rs.getString(7);
            int isAdmin = rs.getInt(8);
            u = new User(usr, pwd, firstName, lastName, email, facebookID, facebookLink, isAdmin == 1 ? true : false);
            lstUser.add(u);
         }
      } catch (SQLException ex) {

      }
      return lstUser;
   }

   public void removeUser(User user) {
      String sql = "DELETE FROM USERS WHERE username = ?";
      try {
         PreparedStatement ps = getConnection().prepareStatement(sql);
         ps.setString(1, user.getUsername());
         ps.executeUpdate();
      } catch (SQLException ex) {
         Logger.getLogger(UserContext.class.getName()).log(Level.SEVERE, null, ex);
      }

   }

   public void updateUser(User user) {

      String sql = "UPDATE USERS SET first_name=?"
              + ", last_name=?"
              + ", [email]=?"
              + ", facebook_id=?"
              + ", facebook_link=? WHERE username=?";
      try {
         PreparedStatement ps = getConnection().prepareStatement(sql);
         ps.setString(1, user.getFirstName());
         ps.setString(2, user.getLastName());
         ps.setString(3, user.getEmail());
         ps.setString(4, user.getFacebookID());
         ps.setString(5, user.getFacebookLink());
         ps.setString(6, user.getUsername());
         ps.executeUpdate();
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   public void changePassword(String username, String newPassword) {
      String sql = "UPDATE USERS SET [password]=? WHERE username=?";
      try {
         PreparedStatement ps = getConnection().prepareStatement(sql);
         ps.setString(1, newPassword);
         ps.setString(2, username);
         ps.executeUpdate();
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   public List<User> getAllUser() {
      List<User> u = new ArrayList<>();
      String sql = "SELECT * FROM USERS";
      try {
         User user = null;
         ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
         while (rs.next()) {
            user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                    rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8) == 1 ? true : false);
            u.add(user);
         }
      } catch (SQLException ex) {
         Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
      }
      return u;
   }

   public User getUserByEmail(String userEmail) throws Exception {
      String sql = "select * from users where email=?";
      User u = null;

      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, userEmail);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         String usr = rs.getString(1);
         String pwd = rs.getString(2);
         String firstName = rs.getString(3);
         String lastName = rs.getString(4);
         String email = rs.getString(5);
         String facebookID = rs.getString(6);
         String facebookLink = rs.getString(7);
         int isAdmin = rs.getInt(8);
         u = new User(usr, pwd, firstName, lastName, email, facebookID, facebookLink, isAdmin == 1 );
      }
      return u;
   }
}
