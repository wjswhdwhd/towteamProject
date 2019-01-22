package com.myneko.client.myorder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myneko.client.md.vo.MdVO;
import com.myneko.client.member.vo.MemberVO;
import com.myneko.client.myorder.vo.myorderVO;

@Repository
public class myorderDaoImpl implements myorderDao {

	@Autowired
	private SqlSession session;

	// 二쇰Ц�궡�뿭
	@Override
	public List<myorderVO> myorderList(myorderVO mvo) {
		return session.selectList("myorderList", mvo);
	}

	
	  public myorderVO myorderDetail(myorderVO mvo) { return
	  (myorderVO)session.selectOne("myorderDetail", mvo); }
	 

	@Override
	public List<MdVO> findProduct(int o_number) {
		return session.selectList("findProduct", o_number);
	}

	@Override
	public MemberVO findMember(int o_number) {
		return (MemberVO) session.selectOne("findMember", o_number);
	}

	public myorderVO findOrder(int o_number) {
		return (myorderVO) session.selectOne("findOrder", o_number);
	}

	@Override
	public int myorderDelete(int o_number) {
		return session.delete("myorderDelete", o_number);
	}


	@Override
	public int myorderListCnt(myorderVO mvo) {
		return (Integer)session.selectOne("myorderListCnt", mvo);
	}


	@Override
	public int orderCancel(myorderVO mvo) {
		// TODO Auto-generated method stub
		return session.delete("orderCancel", mvo);
	}


	@Override
	public int myorderChange(myorderVO mvo) {
		// TODO Auto-generated method stub
		return session.update("myorderChange", mvo);
	}


	@Override
	public int myorderAddressModify(myorderVO mvo) {
		return session.update("myorderAddressModify",mvo);
	}

}
