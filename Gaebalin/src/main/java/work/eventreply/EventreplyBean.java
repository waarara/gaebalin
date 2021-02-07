package work.eventreply;

import java.io.Serializable;

public class EventreplyBean implements Serializable{
	private String eventNo;     //행사번호
	private String userCode;     //유저코드
	private int userReplyNo;	 //댓글일련번호
	private String userReply;    //댓글내용
	private String replyDate;    //댓글날짜

	public EventreplyBean() {
		super();
	}

	public EventreplyBean(String eventNo, String userCode, int userReplyNo,
			String userReply, String replyDate) {
		super();
		this.eventNo = eventNo;
		this.userCode = userCode;
		this.userReplyNo = userReplyNo;
		this.userReply = userReply;
		this.replyDate = replyDate;
	}

	public String geteventNo() {
		return eventNo;
	}

	public void seteventNo(String eventNo) {
		this.eventNo = eventNo;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public int getUserReplyNo() {
		return userReplyNo;
	}

	public void setUserReplyNo(int userReplyNo) {
		this.userReplyNo = userReplyNo;
	}

	public String getUserReply() {
		return userReply;
	}

	public void setUserReply(String userReply) {
		this.userReply = userReply;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProreplyBean [eventNo=");
		builder.append(eventNo);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", userReplyNo=");
		builder.append(userReplyNo);
		builder.append(", userReply=");
		builder.append(userReply);
		builder.append(", replyDate=");
		builder.append(replyDate);
		builder.append("]");
		return builder.toString();
	}
}
