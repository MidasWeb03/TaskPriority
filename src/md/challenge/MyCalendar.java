package md.challenge;


public class MyCalendar {
	String email;
	String cname;
	int count;
	int cid;
	int tid;
	String taskName;
	String startDate;
	String writeDate;
	String endDate;
	String color;
	String description;
	int priority;
	
	
	public MyCalendar(String email, String cname, int count, int cid, int tid, String taskName, String startDate,
			String writeDate, String endDate, String color, String description, int priority) {
		super();
		this.email = email;
		this.cname = cname;
		this.count = count;
		this.cid = cid;
		this.tid = tid;
		this.taskName = taskName;
		this.startDate = startDate;
		this.writeDate = writeDate;
		this.endDate = endDate;
		this.color = color;
		this.description = description;
		this.priority = priority;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public int getTid() {
		return tid;
	}


	public void setTid(int tid) {
		this.tid = tid;
	}


	public String getTaskName() {
		return taskName;
	}


	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getPriority() {
		return priority;
	}


	public void setPriority(int priority) {
		this.priority = priority;
	}

	
	
	
}
