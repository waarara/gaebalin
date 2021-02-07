package work.reserve;

import java.io.Serializable;

public class ReserveBean implements Serializable{
	private String reserveNo;    //판매내역코드
	private String eventNo; //제품코드
	private String userCode;    //유저코드
	private int reservePrice;      //판매단가
	private int reservePop;      //판매수량
	private String reserveYn;		//판매여부
	private String reserveSellYn;		//판매여부
	private String reserveDate;    //판매일

	public ReserveBean() {
		super();
	}

	public ReserveBean(String reserveNo, String eventNo, String userCode,
			int reservePrice, int reservePop, String reserveYn, 
			String reserveSellYn, String reserveDate) {
		super();
		this.reserveNo = reserveNo;
		this.eventNo = eventNo;
		this.userCode = userCode;
		this.reservePrice = reservePrice;
		this.reservePop = reservePop;
		this.reserveYn = reserveYn;
		this.reserveSellYn = reserveSellYn;
		this.reserveDate = reserveDate;
	}
	
	public String getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(String reserveNo) {
		this.reserveNo = reserveNo;
	}

	public String getEventNo() {
		return eventNo;
	}

	public void setEventNo(String eventNo) {
		this.eventNo = eventNo;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public int getReservePrice() {
		return reservePrice;
	}

	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}

	public int getReservePop() {
		return reservePop;
	}

	public void setReservePop(int reservePop) {
		this.reservePop = reservePop;
	}

	public String getReserveYn() {
		return reserveYn;
	}

	public void setReserveYn(String reserveYn) {
		this.reserveYn = reserveYn;
	}

	public String getReserveSellYn() {
		return reserveSellYn;
	}

	public void setReserveSellYn(String reserveSellYn) {
		this.reserveSellYn = reserveSellYn;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReserveBean [reserveNo=");
		builder.append(reserveNo);
		builder.append(", eventNo=");
		builder.append(eventNo);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", reservePrice=");
		builder.append(reservePrice);
		builder.append(", reservePop=");
		builder.append(reservePop);
		builder.append(", reserveYn=");
		builder.append(reserveYn);
		builder.append(", reserveSellYn=");
		builder.append(reserveSellYn);
		builder.append(", reserveDate=");
		builder.append(reserveDate);
		builder.append("]");
		return builder.toString();
	}
}
