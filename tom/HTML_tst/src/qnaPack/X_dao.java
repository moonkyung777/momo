package qnaPack;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;
public class X_dao {
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
		private final String DB_URL="jdbc:mysql://localhost/greenteam";
		
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

		void signup(userModel user){	//ȸ������
			
			try {
				dbOpen();
				state=conn.createStatement();

				
				String h = "insert into userManagement(id,pass,name,birth,s,callNum) values('"+user.getId()+"','"+user.getPass()+"','"+user.getName()+"','"+user.getBirth()+"','"+user.getS()+"','"+user.getCallNum()+"');";// **�ڷ��Է�
							
				int y=state.executeUpdate(h);
				if(y>0) {
					JOptionPane.showMessageDialog(null, "ȸ�������� �߰��Ǿ����ϴ�.");
				}
			} catch (Exception e) {
			} finally {
				close();
			}
		}

		ArrayList<userModel> selec(String id, String pass) {	//�α���
			
			ArrayList<userModel> list=new ArrayList<userModel>();
			FanelLogin fl=new FanelLogin();
			
			try {
				dbOpen();
				state = conn.createStatement();

				String s = "select * from userManagement where id='" + id + "'  and pass='"+pass+"';";
//				if(id.equals("*")) {
//					s="select * from userManagement;";
//				}
				
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

		String check(String userId) {	//���̵��ߺ�Ȯ��
			
			try {
				
				dbOpen();
				state = conn.createStatement();

					String s = "select * from userManagement where id='" + userId + "';";
					ResultSet rs=state.executeQuery(s);
					if(!rs.next()) {
						count=0;
						okid=userId;
					}else {
						count=1;
					}

			}catch(Exception e) {
				
			}finally {
				close();
			}
			return userId;
		}
		
		void idsearch(String name, String callNum) {	//���̵�ã��
			try {
				dbOpen();
				state = conn.createStatement();
				String s = "select id from userManagement where name='" + name + "' and callNum='"+callNum+"';";
				ResultSet rs=state.executeQuery(s);
				if(!rs.next()) {
					JOptionPane.showMessageDialog(null, "��ϵ� ȸ�������� �����ϴ�.");
				}else {
					JOptionPane.showMessageDialog(null, "ã���ô� ���̵�� [ "+rs.getString("id")+"]�Դϴ�.");
				}
				
			}catch(Exception e) {
			}finally {
				close();
			}
		}
		
		void pwsearch(String id, String callNum) {	//��й�ȣã��
			try {
				dbOpen();
				state = conn.createStatement();
				String s = "select pass from userManagement where id='" + id + "' and callNum='"+callNum+"';";
				ResultSet rs=state.executeQuery(s);
				if(!rs.next()) {
					JOptionPane.showMessageDialog(null, "��ϵ� ȸ�������� �����ϴ�.");
				}else {
					JOptionPane.showMessageDialog(null, "ã���ô� ��й�ȣ�� [ "+rs.getString("pass")+"]�Դϴ�.");
				}
			}catch(Exception e) {	
			}finally {
				close();
			}
		}
	}
}