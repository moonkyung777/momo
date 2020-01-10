package javabean;

import java.util.ArrayList;

public class Tom {
	int a=0;
	ArrayList<StudentBean> st = new ArrayList<StudentBean>();

	
	StudentBean stt = new StudentBean();
	StudentBean stt1 = new StudentBean();
	StudentBean stt2 = new StudentBean();
	StudentBean stt3 = new StudentBean();
	StudentBean stt4 = new StudentBean();
	
	
	String[] id = {"a","b","c","d","e"};
	String[] name = {"aa","bb","cc","dd","ee"};
	String[] snum = {"aaa","bbb","ccc","ddd","eee"};
	int[] year = {1,2,3,4,5};
	String[] pass = {"a1","b1","c1","d1","e1"};
	String[] email = {"a2","b2","c2","d2","e2"};
	
	public ArrayList<StudentBean> tom() {
		
			stt.setId(id[0]);
			stt.setName(name[0]);
			stt.setSnum(snum[0]);
			stt.setYear(year[0]);
			stt.setPass(pass[0]);
			stt.setEmail(email[0]);
			
			
			stt1.setId(id[1]);
			stt1.setName(name[1]);
			stt1.setSnum(snum[1]);
			stt1.setYear(year[1]);
			stt1.setPass(pass[1]);
			stt1.setEmail(email[1]);
			
			stt2.setId(id[2]);
			stt2.setName(name[2]);
			stt2.setSnum(snum[2]);
			stt2.setYear(year[2]);
			stt2.setPass(pass[2]);
			stt2.setEmail(email[2]);
			
			stt3.setId(id[3]);
			stt3.setName(name[3]);
			stt3.setSnum(snum[3]);
			stt3.setYear(year[3]);
			stt3.setPass(pass[3]);
			stt3.setEmail(email[3]);
			
			stt4.setId(id[4]);
			stt4.setName(name[4]);
			stt4.setSnum(snum[4]);
			stt4.setYear(year[4]);
			stt4.setPass(pass[4]);
			stt4.setEmail(email[4]);
			
			st.add(stt);
			st.add(stt1);
			st.add(stt2);
			st.add(stt3);
			st.add(stt4);
			
			return st;
			
	}

}
