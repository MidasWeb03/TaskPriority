package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import conn.conn2DB;
import dto.Dto;
import dto.FriendDto;

public class FriendDao implements Dao{ 
	private conn2DB c2db;
	private static FriendDao friDao = null;
	private FriendDao(){
		c2db = new conn2DB();
	}
	public static Dao getInstance(){
		if(friDao == null){
			friDao = new FriendDao();
		}
		return (Dao)friDao;
	}
	public boolean addTuple(Dto dto){
		String sql = " insert into challengeDB.Friend "
				+ " (MEmail, FEmail) "
				+ " values(?, ?) ";
		Connection conn = null;
		PreparedStatement psmt = null;
		FriendDto fridto = (FriendDto)dto; 
		int resultCnt = 0;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, fridto.getMEmail());
			psmt.setString(2, fridto.getFEmail());
			resultCnt = psmt.executeUpdate();
		} catch (Exception e){
			log("an error from [MemberDao.addTuple()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		if(resultCnt == 1){
			return true;
		} else {
			return false;
		}
	}
	public boolean deleteTuple(Dto dto){
		
	}
	public boolean updateTuple(Dto dto){
		
	}
	public Dto readTuple(Dto dto){
		
	}
	
	public void log(String str){
		System.out.println(str);
	}
	public void log(String str, Exception e){
		System.out.print(str+" ");
		e.printStackTrace();
	}
}
