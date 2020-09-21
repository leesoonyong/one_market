package com.honjok.app.info;

import java.util.List;
import java.util.Map;

import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommunityVO;
import com.honjok.app.vo.UploadVO;
import com.honjok.app.vo.CommReplyVO;
import com.honjok.app.vo.ReplyUploadVO;

public interface HonjokinfoService {
   
   public List<CommunityVO> selectAll(Map<String, Integer> pagingMap);

   public CommInfoVO select(String comSeq);

   public void delete(String comSeq);

   public void uptate(CommInfoVO comI);

   public int selectAllCount();
  
   public void insertCommInfoVO(CommInfoVO comI);
    
   public List<CommInfoVO> selectInfo(Map<String, Integer> pagingMap);

   public void FileUpload(UploadVO uploadvo);

   public List<UploadVO[]> getFileName(String comseq);

   public void insertReview(CommReplyVO commreplyvo);

   public void reviewUpload(ReplyUploadVO replyuploadvo);

   public List<CommReplyVO> getReview(String comSeq);

   public List<ReplyUploadVO> getReviewImg(String idx);

   public void inserLikesUp(String comSeq);

   public void inserLikesId(Map<String, String> map);

   public void delReviewUpload(String fileName);

   public void updateLikesDown(String comSeq);

   public void updateReview(Map<String, String> map);
 
   public List<CommunityVO> selectBest5();

   public void hitUpdate(String comSeq);

	public List<CommunityVO> selectSearch(Map<String, Object> pagingMap);

	public int selectAllCount(Map<String, Object> pagingMap);
   
}