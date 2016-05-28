package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn.conn2DB;
import dto.CalendarDto;
import dto.Dto;
import dto.MemberDto;

public class CalendarDao implements Dao{
	private conn2DB c2db;
	private static CalendarDao calDao;
	public static Dao getInstance(){
		if(calDao == null){
			calDao = new CalendarDao();
		}
		return (Dao)calDao;
	}
	private CalendarDao() {
		// TODO Auto-generated constructor stub
		c2db = new conn2DB();
	}
	// create
	public boolean addCalendar(Dto dto, String cname){
		String sql1 = "insert into challengeDB.Calendar "
				+ " (cname,email) "
				+ " values(?, 'elliottful@naver.com') ";
		String sql2 = "select last_insert_id()";
		String sql3 = "insert into challengeDB.calChecked "
				+ " (Memail, cid)"
				+ " values(?, ?)";
		MemberDto memdto = (MemberDto)dto;
		Connection conn = null;
		PreparedStatement psmt1 = null,psmt2 = null,psmt3 = null;
		int cnt=0;
		ResultSet rs;
		try{
			conn = c2db.getConnection();
			psmt1 = conn.prepareStatement(sql1);
			psmt1.setString(1, cname);
			cnt = psmt1.executeUpdate();
			if(cnt==0) return false;
			psmt2 = conn.prepareStatement(sql2);
			rs = psmt2.executeQuery();
			if(rs.next()){
				psmt3 = conn.prepareStatement(sql3);
				System.out.println(memdto.getEmail());
				psmt3.setString(1, memdto.getEmail());
				psmt3.setInt(2, rs.getInt("last_insert_id()"));
				cnt = psmt3.executeUpdate();
				if(cnt==0) return false;
			}
		} catch(Exception e) {
			log("an error from [CalendarDao.addCalendar()]", e);
		} finally {
			c2db.close(conn, psmt1, null);
			c2db.close(null, psmt2, null);
			c2db.close(null, psmt3, null);
		}
		return true;
	}
	public boolean addTuple(Dto dto){
		
		return true;
	}
	// delete
	public boolean deleteCalendar(CalendarDto caldto){
		String sql = "delete from challengeDB.Calendar where cid=?";
		Connection conn = null;
		PreparedStatement psmt = null;
		boolean result;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, caldto.getCid());
			result = psmt.execute();
			if(!result) return false; 
		} catch(Exception e) {
			log("an error from [CalendarDao.deleteCalendar()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		return true;
	}
	public boolean deleteTuple(Dto dto){
		return true;
	}
	// update
	public boolean updateTuple(Dto dto){
		return true;
	}
	// read
	public Dto readTuple(Dto dto){
		return null;
	}
		// please use dto as MemberDto param
	public List<Dto> readAllTuple(Dto dto){
		List<Dto> dtoList = new ArrayList<Dto>();
		MemberDto memdto = (MemberDto)dto;
		ResultSet rs1, rs2;
		Connection conn = null;
		PreparedStatement psmt1 = null, psmt2 = null;
		int cid;
		String sql1 = "select cid, onOff "
				+ "from challengeDB.Member as m, challengeDB.calchecked as c "
				+ "where m.email = c.MEmail and m.email = ?";
		String sql2 = "select cname "
				+ "from challengeDB.calendar as c "
				+ "where c.cid = ?";
		try{
			conn = c2db.getConnection();
			psmt1 = conn.prepareStatement(sql1);
			psmt1.setString(1, memdto.getEmail());
			rs1 = psmt1.executeQuery();
			while(rs1.next()){
				psmt2 = conn.prepareStatement(sql2);
				psmt2.setInt(1, rs1.getInt("cid"));
				System.out.println(rs1.getInt("cid")+"===========");
				System.out.println("1");
				rs2 = psmt2.executeQuery();
				System.out.println("2");
				if(rs2.next()){
					System.out.println(3);
					CalendarDto caldto = 
							new CalendarDto(rs1.getInt("cid"), 1, rs2.getString("cname"), rs1.getBoolean("onOff"));
					dtoList.add((Dto)caldto);
				}
			}
		} catch (Exception e){
			log("an error from [MemberDao.readAllTuple()]", e);
		} finally {
			c2db.close(conn, psmt1, null);
			c2db.close(null, psmt2, null);
		}
		return dtoList;
	}
	// log
	public void log(String str){
		System.out.println(str);
	}
	public void log(String str, Exception e){
		System.out.print(str+" ");
		e.printStackTrace();
	}
}
