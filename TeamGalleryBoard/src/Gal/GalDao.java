package Gal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class GalDao {
	
	int count=1;
	int logcount=1;
	String okid=null;

	private final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	private final String DB_URL="jdbc:mysql://localhost/footsal?useSSL=false&useUnicode=true&characterEncoding=utf8";
	
	private final String USER_NAME="root";
	private final String PASSWORD="0000";
	
	Connection conn=null;
	Statement state=null;
	
	Scanner sc=new Scanner(System.in);
	
	
	
	public GalDao(){
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


	
	public ArrayList<GalDto> selectAll() {	//로그인
		ArrayList<GalDto> list = new ArrayList<GalDto>();
		try {
			dbOpen();
			
			state = conn.createStatement();
			

			String s = "select * from gal;";

			
			ResultSet aa = state.executeQuery(s);
			
			while (aa.next()) {
				
				GalDto m = new GalDto();
				
				m.setgalNo(aa.getInt("galNo"));
				
				m.setgalMember(aa.getString("galMember"));
				m.setgalDate(aa.getDate("galDate"));
				m.setgalCount(aa.getInt("galCount"));
				m.setgalContents(aa.getString("galContents"));
				m.setgalTitle(aa.getString("galTitle"));
				
				list.add(m);
				

			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return list;
	}
	
	public GalDto selectone(int galNo) {	//로그인
		GalDto m = new GalDto();
		try {
			dbOpen();
			state = conn.createStatement();

			String s = "select * from gal where galNo = "+galNo+";";
			String s2 = "update gal set galCount = galCount + 1 where galNo ="+galNo+";";
			state.executeUpdate(s2);

			
			ResultSet aa = state.executeQuery(s);
			
			if (aa.next()) {
				
				

				m.setgalNo(aa.getInt("galNo"));
				m.setgalMember(aa.getString("galMember"));
				m.setgalDate(aa.getDate("galDate"));
				m.setgalCount(aa.getInt("galCount"));
				m.setgalContents(aa.getString("galContents"));
				m.setgalTitle(aa.getString("galTitle"));
			
				
				
				

			}

		} catch (Exception e) {
		} finally {
			close();
		}
		return m;
	}
	


}
