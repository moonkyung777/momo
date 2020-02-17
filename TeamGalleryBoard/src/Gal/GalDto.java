package Gal;

import java.sql.Date;

public class GalDto {
	
	int galNo;
	String galMember;	
	Date galDate;
	int galCount;
	String galContents;
	String galTitle;
	
	
	public int getgalNo() {
		return galNo;
	}
	public void setgalNo(int galNo) {
		this.galNo = galNo;
	}
	public String getgalMember() {
		return galMember;
	}
	public void setgalMember(String galMember) {
		this.galMember = galMember;
	}
	public Date getgalDate() {
		return galDate;
	}
	public void setgalDate(Date galDate) {
		this.galDate = galDate;
	}
	public int getgalCount() {
		return galCount;
	}
	public void setgalCount(int galCount) {
		this.galCount = galCount;
	}
	public String getgalContents() {
		return galContents;
	}
	public void setgalContents(String galContents) {
		this.galContents = galContents;
	}
	public String getGalTitle() {
		return galTitle;
	}
	public void setgalTitle(String galTitle) {
		this.galTitle = galTitle;
	}
	
	
}
