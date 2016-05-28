package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn.conn2DB;
import dto.Dto;
import dto.FriendDto;
import dto.MemberDto;

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
		String sql = " insert into challenge_db.Friend "
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
		String sql = "delete from challenge_db.Friend"
				+ " where MEmail = ? and FEmail = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		FriendDto fridto = (FriendDto)dto; 
		boolean result = false;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, fridto.getMEmail());
			psmt.setString(2, fridto.getFEmail());
			result = psmt.execute();
		} catch(Exception e) {
			log("an error from [MemberDao.deleteTuple()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		if(result){
			return true;
		} else {
			return false;
		}
	}
	public boolean deleteAllFriends(Dto dto){
		String sql = "delete from challenge_db.Friend"
				+ " where MEmail = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		FriendDto fridto = (FriendDto)dto; 
		boolean result = false;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, fridto.getMEmail());
			result = psmt.execute();
		} catch(Exception e) {
			log("an error from [MemberDao.deleteTuple()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		if(result){
			return true;
		} else {
			return false;
		}
	}
	public boolean updateTuple(Dto dto){
		return false; // trivial method
	}
	public Dto readTuple(Dto dto){
		return null;	// trivial method
	}
	public List<Dto> readAllFriends(Dto dto){
		List<Dto> fList = new ArrayList<Dto>();
		String sql = "select * from challenge_db.Friend where MEmail = ? order by FEmail";
		Connection conn = null;
		PreparedStatement psmt = null;
		FriendDto fridto = (FriendDto)dto; 
		ResultSet rs = null;
		String memail, femail;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, fridto.getMEmail());
			rs = psmt.executeQuery();
			while (rs.next()){
		        memail = rs.getString("MEmail");
		        femail = rs.getString("FEmail");
		        fList.add((Dto)(MemberDao.getInstance().readTuple(new MemberDto("",femail,""))));
		    }
		} catch(Exception e) {
			log("an error from [MemberDao.deleteTuple()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		return fList;
	}
	
	public void log(String str){
		System.out.println(str);
	}
	public void log(String str, Exception e){
		System.out.print(str+" ");
		e.printStackTrace();
	}
}
