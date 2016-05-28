package dto;

public class CalendarDto implements Dto{
	private int cid;
	private int cnt;
	private String cName;
	private boolean isActive;
	
	public CalendarDto(){
		
	}
	
	public CalendarDto(int cid, int cnt, String cName, boolean isActive) {
		super();
		this.cid = cid;
		this.cnt = cnt;
		this.cName = cName;
		this.isActive = isActive;
	}
	
	public int getCid(){
		return cid;
	}
	public int getCnt(){
		return cnt;
	}
	public String getCName(){
		return cName;
	}
	public boolean getIsActive(){
		return isActive;
	}
	
	public void setCid(int cid){
		this.cid = cid;
	}
	public void setCnt(int cnt){
		this.cnt = cnt;
	}
	public void setCName(String cName){
		this.cName = cName;
	}
	public void setIsActive(boolean isActive){
		this.isActive = isActive;
	}
}
