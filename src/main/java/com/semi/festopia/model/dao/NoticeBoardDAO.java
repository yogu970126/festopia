package com.semi.festopia.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.festopia.model.vo.NoticeBoard;
import com.semi.festopia.model.vo.User;

@Repository
public class NoticeBoardDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<NoticeBoard> boardList() {
		System.out.println(session.selectList("noticeMapper.boardList"));
		return session.selectList("noticeMapper.boardList");
	}
	
	public int adminWrite(NoticeBoard board) {
		return session.insert("noticeMapper.adminWrite", board);
	}
	
	// 게시글 상세 페이지
	public NoticeBoard noticeView(int no) {
		return session.selectOne("noticeMapper.viewNotice", no);
	}
}
