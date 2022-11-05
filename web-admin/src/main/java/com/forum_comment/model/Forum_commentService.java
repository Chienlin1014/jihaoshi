package com.forum_comment.model;

import java.sql.Date;
import java.util.List;

import com.forum_comment.model.Forum_commentDAO_interface;
import com.forum_comment.model.Forum_commentJDBCDAO;
import com.forum_comment.model.Forum_commentVO;

public class Forum_commentService {
		private Forum_commentDAO_interface dao;

		public Forum_commentService() {
			dao = new Forum_commentJDBCDAO();
		}

		public Forum_commentVO addForum_comment(Integer article_no, Integer member_no,
				Date comment_time, String comment_content, Integer  comment_status) {

			Forum_commentVO forum_commentVO = new Forum_commentVO();
			forum_commentVO.setArticle_no(article_no);
			forum_commentVO.setMember_no(member_no);
			forum_commentVO.setComment_time(comment_time);
			forum_commentVO.setComment_content(comment_content);
			forum_commentVO.setComment_status(comment_status);
			dao.insert(forum_commentVO);
			return forum_commentVO;
		}

		public Forum_commentVO updateForum_comment(Integer article_no, Integer member_no,
			Date comment_time, String comment_content, Integer comment_status) {
			Forum_commentVO forum_commentVO = new Forum_commentVO();
			forum_commentVO.setArticle_no(article_no);
			forum_commentVO.setMember_no(member_no);
			forum_commentVO.setComment_time(comment_time);
			forum_commentVO.setComment_content(comment_content);
			forum_commentVO.setComment_status(comment_status);
			dao.update(forum_commentVO);
			return forum_commentVO;

		}

		public void deleteForum_comment(Integer comment_no) {
			dao.delete(comment_no);
		}

		public Forum_commentVO getOneForum_comment(Integer comment_no) {
			return dao.findByPrimarykey(comment_no);
		}

		public List<Forum_commentVO> getAll() {
			return dao.getAll();
		}

	}

