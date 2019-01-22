package com.myneko.admin.member.service;

import java.util.List;

import com.myneko.admin.member.vo.AMemberVO;
import com.myneko.common.vo.StatsVO;

public interface AMemberService {
	public List<AMemberVO> MemberList(AMemberVO mvo);
	public int MemberCount(AMemberVO mvo);
	public List<StatsVO> memberStatusList(AMemberVO mvo);
	public int getMemberCount(AMemberVO mvo);
	public StatsVO memberStats(AMemberVO mvo);
}
