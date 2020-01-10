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
	
	public void Qna_insert(QnaDto qdt) { // qna작성글 db로 넘기기
	
		try {
			dbOpen();
			state = conn.createStatement();
			String h = "insert into qna(qMember,qSecret,qSecretNum,qContents,qTitle) values('"+qdt.getqMember() + "','"  + qdt.getqSecret() + "','" + qdt.getqSecretNum() + "','"+ qdt.getqContents() + "','"+ qdt.getqTitle() + "');";// **자료입력

			int y = state.executeUpdate(h);
		
			if (y > 0) {
			//	JOptionPane.showMessageDialog(null, "회원정보가 추가되었습니다.");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
	}

	public ArrayList<QnaDto> select() { // 전체 출력

	
		
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

//	String check(String userId) { // 아이디중복확인
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

	void idsearch(String name, String callNum) { // 아이디찾기
		try {
			dbOpen();
			state = conn.createStatement();
			String s = "select id from userManagement where name='" + name + "' and callNum='" + callNum + "';";
			ResultSet rs = state.executeQuery(s);
			if (!rs.next()) {
				JOptionPane.showMessageDialog(null, "등록된 회원정보가 없습니다.");
			} else {
				JOptionPane.showMessageDialog(null, "찾으시는 아이디는 [ " + rs.getString("id") + "]입니다.");
			}

		} catch (Exception e) {
		} finally {
			close();
		}
	}

	void pwsearch(String id, String callNum) { // 비밀번호찾기
		try {
			dbOpen();
			state = conn.createStatement();
			String s = "select pass from userManagement where id='" + id + "' and callNum='" + callNum + "';";
			ResultSet rs = state.executeQuery(s);
			if (!rs.next()) {
				JOptionPane.showMessageDialog(null, "등록된 회원정보가 없습니다.");
			} else {
				JOptionPane.showMessageDialog(null, "찾으시는 비밀번호는 [ " + rs.getString("pass") + "]입니다.");
			}
		} catch (Exception e) {
		} finally {
			close();
		}
	}

}
