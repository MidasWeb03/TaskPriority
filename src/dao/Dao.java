package dao;

import dto.Dto;

public interface Dao {
	boolean addTuple(Dto dto);
	boolean deleteTuple(Dto dto);
	boolean updateTuple(Dto dto);
	void log(String str);
	void log(String str, Exception e);
}
