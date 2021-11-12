/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package navirebizerte;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author ASUS
 */
public class DbConnect {
private static String URL = "jdbc:mysql://localhost:3306/navirebizerte?";
private static String USER = "root";
private static String PASSWORD = "";
public static Connection connect(){
Connection con = null;
try{
System.out.println("in");
Class.forName("com.mysql.cj.jdbc.Driver");
System.out.println("Done");
// zeroDateTimeBehavior=CONVERT_TO_NULL
con = DriverManager.getConnection(URL, USER, PASSWORD);
JOptionPane.showMessageDialog(null, "Connection Sucess");
} catch(Exception e){
System.out.println("inter.DbConnect.connect()");
}
return con;
}
public static void main (String args[])
{
Connection Db =new DbConnect().connect();
}
}
