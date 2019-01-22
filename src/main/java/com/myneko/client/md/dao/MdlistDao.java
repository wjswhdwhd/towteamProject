package com.myneko.client.md.dao;

import java.util.List;

import com.myneko.client.cat.vo.CatVO;
import com.myneko.client.md.vo.MdVO;

public interface MdlistDao {

	public List<MdVO> allmdlist();
	
	public CatVO capcatinfo(int m_number);
	public MdVO customlist(String keyword);
	
	public MdVO mddetail(MdVO mdvo);
	
	public List<MdVO> mdlistcate(MdVO mdvo);
}
