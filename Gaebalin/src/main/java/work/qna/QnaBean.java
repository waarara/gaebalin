package work.qna;

import java.io.Serializable;

public class QnaBean implements Serializable{
	private String qnaNo;        //문의번호
	private String userCode;       //유저코드
	private String qnaTitle;        //문의제목
	private String qnaContents;        //문의내용
	private String qnaDate;        //문의날짜
	private String qnaCategoryCd;        //문의종류
	private String responseUser;        //문의종류
	private int qnaDepth;        //대댓글정보
	private String groupNo;        //문의그룹번호
	
	public QnaBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnaBean(String qnaNo, String userCode, String qnaTitle, String qnaContents, String qnaDate,
			String qnaCategoryCd, String responseUser, int qnaDepth, String groupNo) {
		super();
		this.qnaNo = qnaNo;
		this.userCode = userCode;
		this.qnaTitle = qnaTitle;
		this.qnaContents = qnaContents;
		this.qnaDate = qnaDate;
		this.qnaCategoryCd = qnaCategoryCd;
		this.responseUser = responseUser;
		this.qnaDepth = qnaDepth;
		this.groupNo = groupNo;
	}

	public String getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public String getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaCategoryCd() {
		return qnaCategoryCd;
	}

	public void setQnaCategoryCd(String qnaCategoryCd) {
		this.qnaCategoryCd = qnaCategoryCd;
	}
	
	
	public String getResponseUser() {
		return responseUser;
	}

	public void setResponseUser(String responseUser) {
		this.responseUser = responseUser;
	}
	
	public int getQnaDepth() {
		return qnaDepth;
	}

	public void setQnaDepth(int qnaDepth) {
		this.qnaDepth = qnaDepth;
	}

	public String getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}

	@Override
	public String toString() {
		return "QnaBean [qnaNo=" + qnaNo + ", userCode=" + userCode + ", qnaTitle=" + qnaTitle + ", qnaContents="
				+ qnaContents + ", qnaDate=" + qnaDate + ", qnaCategoryCd=" + qnaCategoryCd + ", responseUser="
				+ responseUser + ", qnaDepth=" + qnaDepth + ", groupNo=" + groupNo + "]";
	}

	
	
}
