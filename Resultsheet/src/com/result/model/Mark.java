package com.result.model;

public class Mark {
	
	private int id;
	private String s_roll;
	private String s_reg;
	private String s_name;
	private String s_fmid;
	private String s_smid;
	private String s_ct;
	private String s_att;
	private String s_sem;
	private String s_ccode;
	private String s_password;
	public boolean valid;
	
	public Mark(int id, String s_roll, String s_reg, String s_name,
			String s_fmid, String s_smid, String s_ct,
			String s_att, String s_sem, String s_ccode, String s_password) {
		super();
		this.id = id;
		this.s_roll = s_roll;
		this.s_reg = s_reg;
		this.s_name = s_name;
		this.s_fmid = s_fmid;
		this.s_smid = s_smid;
		this.s_ct = s_ct;
		this.s_att = s_att;
		this.s_sem = s_sem;
		this.s_ccode = s_ccode;
		this.s_password = s_password;
	}
	
	public Mark(String s_roll, String s_reg, String s_name, String s_fmid,
			String s_smid, String s_ct,String s_att, String s_password, String s_sem, String s_ccode) {
		
		this.s_roll = s_roll;
		this.s_reg = s_reg;
		this.s_name = s_name;
		this.s_fmid = s_fmid;
		this.s_smid = s_smid;
		this.s_ct = s_ct;
		this.s_att = s_att;
		this.s_sem = s_sem;
		this.s_ccode = s_ccode;
		this.s_password = s_password;
	}
	

	
	public Mark(String s_reg,String s_password) {
	
		this.s_reg = s_reg;
		this.s_password = s_password;
	}
	
	public Mark() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getS_roll() {
		return s_roll;
	}

	public void setS_roll(String s_roll) {
		this.s_roll = s_roll;
	}

	public String getS_reg() {
		return s_reg;
	}

	public void setS_reg(String s_reg) {
		this.s_reg = s_reg;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_fmid() {
		return s_fmid;
	}

	public void setS_fmid(String s_fmid) {
		this.s_fmid = s_fmid;
	}

	public String getS_smid() {
		return s_smid;
	}

	public void setS_smid(String s_smid) {
		this.s_smid = s_smid;
	}

	public String getS_ct() {
		return s_ct;
	}

	public void setS_ct(String s_ct) {
		this.s_ct = s_ct;
	}

	public String getS_att() {
		return s_att;
	}

	public void setS_att(String s_att) {
		this.s_att = s_att;
	}

	public String getS_sem() {
		return s_sem;
	}

	public void setS_sem(String s_sem) {
		this.s_sem = s_sem;
	}

	public String getS_ccode() {
		return s_ccode;
	}

	public void setS_ccode(String s_ccode) {
		this.s_ccode = s_ccode;
	}

	public String getS_password() {
		return s_password;
	}

	public void setS_password(String s_password) {
		this.s_password = s_password;
	}
	
	 public void removeMarkRoll() {
		 s_roll = null;
	 }
	 public void removeMarkReg() {
		 s_reg = null;
	 }
	 public void removeMarkName() {
		 s_name = null;
	 }
	 public void removeMarkFristMid() {
		 s_fmid = null;
	 }
	 
	 public void removeMarkSecondMid() {
		 s_smid = null;
	 }
	 
	 public void removeMarkClassTest() {
		 s_ct = null;
	 }
	 public void removeMarkAttendence() {
		 s_att = null;
	 }
	 
	 public void removeMarkSemester() {
		 s_sem = null;
	 }
	 
	 public void removeMarkCourseCode() {
		 s_ccode = null;
	 }
	 
	
	public boolean isValid() {
	     return valid;
	}

	public void setValid(boolean newValid) {
	      valid = newValid;
	}   
	
	
	
	

}
