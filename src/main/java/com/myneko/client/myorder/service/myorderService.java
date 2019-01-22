package com.myneko.client.myorder.service;

import java.util.List;

import com.myneko.client.md.vo.MdVO;
import com.myneko.client.member.vo.MemberVO;
import com.myneko.client.myorder.vo.myorderVO;

public interface myorderService {

	public List<myorderVO> myorderList(myorderVO mvo);

	 public myorderVO myorderDetail(myorderVO mvo); 

	public List<MdVO> findProduct(int o_number); // 二쇰Ц踰덊샇 �븞�뿉 二쇰Ц�긽�뭹李얘린(�긽�뭹紐�, �뜽�꽕�씪 �벑�벑)

	public MemberVO findMember(int o_number); // 二쇰Ц�옄 �젙蹂�

	public myorderVO findOrder(int o_number); // 二쇰Ц�꽌 �젙蹂�

	public int myorderDelete(int o_number);
	
	public int myorderListCnt(myorderVO mvo);
	
	public int orderCancel(myorderVO mvo);
	
	public int myorderChange(myorderVO mvo);
	
	public int myorderAddressModify(myorderVO mvo);
	
}
