package qnaPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class DAO {
	
	int count=1;
	int logcount=1;
	String okid=null;

	private final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	private final String DB_URL="jdbc:mysql://localhost/footsal";
	
	private final String USER_NAME="root";
	private final String PASSWORD="0000";
	
	Connection conn=null;
	Statement state=null;
	
	Scanner sc=new Scanner(System.in);
	
	
	
	DAO(){
		try {
			Class.forName(JDBC_DRIVER);	
		}catch(Exception e){
			
		}
	}
	
	void dbOpen() {
		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		}catch(Exception e) {
			
		}
	}
	
	void close() {
		if(state!=null) {
			try {
				conn.close();
			}catch(Exception e) {
				
			}
		}
		
	}

	void signup(userModel user){	//회원가입
		
		try {
			dbOpen();
			state=conn.createStatement();

			
			String h = "insert into userManagement(id,pass,name,birth,s,callNum) values('"+QnaDto.getId()+"','"+user.getPass()+"','"+user.getName()+"','"+user.getBirth()+"','"+user.getS()+"','"+user.getCallNum()+"');";// **자료입력
						
			int y=state.executeUpdate(h);
			if(y>0) {
				JOptionPane.showMessageDialog(null, "회원정보가 추가되었습니다.");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
	}

	ArrayList<userModel> selec(String id, String pass) {	//로그인
		
		ArrayList<userModel> list=new ArrayList<userModel>();
		FanelLogin fl=new FanelLogin();
		
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from userManagement where id='" + id + "'  and pass='"+pass+"';";
//			if(id.equals("*")) {
//				s="select * from userManagement;";
//			}
			
			ResultSet aa = state.executeQuery(s);

			if (aa.next()) {
				
				userModel m = new userModel();

				m.setId(aa.getString("id"));
				m.setPass(aa.getString("pass"));
				m.setName(aa.getString("name"));
				m.setBirth(aa.getString("birth"));
				m.setS(aa.getString("s"));
				m.setCallNum(aa.getString("callNum"));
				list.add(m);
				logcount=0;

			}else {
				logcount=1;
			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return list;
		
	}

}
