package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn.conn2DB;
import dto.Dto;
import dto.MemberDto;

public class MemberDao implements Dao{
	private conn2DB c2db;
	private static MemberDao memDao = null;
	private MemberDao(){
		c2db = new conn2DB();
	}
	public static Dao getInstance(){
		if(memDao == null){
			memDao = new MemberDao();
		}
		return (Dao)memDao;
	}
	@Override
	public boolean addTuple(Dto dto){
		String sql = " insert into challengeDB.Member "
				+ " (Name, Email, Password) "
				+ " values(?, ?, ?) ";
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberDto memdto = (MemberDto)dto; 
		int resultCnt = 0;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memdto.getName());
			psmt.setString(2, memdto.getEmail());
			psmt.setString(3, memdto.getPwd());
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
	@Override
	public boolean deleteTuple(Dto dto){
		String sql = "delete from challengeDB.Member"
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
	@Override
	public boolean updateTuple(Dto dto){
		String sql = "update challengeDB.Member set";
		String pwd=null,name=null,email=null,auth=null;
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberDto memdto = (MemberDto)dto;
		email = memdto.getEmail();
		if(email == null) return false;
		if((pwd=memdto.getPwd())!=null) sql += " Password=?,";
		if((name=memdto.getName())!=null) sql += " Name=?";
		sql += " where Email=?";
		boolean result = false;
		int idx=1;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			if(pwd != null) psmt.setString(idx++, pwd);
			if(name != null) psmt.setString(idx++, name);
			psmt.setString(idx, email);
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
		String sql = "select * from challengeDB.Member"
				+ " where Email = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberDto memdto = (MemberDto)dto;
		int result = 0;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memdto.getEmail());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			log("an error from [MemberDao.deleteTuple()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		if(result==0){
			return null;
		} else {
			return dto;
		}
	}
	public List<Dto> readAllTuple(){
		List<Dto> dtoList = new ArrayList<Dto>();
		String sql = "select * from challengeDB.Member order by Email";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String name, email, pwd;
		try{
			conn = c2db.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()){
		        name = rs.getString("Name");
		        email = rs.getString("Email");
		        pwd = rs.getString("Password");
		        dtoList.add((Dto)(new MemberDto(name,email,pwd)));
		    }
		} catch(Exception e) {
			log("an error from [MemberDao.deleteTuple()]", e);
		} finally {
			c2db.close(conn, psmt, null);
		}
		return dtoList;
	}
	public void log(String str){
		System.out.println(str);
	}
	public void log(String str, Exception e){
		System.out.print(str+" ");
		e.printStackTrace();
	}
}
