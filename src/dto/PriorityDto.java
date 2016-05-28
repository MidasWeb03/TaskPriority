package dto;

public class PriorityDto {
	private String email;
	private int priority_left;
	private int priority_prio;
	private int priority_past;
	private boolean priority_team;

	public PriorityDto(){
		email = null;
		priority_left = 1;
		priority_prio = 2;
		priority_past = 3;
		priority_team = true;
	}

	public PriorityDto(String email, int priority_left, int priority_Prio, int priority_past, boolean priority_team) {
		super();
		this.email = email;
		this.priority_left = priority_left;
		this.priority_prio = priority_Prio;
		this.priority_past = priority_past;
		this.priority_team = priority_team;
	}
	
}
