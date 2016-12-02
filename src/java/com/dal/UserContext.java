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
import java.util.List;

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
      String userID = "";
      String countSql = "select * from [USERS] where user_id=?";
      PreparedStatement countPs = getConnection().prepareStatement(countSql);
      while (true) {
         userID = getPrimaryKey();
         countPs.setString(1, userID);
         ResultSet rs = countPs.executeQuery();
         if (!rs.next()) {
            break;
         }
      }
      String sql = "insert into [users] ( [username],"
              + "[password],[first_name],[last_name],[email],[is_admin]) "
              + "values(?,?,?,?,?,?)";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, userID);
      ps.setString(2, user.getUsername());
      ps.setString(3, user.getPassword());
      ps.setString(4, user.getFirstName());
      ps.setString(5, user.getLastName());
      ps.setString(6, user.getEmail());
      ps.setInt(7, user.isAdmin() ? 1 : 0);
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
         user.setUsername(rs.getString(2));
         user.setPassword(rs.getString(3));
         user.setFirstName(rs.getString(4));
         user.setLastName(rs.getString(5));
         user.setEmail(rs.getString(6));
         return user;
      }
      return null;
   }

   public User searchUser(String username) {
      return new User();
   }

   public void removeUser(User user) {

   }

   public void updateUser(User user) {

   }

   public List<User> getAllUser() {
      return null;
   }
}
