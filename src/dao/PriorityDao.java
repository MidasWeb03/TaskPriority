package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import conn.conn2DB;
import dto.Dto;
import dto.MemberDto;
import dto.PriorityDto;

public class PriorityDao implements Dao{
	private conn2DB c2db;
	private static PriorityDao priDao = null;
	private PriorityDao(){
		c2db = new conn2DB();
	}
	public static Dao getInstance(){
		if(priDao == null){
			priDao = new PriorityDao();
		}
		return (Dao)priDao;
	}
	public boolean addTuple(Dto dto){
		String sql = " insert into challenge_db.Priority "
				+ " (email, p_left, p_prio, p_past) "
				+ " values(?, ?, ?, ?) ";
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberDto memdto = (MemberDto)dto; 
		int resultCnt = 0;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memdto.getEmail());
			psmt.setInt(2,1);
			psmt.setInt(3,2);
			psmt.setInt(4,3);
			resultCnt = psmt.executeUpdate();
		} catch (Exception e){
			log("an error from [PriorityDao.addTuple()]", e);
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
		String sql = "delete from challenge_db.Priority"
				+ " where Email = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberDto memdto = (MemberDto)dto;
		boolean result = false;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memdto.getEmail());
			result = psmt.execute();
		} catch(Exception e) {
			log("an error from [PriorityDao.deleteTuple()]", e);
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
		return false;
	}
	public boolean updateTuple(Dto dto, int p_left, int p_prio, int p_past, boolean p_team){
		String sql = "update challenge_db.Priority "
					+"set"
					+" p_left=?,"
					+" p_prio=?,"
					+" p_past=?,"
					+" p_team=?"
					+" where Email=?";;
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberDto memdto = (MemberDto)dto;
		String email = memdto.getEmail();
		if(email == null){ 
			log("an error from [updateDao.deleteTuple()]");
			return false;
		}
		boolean result = false;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, p_left);
			psmt.setInt(2, p_prio);
			psmt.setInt(3, p_past);
			psmt.setBoolean(4, p_team);
			psmt.setString(5, email);
			result = psmt.execute();
		} catch(Exception e) {
			log("an error from [MemberDao.updateTuple()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		if(result){
			return true;
		} else {
			return false;
		}
	}
	public Dto readTuple(Dto dto){
		String sql = "select * from challenge_db.Priority"
				+ " where Email = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		int left, prio, past;
		boolean team;
		MemberDto memdto = (MemberDto)dto;
		String email = memdto.getEmail();
		ResultSet rs;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			if(rs.next()){
				left = rs.getInt("p_left");
				prio = rs.getInt("p_prio");
				past = rs.getInt("p_past");
				team = rs.getBoolean("p_team");
				return (Dto)(new PriorityDto(email, left, prio, past, team));
			}
		} catch(Exception e) {
			log("an error from [MemberDao.deleteTuple()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		return null;
	}
	public void log(String str){
		System.out.println(str);
	}
	public void log(String str, Exception e){
		System.out.print(str+" ");
		e.printStackTrace();
	}
}
