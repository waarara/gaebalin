package work.user;

import java.io.Serializable;

public class UserBean implements Serializable{
	private String userCode;         //유저코드
	private String id;               //아이디
	private String pw;               //패스워드
	private String email;            //이메일
	private String userImage;        //유저이미지
	private String postNum;          //우편번호
	private String phoneNum;         //전화번호뒷자리
	private String address;          //주소
	private String grade;			 //회원등급
	private String connectDate;		//최근 접속날짜
	private String nickName;		//닉네임

	public UserBean() {
		super();
	}

	public UserBean(String userCode, String id, String pw, String email,
			String userImage, String postNum,
			String phoneNum, String address,
			String grade, String connectDate, String nickName) {
		super();
		this.userCode = userCode;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.userImage = userImage;
		this.postNum = postNum;
		this.phoneNum = phoneNum;
		this.address = address;
		this.grade = grade;
		this.connectDate = connectDate;
		this.nickName = nickName;
	}


	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getConnectDate() {
		return connectDate;
	}

	public void setConnectDate(String connectDate) {
		this.connectDate = connectDate;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserBean [userCode=");
		builder.append(userCode);
		builder.append(", id=");
		builder.append(id);
		builder.append(", pw=");
		builder.append(pw);
		builder.append(", email=");
		builder.append(email);
		builder.append(", userImage=");
		builder.append(userImage);
		builder.append(", postNum=");
		builder.append(postNum);
		builder.append(", phoneNum=");
		builder.append(phoneNum);
		builder.append(", address=");
		builder.append(address);
		builder.append(", grade=");
		builder.append(grade);
		builder.append(", connectDate=");
		builder.append(connectDate);
		builder.append(", nickName=");
		builder.append(nickName);
		builder.append("]");
		return builder.toString();
	}
}
