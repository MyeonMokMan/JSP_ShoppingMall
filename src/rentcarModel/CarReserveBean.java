package rentcarModel;

public class CarReserveBean {
	
	private int reserveNo;
	private int no;
	private String id;
	private int qty;
	//대여 기간
	private int dDay;
	//대여일 (Date타입 x)
	private String rDay;
	private int useIn;
	private int useWifi;
	private int useNavi;
	private int useSeat;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public String getrDay() {
		return rDay;
	}
	public void setrDay(String rDay) {
		this.rDay = rDay;
	}
	public int getUseIn() {
		return useIn;
	}
	public void setUseIn(int useIn) {
		this.useIn = useIn;
	}
	public int getUseWifi() {
		return useWifi;
	}
	public void setUseWifi(int useWifi) {
		this.useWifi = useWifi;
	}
	public int getUseNavi() {
		return useNavi;
	}
	public void setUseNavi(int useNavi) {
		this.useNavi = useNavi;
	}
	public int getUseSeat() {
		return useSeat;
	}
	public void setUseSeat(int useSeat) {
		this.useSeat = useSeat;
	}
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
