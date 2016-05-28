package dto;

public class TaskDto implements Dto{
	private int tid;
	private int cid;
	private int priority;
	private String taskName;
	private String startDate;
	private String endDate;
	private String writeDate;
	private String color;
	private String description;
	
	public TaskDto(){
		
	}
	
	public TaskDto(int tid, int cid, int priority, String taskName, String startDate, String endDate, String writeDate,
			String color, String description) {
		super();
		this.tid = tid;
		this.cid = cid;
		this.priority = priority;
		this.taskName = taskName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.writeDate = writeDate;
		this.color = color;
		this.description = description;
	}
	
	public int getTid(){
		return tid;
	}
	public int getCid(){
		return cid;
	}
	public int getPriority(){
		return priority;
	}
	public String getTaskName(){
		return taskName;
	}
	public String getStartDate(){
		return startDate;
	}
	public String getEndDate(){
		return endDate;
	}
	public String getWriteDate(){
		return writeDate;
	}
	public String getColor(){
		return color;
	}
	public String getDescription(){
		return description;
	}
	
	public void setTid(int tid){
		this.tid = tid;
	}
	public void setCid(int cid){
		this.cid = cid;
	}
	public void setPriority(int priority){
		this.priority = priority;
	}
	public void setTaskName(String taskName){
		this.taskName = taskName;
	}
	public void setStartDate(String startDate){
		this.startDate = startDate;
	}
	public void setEmdDate(String endDate){
		this.endDate = endDate;
	}
	public void setWriteDate(String writeDate){
		this.writeDate = writeDate;
	}
	public void setColor(String color){
		this.color = color;
	}
	public void setDescription(String description){
		this.description = description;
	}
	
}
