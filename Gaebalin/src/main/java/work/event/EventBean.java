package work.event;

public class EventBean {
	private String eventNo;        //제품코두
	private String eventImage;       //제품이미지
	private String eventTitle;        //제품이름
 	private int eventUnitPrice;      //제품단가
	private String eventCategoryCd;  //제품분류
	private String eventContents;
	private String eventDate;
	private String eventTimeCd;
	private String eventLoc;
	private int eventCurPop;
	private int eventMaxPop;
	private String eventRegDate;     //제품등록일
	private String eventYn;
	
	public EventBean() {
		super();
	}

	public EventBean(String eventNo, String eventImage, String eventTitle,
			int eventUnitPrice, String eventCategoryCd, String eventContents, String eventDate,
			String eventTimeCd, String eventLoc, int eventCurPop, int eventMaxPop, String eventRegDate, String eventYn) {
		super();
		this.eventNo = eventNo;
		this.eventImage = eventImage;
		this.eventTitle = eventTitle;
		this.eventUnitPrice = eventUnitPrice;
		this.eventCategoryCd = eventCategoryCd;
		this.eventContents = eventContents;
		this.eventDate = eventDate;
		this.eventTimeCd = eventTimeCd;
		this.eventLoc = eventLoc;
		this.eventCurPop = eventCurPop;
		this.eventMaxPop = eventMaxPop;
		this.eventRegDate = eventRegDate;
		this.eventYn = eventYn;
	}

	public String getEventNo() {
		return eventNo;
	}

	public void setEventNo(String eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventImage() {
		return eventImage;
	}

	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public int getEventUnitPrice() {
		return eventUnitPrice;
	}

	public void setEventUnitPrice(int eventUnitPrice) {
		this.eventUnitPrice = eventUnitPrice;
	}

	public String getEventCategoryCd() {
		return eventCategoryCd;
	}

	public void setEventCategoryCd(String eventCategoryCd) {
		this.eventCategoryCd = eventCategoryCd;
	}

	public String getEventContents() {
		return eventContents;
	}

	public void setEventContents(String eventContents) {
		this.eventContents = eventContents;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventTimeCd() {
		return eventTimeCd;
	}

	public void setEventTimeCd(String eventTimeCd) {
		this.eventTimeCd = eventTimeCd;
	}

	public String getEventLoc() {
		return eventLoc;
	}

	public void setEventLoc(String eventLoc) {
		this.eventLoc = eventLoc;
	}

	public int getEventCurPop() {
		return eventCurPop;
	}

	public void setEventCurPop(int eventCurPop) {
		this.eventCurPop = eventCurPop;
	}

	public int getEventMaxPop() {
		return eventMaxPop;
	}

	public void setEventMaxPop(int eventMaxPop) {
		this.eventMaxPop = eventMaxPop;
	}

	public String getEventRegDate() {
		return eventRegDate;
	}

	public void setEventRegDate(String eventRegDate) {
		this.eventRegDate = eventRegDate;
	}
	
	public String getEventYn() {
		return eventYn;
	}

	public void setEventYn(String eventYn) {
		this.eventYn = eventYn;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EventBean [eventNo=");
		builder.append(eventNo);
		builder.append(", eventImage=");
		builder.append(eventImage);
		builder.append(", eventTitle=");
		builder.append(eventTitle);
		builder.append(", eventUnitPrice=");
		builder.append(eventUnitPrice);
		builder.append(", eventCategoryCd=");
		builder.append(eventCategoryCd);
		builder.append(", eventContents=");
		builder.append(eventContents);
		builder.append(", eventDate=");
		builder.append(eventDate);
		builder.append(", eventTimeCd=");
		builder.append(eventTimeCd);
		builder.append(", eventLoc=");
		builder.append(eventLoc);
		builder.append(", eventCurPop=");
		builder.append(eventCurPop);
		builder.append(", eventMaxPop=");
		builder.append(eventMaxPop);
		builder.append(", eventRegDate=");
		builder.append(eventRegDate);
		builder.append(", eventYn=");
		builder.append(eventYn);
		builder.append("]");
		return builder.toString();
	}
}
