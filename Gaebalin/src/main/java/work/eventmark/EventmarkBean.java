package work.eventmark;

import java.io.Serializable;

public class EventmarkBean implements Serializable{
	private String eventNo;     //제품코드
	private String userCode;     //유저코드
	private int markRating;

	public EventmarkBean() {
		super();
	}

	public EventmarkBean(String eventNo, String userCode, int markRating) {
		super();
		this.eventNo = eventNo;
		this.userCode = userCode;
		this.markRating = markRating;
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

	public int getMarkRating() {
		return markRating;
	}

	public void setMarkRating(int markRating) {
		this.markRating = markRating;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MarkBean [eventNo=");
		builder.append(eventNo);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", markRating=");
		builder.append(markRating);
		builder.append("]");
		return builder.toString();
	}
}
