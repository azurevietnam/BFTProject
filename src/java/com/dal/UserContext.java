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
        String sql = "SELECT * FROM USERS WHERE username=" + username;
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
                u = new User(username, pwd, firstName, lastName, email, facebookID, facebookLink, isAdmin == 1 ? true : false);
            }
        } catch (SQLException ex) {

        }
        return u;
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
        String sql = "UPDATE USERS"
                + "SET password =?"
                + ", first_name=?"
                + ", last_name=?"
                + ", email=?"
                + "WHERE username=?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getUsername());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserContext.class.getName()).log(Level.SEVERE, null, ex);
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
}
