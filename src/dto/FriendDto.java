package dto;

public class FriendDto implements Dto{
	private String mEmail;
	private String fEmail;
	
	public FriendDto(String mEmail, String fEmail) {
		super();
		this.mEmail = mEmail;
		this.fEmail = fEmail;
	}
	
	public String getMEmail(){
		return mEmail;
	}
	public String getFEmail(){
		return fEmail;
	}
	
	public void setMEmail(String mEmail){
		this.mEmail = mEmail;
	}
	public void setFEmail(String fEmail){
		this.fEmail = fEmail;
	}
}
