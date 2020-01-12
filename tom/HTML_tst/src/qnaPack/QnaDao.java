package qnaPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class QnaDao {
	int count = 1;
	int logcount = 1;
	String okid = null;
	



	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://localhost/footsal";

	private final String USER_NAME = "root";
	private final String PASSWORD = "0000";

	Connection conn = null;
	Statement state = null;

	Scanner sc = new Scanner(System.in);
	ArrayList<QnaDto> list = new ArrayList<QnaDto>();
	public QnaDao(){
		try {
			Class.forName(JDBC_DRIVER);	
		}catch(Exception e){
			
		}
	}

	void dbOpen() {
		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		} catch (Exception e) {

		}
	}

	void close() {
		if (state != null) {
			try {
				conn.close();
			} catch (Exception e) {

			}
		}

	}
//ArrayList<QnaDto> qdt
	
	public void Qna_insert(QnaDto qdt) { // qna�ۼ��� db�� �ѱ��
	
		try {
			dbOpen();
			state = conn.createStatement();
			String h = "insert into qna(qMember,qSecret,qSecretNum,qContents,qTitle) values('"+qdt.getqMember() + "','"  + qdt.getqSecret() + "','" + qdt.getqSecretNum() + "','"+ qdt.getqContents() + "','"+ qdt.getqTitle() + "');";// **�ڷ��Է�

			int y = state.executeUpdate(h);
		
			if (y > 0) {
			//	JOptionPane.showMessageDialog(null, "ȸ�������� �߰��Ǿ����ϴ�.");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
	}

	public ArrayList<QnaDto> select() { // ��ü ���

	
		
		//ArrayList<QnaDto> list = new ArrayList<QnaDto>();
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from qna;";
//			if(id.equals("*")) {
//				s="select * from userManagement;";
//			}

			ResultSet aa = state.executeQuery(s);

			while (aa.next()) {

				QnaDto m = new QnaDto();
				
				m.setqNo(aa.getInt("qNo"));
				m.setqMember(aa.getString("qMember"));
				m.setqSecret(aa.getString("qSecret"));
				m.setqSecretNum(aa.getString("qSecretNum"));
				m.setqContents(aa.getString ("qContents"));
				m.setqDate(aa.getTimestamp ("qDate"));
				m.setqTitle(aa.getString ("qTitle"));
				list.add(m); 
				//logcount = 0;

			} 

		} catch (Exception e) {
		} finally {
			close();
		}
		return list;

	}

//	String check(String userId) { // ���̵��ߺ�Ȯ��
//
//		try {
//
//			dbOpen();
//			state = conn.createStatement();
//
//			String s = "select * from userManagement where id='" + userId + "';";
//			ResultSet rs = state.executeQuery(s);
//			if (!rs.next()) {
//				count = 0;
//				okid = userId;
//			} else {
//				count = 1;
//			}
//
//		} catch (Exception e) {
//
//		} finally {
//			close();
//		}
//		return userId;
//	}

	void idsearch(String name, String callNum) { // ���̵�ã��
		try {
			dbOpen();
			state = conn.createStatement();
			String s = "select id from userManagement where name='" + name + "' and callNum='" + callNum + "';";
			ResultSet rs = state.executeQuery(s);
			if (!rs.next()) {
				JOptionPane.showMessageDialog(null, "��ϵ� ȸ�������� �����ϴ�.");
			} else {
				JOptionPane.showMessageDialog(null, "ã���ô� ���̵�� [ " + rs.getString("id") + "]�Դϴ�.");
			}

		} catch (Exception e) {
		} finally {
			close();
		}
	}

	void pwsearch(String id, String callNum) { // ��й�ȣã��
		try {
			dbOpen();
			state = conn.createStatement();
			String s = "select pass from userManagement where id='" + id + "' and callNum='" + callNum + "';";
			ResultSet rs = state.executeQuery(s);
			if (!rs.next()) {
				JOptionPane.showMessageDialog(null, "��ϵ� ȸ�������� �����ϴ�.");
			} else {
				JOptionPane.showMessageDialog(null, "ã���ô� ��й�ȣ�� [ " + rs.getString("pass") + "]�Դϴ�.");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
	}

}