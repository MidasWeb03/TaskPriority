package dto;

public class MemberDto implements Dto {
	private String name;
	private String email;
	private String pwd;
	
	public MemberDto(){
		
	}
	
	public MemberDto(String name, String email, String pwd) {
		super();
		this.name = name;
		this.email = email;
		this.pwd = pwd;
	}
	
	public String getName(){
		return this.name;
	}
	public String getEmail(){
		return this.email;
	}
	public String getPwd(){
		return this.pwd;
	}
	
	public void setName(String name){
		this.name = name;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public void setPwd(String pwd){
		this.pwd = pwd;
	}
	
}
