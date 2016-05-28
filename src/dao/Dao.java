package dao;

import java.util.List;

import dto.Dto;
import dto.MemberDto;

public interface Dao {
	boolean addTuple(Dto dto);
	boolean deleteTuple(Dto dto);
	boolean updateTuple(Dto dto);
	Dto readTuple(Dto dto);
	void log(String str);
	void log(String str, Exception e);
}
