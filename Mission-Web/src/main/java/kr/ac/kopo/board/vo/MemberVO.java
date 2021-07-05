package kr.ac.kopo.board.vo;

public class MemberVO {
	
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String telPhone;
	private String post;
	private String addr;
	private String gender;
	private String reg_date;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String id, String pwd) {
		
		this.id = id;
		this.pwd = pwd;
	}

	public MemberVO(String id, String name, String pwd, String email, String telPhone, String post, String addr,
			String gender, String reg_date) {
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.telPhone = telPhone;
		this.post = post;
		this.addr = addr;
		this.gender = gender;
		this.reg_date = reg_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelPhone() {
		return telPhone;
	}

	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
